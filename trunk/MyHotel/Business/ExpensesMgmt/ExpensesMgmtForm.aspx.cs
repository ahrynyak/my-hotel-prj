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
                    updateVisiblePeriod();
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void initData()
        {
            initCalendar();

        }

        private void initCalendar()
        {
            if (string.IsNullOrEmpty(datePickeStart.Text))
            {
                datePickeStart.Text = ExpensesController.GetDefaultStartDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderStart.Format = HelperCommon.DateFormat;
            }
            if (string.IsNullOrEmpty(datePickeEnd.Text))
            {
                datePickeEnd.Text = ExpensesController.GetDefaultEndDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderEnd.Format = HelperCommon.DateFormat;
            }
        }

        private void updateVisiblePeriod()
        {
            if (!string.IsNullOrEmpty(datePickeStart.Text) && !string.IsNullOrEmpty(datePickeEnd.Text))
            {
                ExpensesViewCtrl.Reload(DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture), DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture));
                //IncomesViewCtrl.Reload(DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture), DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture));
            }
            else
            {
                initCalendar();
            }
        }

        

        protected void datePickeStart_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void datePickeEnd_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

    }
}