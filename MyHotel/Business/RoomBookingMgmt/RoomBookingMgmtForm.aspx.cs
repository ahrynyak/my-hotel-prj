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
            foreach (var item in Directory.GetFiles(Server.MapPath("../../css/DayPilot/")))
            {
                DropDownListStyleSelector.Items.Add(Path.GetFileNameWithoutExtension(item));
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

        protected void DropDownListStyleSelector_SelectedIndexChanged(object sender, EventArgs e)
        {
            dayPilotScheduler.CssClassPrefix = DropDownListStyleSelector.SelectedValue;
        }

        protected void dayPilotScheduler_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
        {
            var roomBookingEntity = RoomBookingMgmtController.GetRoomBookingByID(int.Parse(e.Value));
            roomBookingEntity.StartDate = e.NewStart;
            roomBookingEntity.EndDate = e.NewEnd;
            RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            updateVisiblePeriod();
        }

        protected void dayPilotScheduler_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
        {
            var roomBookingEntity = RoomBookingMgmtController.GetRoomBookingByID(int.Parse(e.Value));
            roomBookingEntity.StartDate = e.NewStart;
            roomBookingEntity.EndDate = e.NewEnd;
            roomBookingEntity.RoomID = int.Parse(e.NewResource);
            RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            updateVisiblePeriod();
        }
    }
}