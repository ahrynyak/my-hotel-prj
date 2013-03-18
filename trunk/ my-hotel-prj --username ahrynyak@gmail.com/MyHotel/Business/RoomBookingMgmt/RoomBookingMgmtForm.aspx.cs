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

        private void updateVisiblePeriod()
        {
            dayPilotScheduler.StartDate = datePickeStart.SelectedDate;
            dayPilotScheduler.Days = (int)(datePickeEnd.SelectedDate - dayPilotScheduler.StartDate).TotalDays + 1;
            dayPilotScheduler.DataSource = RoomBookingMgmtController.GetRoomBookings(dayPilotScheduler.StartDate, dayPilotScheduler.StartDate.AddDays(dayPilotScheduler.Days));
            dayPilotScheduler.DataBind();
            if (Page.IsPostBack)
            {
                dayPilotScheduler.Update();
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
      
    }
}