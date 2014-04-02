using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

namespace MyHotel.Business.Statistics
{
    public partial class CountersStatisticsForm : BaseWebFormMgmt
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                AddScriptManager();
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }
    }
}