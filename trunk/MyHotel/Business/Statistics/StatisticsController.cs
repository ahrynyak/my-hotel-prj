using MyHotel.Business.Entity.CustomChart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Utils;
using MyHotel.LINQDB;
using System.Web.Script.Serialization;
using System.Data;

namespace MyHotel.Business.Statistics
{
    public static class StatisticsController
    {
        public static List<CustomChartScriptInfo> GetCustomChartData()
        {
            List<CustomChartScriptInfo> result = new List<CustomChartScriptInfo>();
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                foreach (var item in dataContext.CustomDatas)
                {
                    var customChartScriptInfo = fromJSONData(item);
                    customChartScriptInfo.ID = item.CustomDataID;
                    result.Add(customChartScriptInfo);
                }
            }
            //todo: remove
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

        public static void SaveCustomChartScriptInfo(CustomChartScriptInfo customChartScriptInfo)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (customChartScriptInfo.ID > 0 && dataContext.CustomDatas.Any(s => s.CustomDataID == customChartScriptInfo.ID))
                {
                    dataContext.CustomDatas.First().JSONData = toJSONData(customChartScriptInfo);
                }
                else
                {
                    dataContext.CustomDatas.InsertOnSubmit(new CustomData() { JSONData = toJSONData(customChartScriptInfo) });
                }
                dataContext.SubmitChanges();
            }
        }

        public static void RemoveCustomChartScriptInfo(int id)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (id > 0 && dataContext.CustomDatas.Any(s => s.CustomDataID == id))
                {
                    dataContext.CustomDatas.DeleteAllOnSubmit(dataContext.CustomDatas.Where(s => s.CustomDataID == id));
                    dataContext.SubmitChanges();
                }
                else
                {
                    throw new InvalidConstraintException("Неможливо знайти запис № " + id);
                }
            }
        }
        
        private static CustomChartScriptInfo fromJSONData(CustomData item)
        {
            return new JavaScriptSerializer().Deserialize<CustomChartScriptInfo>(item.JSONData);
        }

        private static string toJSONData(CustomChartScriptInfo customChartScriptInfo)
        {
            return new JavaScriptSerializer().Serialize(customChartScriptInfo);
        }
    }
}