using MyHotel.Business.Entity.CustomChart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Statistics
{
    public static class StatisticsController
    {
        public static List<CustomChartScriptInfo> GetCustomChartData()
        {
            List<CustomChartScriptInfo> result = new List<CustomChartScriptInfo>();
            for (int i = 0; i < 10; i++)
            {
                result.Add(new CustomChartScriptInfo()
                {
                    Title = "Test1" + i,
                    ScriptText = "select * from Tabs" + i,
                    CustomChartXYAxisInfos = new List<CustomChartXYAxisInfo>() 
                { 
                    new CustomChartXYAxisInfo() 
                    { 
                        XFieldName = "TestFiX1"+i, 
                        YFieldName = "TestFiY1"+i, 
                        Legend = "TestLegend"+i, 
                        Color = "Red" } 
                }
                });
            }
            return result;
        }
    }
}