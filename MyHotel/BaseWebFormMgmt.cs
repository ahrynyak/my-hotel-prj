﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;
using System.Web.Services;
using System.Web.UI;
using AjaxControlToolkit;

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

        protected void AddScriptManager()
        {
            if (ScriptManager.GetCurrent(Page) == null)
            {
                Page.Form.Controls.AddAt(0, new ToolkitScriptManager());
            }
        }
    }
}