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
using MyHotel.Business.WebControls.Booking;
using MyHotel.Business.Entity.Common;
using System.Web.Services;

namespace MyHotel.Business.RoomBookingMgmt
{
    public partial class RoomBookingMgmtForm : System.Web.UI.Page
    {
        private static DateTime getDefaultStartDate()
        {
            return DateTime.Today.ToUniversalTime();
        }

        private static DateTime getDefaultEndDate()
        {
            return DateTime.UtcNow.AddMonths(3);
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            DateRangerPeriod.DateChanged += new WebControls.DateRange.DateRangerControl.DateChangedEventHandler(DateRangerPeriod_DateChanged);
        }

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
                    DateRangerPeriod.SetDateRange(getDefaultStartDate(), getDefaultEndDate());
                    CheckBoxEditPast.Checked = BookingController.IsEditPastEnabled;
                }
                else
                {
                    BookingViewCtrl.Refresh(DateRangerPeriod.GetStartDate(), DateRangerPeriod.GetEndDate());
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        void DateRangerPeriod_DateChanged(object sender, WebControls.DateRange.DateEventArgs e)
        {
            BookingViewCtrl.Refresh(e.StartDate, e.EndDate);
        }

        protected void CheckBoxEditPast_CheckedChanged(object sender, EventArgs e)
        {
            BookingController.IsEditPastEnabled = ((CheckBox)sender).Checked;
        }

        [WebMethod]
        public static string GetStatisticalInfo(string dateStr)
        {
            string result = string.Empty;
            DateTime date = new DateTime(long.Parse(dateStr)).Date;
            StatisticalInfo statistic = BookingController.GetStatisticalList(date);
            if (statistic != null)
            {
                result += "Період: " + statistic.WeekStartDate.ToString("dd.MM") + " - " + statistic.WeekEndDate.ToString("dd.MM") + Environment.NewLine;
                result += "Роб. дні: " + statistic.AmountOfWorkingDays + Environment.NewLine;
                result += "Бонус: " + statistic.AmountOfExtraWorkingDays + Environment.NewLine;
                result += "Поселення: " + statistic.AmountOfCheckIns + Environment.NewLine;
                result += "Прибирання: " + statistic.AmountOfCleaning + Environment.NewLine;
            }
            return result;
        }

        [WebMethod]
        public static bool IsRoomBookingFree(string roomIDStr, string startDateStr, string endDateStr)
        {
            return BookingController.IsRoomBookingFree(0, int.Parse(roomIDStr), DateTime.Parse(startDateStr), DateTime.Parse(endDateStr));
        }
    }
}