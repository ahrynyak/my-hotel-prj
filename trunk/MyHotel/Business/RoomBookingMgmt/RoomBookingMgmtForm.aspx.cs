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

namespace MyHotel.Business.RoomBookingMgmt
{
    public partial class RoomBookingMgmtForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                initData();
            }
            updateVisiblePeriod();
        }

        private void initData()
        {
            dayPilotScheduler.Resources.Clear();
            foreach (var item in RoomBookingMgmtController.GetRooms())
            {
                dayPilotScheduler.Resources.Add(item.Name, item.RoomID.ToString());
            }
            if (datePickeStart.SelectedDate == DateTime.MinValue)
            {
                datePickeStart.SelectedDate = RoomBookingMgmtController.GetDefaultStartDate();
            }
            if (datePickeEnd.SelectedDate == DateTime.MinValue)
            {
                datePickeEnd.SelectedDate = RoomBookingMgmtController.GetDefaultEndDate();
            }
        }

        private void updateVisiblePeriod(string message = "")
        {
            dayPilotScheduler.StartDate = datePickeStart.SelectedDate;
            dayPilotScheduler.Days = (int)(datePickeEnd.SelectedDate - dayPilotScheduler.StartDate).TotalDays + 1;
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
                    dayPilotScheduler.Update(message);
                }
            }
        }

        protected void datePickeStart_SelectionChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void datePickeEnd_SelectionChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void dayPilotScheduler_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
        {
            string message = null;

            if (!RoomBookingMgmtController.IsRoomBookingFree(int.Parse(e.Value), int.Parse(e.Resource), e.NewStart, e.NewEnd))
            {
                message = "The reservation cannot overlap with an existing reservation.";
            }
            else if (e.OldEnd <= DateTime.Today)
            {
                message = "This reservation cannot be changed anymore.";
            }
            else if (e.NewStart < DateTime.Today)
            {
                message = "The reservation cannot be moved to the past.";
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
                message = "The reservation cannot overlap with an existing reservation.";
            }
            else if (e.OldEnd <= DateTime.Today)
            {
                message = "This reservation cannot be changed anymore.";
            }
            else if (e.NewStart < DateTime.Today)
            {
                message = "The reservation cannot be moved to the past.";
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
                //week end background
                if (e.Start.DayOfWeek == DayOfWeek.Sunday)
                {
                    e.InnerHTML = "<strong>" + e.Start.ToString("dd (ddd)") + "</strong>";

                }
                else
                {
                    e.InnerHTML = e.Start.ToString("dd (ddd)");
                }
            }
        }

        protected void dayPilotScheduler_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs e)
        {
            if (e.Start.DayOfWeek == DayOfWeek.Sunday)
            {
                e.CssClass = "sundaycellstyle";
            }
            else
            {
                e.CssClass = "weekday";
            }
        }
    }
}