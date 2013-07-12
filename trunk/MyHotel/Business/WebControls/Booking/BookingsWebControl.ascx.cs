using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity.Booking;
using MyHotel.Utils;
using MyHotel.Business.Entity;
using DayPilot.Web.Ui.Events;
using MyHotel.Business.Entity.Common;

namespace MyHotel.Business.WebControls.Booking
{
    public partial class BookingsWebControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BookingController.CleanCache();
                dayPilotScheduler.Resources.Clear();
                foreach (var item in BookingController.GetRooms())
                {
                    dayPilotScheduler.Resources.Add(item.Name, item.RoomID.ToString());
                }
            }
        }

        protected void dayPilotScheduler_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
        {
            string message = null;

            if (!BookingController.IsRoomBookingFree(int.Parse(e.Value), int.Parse(e.Resource), e.NewStart, e.NewEnd))
            {
                message = "Бронь не може перекриватись іншою броню";
            }
            else if (e.OldStart < DateTime.Today && !BookingController.IsEditPastEnabled)
            {
                message = "Минула бронь не може бути змінена";
            }
            else if (e.NewStart < DateTime.Today && !BookingController.IsEditPastEnabled)
            {
                message = "Ця бронь не може бути переміщена в минуле";
            }
            else
            {
                var roomBookingEntity = BookingController.GetRoomBookingByID(int.Parse(e.Value));
                roomBookingEntity.StartDate = e.NewStart;
                roomBookingEntity.EndDate = e.NewEnd;
                BookingController.SaveRoomBooking(roomBookingEntity);
            }
            refreshData(dayPilotScheduler.StartDate, dayPilotScheduler.StartDate.AddDays(dayPilotScheduler.Days - 1), message);
        }

        protected void dayPilotScheduler_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        {
            string message = null;

            if (!BookingController.IsRoomBookingFree(int.Parse(e.Value), int.Parse(e.NewResource), e.NewStart, e.NewEnd))
            {
                message = "Бронь не може перекриватись іншою броню";
            }
            else if (e.OldStart < DateTime.Today && !BookingController.IsEditPastEnabled)
            {
                message = "Минула бронь не може бути змінена";
            }
            else if (e.NewStart < DateTime.Today && !BookingController.IsEditPastEnabled)
            {
                message = "Ця бронь не може бути переміщена в минуле";
            }
            else
            {
                var roomBookingEntity = BookingController.GetRoomBookingByID(int.Parse(e.Value));
                roomBookingEntity.StartDate = e.NewStart;
                roomBookingEntity.EndDate = e.NewEnd;
                roomBookingEntity.RoomID = int.Parse(e.NewResource);
                BookingController.SaveRoomBooking(roomBookingEntity);
            }
            refreshData(dayPilotScheduler.StartDate, dayPilotScheduler.StartDate.AddDays(dayPilotScheduler.Days - 1), message);
        }

        protected void dayPilotScheduler_BeforeTimeHeaderRender(object sender, DayPilot.Web.Ui.Events.BeforeTimeHeaderRenderEventArgs e)
        {
            if (e.IsColGroup)
            {
                e.InnerHTML = e.Start.ToString("MMMM-yyyy");  // sets the incomeByRoom header
            }
            else
            {
                // sets the column header
                if (e.Start.DayOfWeek == DayOfWeek.Sunday)
                {
                    //onclick=\"showStatistic(\'{3}\',\'{4}\')\"
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
            if (BookingController.IsCleaning(int.Parse(e.ResourceId), e.Start.Date))
            {
                e.CssClass = "cleaningday";
            }
            else if (e.Start < DateTime.Today)
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
                    string guestInfo = String.Format("{0} ({1})", roomBookingEntity.GuestName, roomBookingEntity.GuestPhone);
                    if (!string.IsNullOrEmpty(roomBookingEntity.AdditionalInfo))
                    {
                        guestInfo = guestInfo + String.Format("<br />Інфо: {0}", roomBookingEntity.AdditionalInfo);
                    }
                    e.InnerHTML = "<span result='" + guestInfo.Replace("<br />", Environment.NewLine) + "'>" + guestInfo + "</span>";
                }
            }

            EBookingStatus status = (EBookingStatus)Convert.ToInt32(e.Tag["BookingStatus"]);
            string cssClassName = "event" + status.ToString();
            e.ToolTip = status.ToString();
            e.InnerHTML = e.InnerHTML + String.Format("<br /><span class='" + cssClassName + "' >{0}</span>", e.ToolTip);
        }

        private void refreshData(DateTime startDate, DateTime endDate, string message)
        {
            dayPilotScheduler.StartDate = startDate;
            dayPilotScheduler.Days = (int)(endDate - startDate).TotalDays + 1;
            dayPilotScheduler.DataSource = BookingController.GetRoomBookings(dayPilotScheduler.StartDate, dayPilotScheduler.StartDate.AddDays(dayPilotScheduler.Days));
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

        public void Refresh(DateTime startDate, DateTime endDate)
        {
            refreshData(startDate, endDate, "");
        }

        //protected void dayPilotScheduler_EventDoubleClick(object sender, EventClickEventArgs e)
        //{
        //    DateTime cleaningDate = DateTime.Parse(e.Data.ToString());
        //    double dateDiff = (dayPilotScheduler.StartDate - e.Start.Date).TotalDays;
        //    if (dateDiff > 0) 
        //    {
        //        cleaningDate = cleaningDate.AddDays(dateDiff);
        //    }
        //    manageCleaning(e.ResourceId, cleaningDate);
        //}

        private static void manageCleaning(string resourceId, DateTime cleaningDate)
        {
            if (BookingController.IsCleaning(int.Parse(resourceId), cleaningDate))
            {
                BookingController.RemoveCleaning(int.Parse(resourceId), cleaningDate);
            }
            else
            {
                BookingController.AddCleaning(int.Parse(resourceId), cleaningDate);
            }
        }

        protected void dayPilotScheduler_TimeRangeDoubleClick(object sender, TimeRangeDoubleClickEventArgs e)
        {
            manageCleaning(e.Resource, e.Start.Date);
        }

        public static string GetStatisticalInfo(DateTime date)
        {
            string result = string.Empty;
            StatisticalInfo statistic = BookingController.GetStatisticalList(date);
            if (statistic != null)
            {
                result += "Період: " + statistic.WeekStartDate.ToString("dd.MM") + " - " + statistic.WeekEndDate.ToString("dd.MM") + Environment.NewLine;
                result += "Роб. дні: " + statistic.AmountOfWorkingDays + Environment.NewLine;
                result += "Поселення: " + statistic.AmountOfCheckIns + Environment.NewLine;
                result += "Прибирання: " + statistic.AmountOfCleaning + Environment.NewLine;
            }
            return result;
        }
    }
}