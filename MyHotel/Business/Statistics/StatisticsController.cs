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
        public static CustomChartScriptInfo GetDefaultCustomChartScriptInfo()
        {
            return new CustomChartScriptInfo() 
            {
                Title = "Графік без назви",
                ScriptText="SELECT * FROM [TableName]"
            };
 
        }
        public static List<CustomChartScriptInfo> GetCustomChartData()
        {
            List<CustomChartScriptInfo> result = new List<CustomChartScriptInfo>();
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                foreach (var item in dataContext.CustomDatas)
                {
                    var customChartScriptInfo = toCustomChartScriptInfo(item);
                    result.Add(customChartScriptInfo);
                }
            }
            return result;
        }

        public static CustomChartScriptInfo GetCustomChartDataByID(int ID)
        {
            CustomChartScriptInfo result = new CustomChartScriptInfo();
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                var item = dataContext.CustomDatas.FirstOrDefault(s => s.CustomDataID == ID);
                if (item != null)
                {
                    return toCustomChartScriptInfo(item);
                }
                else
                {
                    throw new InvalidConstraintException("Неможливо знайти запис № " + ID);
                }
                
            }
        }

        public static void SaveCustomChartScriptInfo(CustomChartScriptInfo customChartScriptInfo)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (customChartScriptInfo.ID > 0 && dataContext.CustomDatas.Any(s => s.CustomDataID == customChartScriptInfo.ID))
                {
                    dataContext.CustomDatas.First(s => s.CustomDataID == customChartScriptInfo.ID).JSONData = toJSONData(customChartScriptInfo);
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

        private static CustomChartScriptInfo toCustomChartScriptInfo(CustomData item)
        {
            var customChartScriptInfo = fromJSONData(item);
            customChartScriptInfo.ID = item.CustomDataID;
            return customChartScriptInfo;
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