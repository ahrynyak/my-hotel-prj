using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MyHotel
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void LoginData_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if(FormsAuthentication.Authenticate(LoginData.UserName, LoginData.Password))
            {
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(LoginData.UserName, true);
                if (buttonLogInLogOut != null)
                {
                    buttonLogInLogOut.Visible = true;
                }
            }
        }
        Control buttonLogInLogOut = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Control buttonLogInLogOut = Page.FindControl("LinkButtonLogInLogOut");
            if (buttonLogInLogOut != null)
            {
                buttonLogInLogOut.Visible = false;
            }

        }
    }
}