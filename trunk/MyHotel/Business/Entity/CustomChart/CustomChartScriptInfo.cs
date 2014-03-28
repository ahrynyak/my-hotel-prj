using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.CustomChart
{
    public class CustomChartScriptInfo
    {
        public string Title { get; set; }
        public string ScriptText { get; set; }
        public List<CustomChartXYAxisInfo> CustomChartXYAxisInfos { get; set; }
    }
}