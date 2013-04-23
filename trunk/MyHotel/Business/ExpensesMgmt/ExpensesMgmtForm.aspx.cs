using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity.Expenses;
using Obout.Ajax.UI.TreeView;
using MyHotel.Utils;
using System.Globalization;
using MyHotel.Business.WebControls.Expenses;

namespace MyHotel.Business.ExpensesMgmt
{
    public partial class ExpensesMgmtForm : System.Web.UI.Page
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
                    ExpensesViewCtrl.Refresh(DateRangerPeriod.GetStartDate(), DateRangerPeriod.GetEndDate());
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        void DateRangerPeriod_DateChanged(object sender, WebControls.DateRange.DateEventArgs e)
        {
            ExpensesViewCtrl.Refresh(e.StartDate, e.EndDate);
        }
    }
}