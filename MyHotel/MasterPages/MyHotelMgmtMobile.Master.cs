using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MyHotel.MasterPages
{
    public partial class MyHotelMgmtMobile : System.Web.UI.MasterPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkButtonSignOut_Click(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
            }
            Response.Redirect("/LoginForm.aspx");
        }
    }
}