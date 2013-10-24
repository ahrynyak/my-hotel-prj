using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.LINQDB;
using System.Globalization;

namespace MyHotel.Utils
{
    public static class HelperCommon
    {
        public static DataClassesDataContext GetDataContext()
        {
            return new DataClassesDataContext();
        }

        public static void ProcessException(Exception ex)
        {
            MessageBox.Show(ex.Message);
        }

        public const string UATimeZoneKey = "FLE Standard Time";

        public static DateTime GetUADateTimeNow()
        {
            TimeZoneInfo uaTimeZone = TimeZoneInfo.FindSystemTimeZoneById(HelperCommon.UATimeZoneKey);
            return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, uaTimeZone);
        }

        public const string DateFormat = "d-MMM-yyyy (dddd)";

        public const string DoubleFormat = "0.#";

        public static double ToDouble(this string value)
        {
            return double.Parse(value.Replace(".", CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalSeparator).Replace(",", CultureInfo.CurrentCulture.NumberFormat.CurrencyDecimalSeparator));
        }
    }
}