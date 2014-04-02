using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using AjaxControlToolkit;

namespace MyHotel.Business.Statistics
{
    public partial class IncomesStatisticsForm : BaseWebFormMgmt
    {
        private static DateTime getDefaultStartDate()
        {
            return HelperCommon.GetUADateTimeNow().Date.AddDays(-HelperCommon.GetUADateTimeNow().Day + 1);
        }

        private static DateTime getDefaultEndDate()
        {
            return HelperCommon.GetUADateTimeNow().Date.AddDays(-HelperCommon.GetUADateTimeNow().Day + 1).AddDays(DateTime.DaysInMonth(HelperCommon.GetUADateTimeNow().Year, HelperCommon.GetUADateTimeNow().Month)).AddMilliseconds(-1);
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
                AddScriptManager();
                if (!Page.IsPostBack)
                {
                    DateRangerPeriod.SetDateRange(getDefaultStartDate(), getDefaultEndDate());
                }
                else
                {
                    IncomesViewCtrl.Refresh(DateRangerPeriod.GetStartDate(), DateRangerPeriod.GetEndDate());
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

       

        void DateRangerPeriod_DateChanged(object sender, WebControls.DateRange.DateEventArgs e)
        {
            IncomesViewCtrl.Refresh(e.StartDate, e.EndDate);
        }
    }
}