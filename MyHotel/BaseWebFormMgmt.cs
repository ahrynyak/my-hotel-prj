using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;

namespace MyHotel
{
    public abstract class BaseWebFormMgmt : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (HelperCommon.IsMobileDevice(Request.UserAgent))
            {
                MasterPageFile = "~/MasterPages/MyHotelMobile7InchMgmt.Master";
            }
            else
            {
                MasterPageFile = "~/MasterPages/MyHotelMgmt.Master";
            }
        }
    }
}