using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyHotel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkButtonSignIn_Click(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Business/RoomBookingMgmt/RoomBookingMgmtForm.aspx", true);
            }
            else
            {
                Response.Redirect("~/OpenUIContents/LoginForm.aspx");
            }
        }
    }
}