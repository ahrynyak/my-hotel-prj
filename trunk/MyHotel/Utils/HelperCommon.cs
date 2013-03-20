using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.LINQDB;

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

        public const string DateFormat = "d-MMM-yyyy (dddd)";
    }
}