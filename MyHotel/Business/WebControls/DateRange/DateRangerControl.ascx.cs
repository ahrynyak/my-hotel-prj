using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using System.Globalization;
using System.Linq;

namespace MyHotel.Business.WebControls.DateRange
{
    public partial class DateRangerControl : System.Web.UI.UserControl
    {
        public delegate void DateChangedEventHandler(object sender, DateEventArgs e);

        public event DateChangedEventHandler DateChanged;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ButtonChangeDatePanel.Text = PanelCustomRange.Visible ? PanelMonth.ToolTip : PanelCustomRange.ToolTip;
            }
        }

        public void SetDateRange(DateTime startDate, DateTime endDate)
        {
            initCalendar(startDate, endDate);
        }

        public DateTime GetStartDate()
        {
            return DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
        }
        public DateTime GetEndDate()
        {
            return DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
        }

        private void initCalendar(DateTime startDate, DateTime endDate)
        {
            datePickeStart.Text = startDate.ToString(HelperCommon.DateFormat).ToLower();
            calendarExtenderStart.Format = HelperCommon.DateFormat;

            datePickeEnd.Text = endDate.ToString(HelperCommon.DateFormat).ToLower();
            calendarExtenderEnd.Format = HelperCommon.DateFormat;
            raiseDateChangedEvent();
        }

        protected void datePickeStart_TextChanged(object sender, EventArgs e)
        {
            raiseDateChangedEvent();
        }

        protected void datePickeEnd_TextChanged(object sender, EventArgs e)
        {
            raiseDateChangedEvent();
        }

        private void raiseDateChangedEvent()
        {
            fireCustomDateRangeChanged();
        }

        private void fireCustomDateRangeChanged()
        {
            if (DateChanged != null)
            {
                DateChanged(this, new DateEventArgs(DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture), DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture)));
            }
        }

        protected void MonthPickerDate_SelectionChanged(object sender, EventArgs e)
        {
            fireMonthDateChanged();
        }

        private void fireMonthDateChanged()
        {
            if (DateChanged != null)
            {
                DateChanged(this, new DateEventArgs(MonthPickerDate.StartDate, MonthPickerDate.EndDate.AddDays(-1)));
            }
        }

        protected void ButtonChangeDatePanel_Click(object sender, EventArgs e)
        {
            datePanelChoser();
        }

        private void datePanelChoser()
        {
            PanelMonth.Visible = PanelCustomRange.Visible;
            PanelCustomRange.Visible = !PanelMonth.Visible;
            if (PanelCustomRange.Visible)
            {
                fireCustomDateRangeChanged();
            }
            else
            {
                fireMonthDateChanged();
            }
            ButtonChangeDatePanel.Text = PanelCustomRange.Visible ? PanelMonth.ToolTip : PanelCustomRange.ToolTip;
        }
    }

    public class DateEventArgs : EventArgs
    {
        public DateEventArgs(DateTime startDate, DateTime endDate)
        {
            this.StartDate = startDate;
            this.EndDate = endDate;
        }
        public DateTime StartDate { get; private set; }
        public DateTime EndDate { get; private set; }

    }
}