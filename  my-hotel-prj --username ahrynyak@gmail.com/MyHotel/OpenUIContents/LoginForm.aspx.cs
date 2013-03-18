using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MyHotel.OpenUIContents
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginData_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if(FormsAuthentication.Authenticate(LoginData.UserName, LoginData.Password))
            {
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(LoginData.UserName, true);
            }
        }
    }
}