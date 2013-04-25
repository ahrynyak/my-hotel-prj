﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyHotel.Business.Statistics
{
    public partial class IncomesStatisticsForm : System.Web.UI.Page
    {
        private static DateTime getDefaultStartDate()
        {
            return DateTime.Now.AddDays(-DateTime.Now.Day + 1);
        }

        private static DateTime getDefaultEndDate()
        {
            return DateTime.Now;
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