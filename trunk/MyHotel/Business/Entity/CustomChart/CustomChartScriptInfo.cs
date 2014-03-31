using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace MyHotel.Business.Entity.CustomChart
{
    [Serializable]
    public class CustomChartScriptInfo
    {
        [XmlIgnore]
        public int ID { get; set; }
        public string Title { get; set; }
        public string ScriptText { get; set; }
        public List<CustomChartXYAxisInfo> CustomChartXYAxisInfos { get; set; }
    }
}