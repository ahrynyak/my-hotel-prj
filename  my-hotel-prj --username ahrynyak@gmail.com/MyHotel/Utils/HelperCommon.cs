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

    }
}