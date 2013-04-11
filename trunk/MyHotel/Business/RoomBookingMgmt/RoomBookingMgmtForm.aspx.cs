using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui;
using DayPilot.Utils;
using MyHotel.Business;
using System.IO;
using MyHotel.Utils;
using System.Globalization;
using System.Web.Security;
using MyHotel.Business.Entity;

namespace MyHotel.Business.RoomBookingMgmt
{
    public partial class RoomBookingMgmtForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                if (ScriptManager.GetCurrent(Page) == null)
                {
                    Page.Form.Controls.AddAt(0, new ScriptManager());
                }
                if (!Page.IsPostBack)
                {
                    initData();
                }
                updateVisiblePeriod();
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void initData()
        {
            dayPilotScheduler.Resources.Clear();
            foreach (var item in RoomBookingMgmtController.GetRooms())
            {
                dayPilotScheduler.Resources.Add(item.Name, item.RoomID.ToString());
            }

            initCalendar();
        }

        private void initCalendar()
        {
            if (string.IsNullOrEmpty(datePickeStart.Text))
            {
                datePickeStart.Text = RoomBookingMgmtController.GetDefaultStartDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderStart.Format = HelperCommon.DateFormat;
            }
            if (string.IsNullOrEmpty(datePickeEnd.Text))
            {
                datePickeEnd.Text = RoomBookingMgmtController.GetDefaultEndDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderEnd.Format = HelperCommon.DateFormat;
            }
        }

        private void updateVisiblePeriod(string message = "")
        {
            if (!string.IsNullOrEmpty(datePickeStart.Text) && !string.IsNullOrEmpty(datePickeEnd.Text))
            {
                dayPilotScheduler.StartDate = DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                dayPilotScheduler.Days = (int)(DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture) - DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture)).TotalDays + 1;
                dayPilotScheduler.DataSource = RoomBookingMgmtController.GetRoomBookings(dayPilotScheduler.StartDate, dayPilotScheduler.StartDate.AddDays(dayPilotScheduler.Days));
                dayPilotScheduler.DataBind();
                if (Page.IsPostBack)
                {
                    if (string.IsNullOrEmpty(message))
                    {
                        dayPilotScheduler.Update();
                    }
                    else
                    {
                        dayPilotScheduler.UpdateWithMessage(message);
                    }
                }
            }
            else
            {
                initCalendar();
            }
        }

        protected void dayPilotScheduler_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
        {
            string message = null;

            if (!RoomBookingMgmtController.IsRoomBookingFree(int.Parse(e.Value), int.Parse(e.Resource), e.NewStart, e.NewEnd))
            {
                message = "Бронь не може перекриватись іншою броню";
            }
            else if (e.OldStart < DateTime.Today)
            {
                message = "Ця бронь не може бути змінена";
            }
            else if (e.NewStart < DateTime.Today)
            {
                message = "Ця бронь не може бути переміщена в минуле";
            }
            else
            {
                var roomBookingEntity = RoomBookingMgmtController.GetRoomBookingByID(int.Parse(e.Value));
                roomBookingEntity.StartDate = e.NewStart;
                roomBookingEntity.EndDate = e.NewEnd;
                RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            }
            updateVisiblePeriod(message);
        }

        protected void dayPilotScheduler_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        {
            string message = null;

            if (!RoomBookingMgmtController.IsRoomBookingFree(int.Parse(e.Value), int.Parse(e.NewResource), e.NewStart, e.NewEnd))
            {
                message = "Бронь не може перекриватись іншою броню";
            }
            else if (e.OldStart < DateTime.Today)
            {
                message = "Ця бронь не може бути змінена";
            }
            else if (e.NewStart < DateTime.Today)
            {
                message = "Ця бронь не може бути переміщена в минуле";
            }
            else
            {
                var roomBookingEntity = RoomBookingMgmtController.GetRoomBookingByID(int.Parse(e.Value));
                roomBookingEntity.StartDate = e.NewStart;
                roomBookingEntity.EndDate = e.NewEnd;
                roomBookingEntity.RoomID = int.Parse(e.NewResource);
                RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            }
            updateVisiblePeriod(message);
        }

        protected void dayPilotScheduler_BeforeTimeHeaderRender(object sender, DayPilot.Web.Ui.Events.BeforeTimeHeaderRenderEventArgs e)
        {
            if (e.IsColGroup)
            {
                e.InnerHTML = e.Start.ToString("MMMM-yyyy");  // sets the group header
            }
            else
            {
                // sets the column header
                if (e.Start.DayOfWeek == DayOfWeek.Sunday)
                {
                    e.InnerHTML = @"<span class=""sundayheaderstyle""> <strong>" + e.Start.ToString("dd (ddd)") + "</strong> </span>";
                }
                else
                {
                    e.InnerHTML = e.Start.ToString("dd (ddd)");
                }
            }
        }

        protected void dayPilotScheduler_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs e)
        {
            if (e.Start < DateTime.Today)
            {
                e.CssClass = "pastday";
            }
            else if (e.Start.DayOfWeek == DayOfWeek.Sunday)
            {
                e.CssClass = "sundaycellstyle";
            }
            else
            {
                e.CssClass = "weekday";
            }
        }

        protected void dayPilotScheduler_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.Scheduler.BeforeEventRenderEventArgs e)
        {
            if (e.DataItem != null)
            {
                var roomBookingEntity = e.DataItem.Source as RoomBookingEntity;
                if (roomBookingEntity != null)
                {
                    e.InnerHTML = String.Format("{0} ({1})", roomBookingEntity.GuestName, roomBookingEntity.GuestPhone);
                    if (!string.IsNullOrEmpty(roomBookingEntity.AdditionalInfo))
                    {
                        e.InnerHTML = e.InnerHTML + String.Format("<br />Інфо: {0}", roomBookingEntity.AdditionalInfo);
                    }
                }
            }
            EBookingStatus status = (EBookingStatus)Convert.ToInt32(e.Tag["BookingStatus"]);
            string cssClassName = "event" + status.ToString();
            e.ToolTip = status.ToString();
            e.InnerHTML = e.InnerHTML + String.Format("<br /><span class='" + cssClassName + "' >{0}</span>", e.ToolTip);
        }

        protected void datePickeStart_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void datePickeEnd_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void linkButtonSignOut_Click(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
            }
            Response.Redirect("/LoginForm.aspx");
        }
    }
}