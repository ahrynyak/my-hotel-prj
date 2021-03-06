﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.LINQDB;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace MyHotel.Utils
{
    public static class HelperCommon
    {
        public static DataClassesDataContext GetDataContext()
        {
            return new DataClassesDataContext(ConfigurationManager.ConnectionStrings["MyHotelDBConnectionString"].ConnectionString);
        }

        public static void ProcessExceptionNoToolTip(Label labelError, Exception ex)
        {
            labelError.Visible = true;
            labelError.Text = ex.Message;
        }

        public static void ProcessException(Label labelError, Exception ex)
        {
            labelError.Visible = true;
            labelError.Text = "Error see hint";
            labelError.ToolTip = ex.Message;
        }

        public static void ProcessExceptionMessageBox(Page page, Exception ex)
        {
            string script = "alert(\"" + ex.Message + "!\");";
            ScriptManager.RegisterStartupScript(page, page.GetType(), "ServerControlScript", script, true);
        }

        public const string UATimeZoneKey = "FLE Standard Time";

        public static DateTime GetUADateTimeNow()
        {
            TimeZoneInfo uaTimeZone = TimeZoneInfo.FindSystemTimeZoneById(HelperCommon.UATimeZoneKey);
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, uaTimeZone);
        }

        public const string DateFormat = "d-MMM-yyyy (dddd)";
        public const string DateFormatUtilities = "dd-MMM-yyyy";

        public const string DoubleFormat = "0.#";

        public static double ToDouble(this string value)
        {
            return double.Parse(value.Replace(".", CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalSeparator).Replace(",", CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalSeparator));
        }

        private static string[] mobileDevices = new string[] {"iphone","ppc",
                                                      "windows ce","blackberry",
                                                      "opera mini","mobile","palm",
                                                      "portable","opera mobi","Chrome", "android" };

        public static bool IsMobileDevice(string userAgent)
        {
            // TODO: null check
            userAgent = userAgent.ToLower();
            return mobileDevices.Any(x => userAgent.Contains(x));
        }
    }
}