using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.CustomChart
{
    public class CustomChartXYAxisInfo
    {
        public Guid ID { get; set; }
        public string XFieldName { get; set; }
        public string YFieldName { get; set; }
        public string Legend { get; set; }
        public string ColorHex { get; set; }
    }
}