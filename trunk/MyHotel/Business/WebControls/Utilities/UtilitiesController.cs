using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Business.Entity.Utilities;
using MyHotel.LINQDB;
using MyHotel.Utils;
using System.Data;

namespace MyHotel.Business.WebControls.Utilities
{
    public class UtilitiesController
    {
        private static UtilitiesItemsEntity UtilitiesItemToUtilitiesItemsEntity(UtilitiesItem e, DateTime startDate, DateTime endDate, IEnumerable<int> utilitiesItemsDetailsIDs)
        {
            UtilitiesItemsEntity item = new UtilitiesItemsEntity() { UtilitiesItemsID = e.UtilitiesItemsID, Name = e.Name };
            item.UtilitiesDetailsEntities = new List<UtilitiesDetailsEntity>();
            IEnumerable<UtilitiesItemsDetail> utilitiesItemsDetails = null;
            if (startDate != DateTime.MinValue && endDate != DateTime.MinValue)
            {
                utilitiesItemsDetails = e.UtilitiesItemsDetails.Where(s => s.Date >= startDate && s.Date <= endDate);
            }
            else if (utilitiesItemsDetailsIDs != null)
            {
                utilitiesItemsDetails = e.UtilitiesItemsDetails.Where(s =>  utilitiesItemsDetailsIDs.Any(u => u == s.UtilitiesItemsDetailsID));
            }
            if (utilitiesItemsDetails != null)
            {
                foreach (var subItem in utilitiesItemsDetails)
                {
                    item.UtilitiesDetailsEntities.Add(new UtilitiesDetailsEntity()
                    {
                        UtilitiesItemsDetailsID = subItem.UtilitiesItemsDetailsID,
                        UtilitiesItemsID = item.UtilitiesItemsID,
                        Date = subItem.Date,
                        Description = subItem.Description,
                        Value = subItem.Value
                    });

                }
            }
            return item;
        }

        public static List<UtilitiesItemsEntity> GetUtilitiesItems(DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e, startDate, endDate, null)).ToList();
            }
        }

        public static List<UtilitiesItemsEntity> GetUtilitiesItems()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e, DateTime.MinValue, DateTime.MinValue, null)).ToList();
            }
        }

        public static List<UtilitiesItemsEntity> GetUtilitiesItems(IEnumerable<int> utilitiesItemsDetailsIDs)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e, DateTime.MinValue, DateTime.MinValue, utilitiesItemsDetailsIDs)).ToList();
            }
        }

        private static object utilitiesDetailsLock = new object();

        public static void DeleteUtilitiesItems(IEnumerable<int> utilitiesItemsDetailsIDs)
        {
            lock (utilitiesDetailsLock)
            {
                using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
                {
                    foreach (var id in utilitiesItemsDetailsIDs)
                    {
                        dataContext.UtilitiesItemsDetails.DeleteAllOnSubmit(dataContext.UtilitiesItemsDetails.Where(s => s.UtilitiesItemsDetailsID == id));
                    }
                    dataContext.SubmitChanges();
                }
            }
        }

        public static void SaveUtilitiesDetails(List<UtilitiesDetailsEntity> utilitiesDetails)
        {
            lock (utilitiesDetailsLock)
            {
                if (utilitiesDetails == null || !utilitiesDetails.Any()) 
                {
                    throw new InvalidConstraintException("Немає даних для запису");
                }
                using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
                {
                    foreach (var item in utilitiesDetails)
                    {
                        if (item.UtilitiesItemsDetailsID > 0)
                        {
                            UtilitiesItemsDetail utilitiesItemsDetail = dataContext.UtilitiesItemsDetails.FirstOrDefault(s => s.UtilitiesItemsDetailsID == item.UtilitiesItemsDetailsID);
                            if (utilitiesItemsDetail != null)
                            {
                                UpdateDBFromBO(item, utilitiesItemsDetail);
                            }
                            else
                            {
                                throw new InvalidConstraintException("Запис про КП не знайдено №" + item.UtilitiesItemsDetailsID);
                            }
                        }
                        else
                        {
                            dataContext.UtilitiesItemsDetails.InsertOnSubmit(ConvertBOToDB(item));
                        }
                    }
                    dataContext.SubmitChanges();
                }
            }
        }

        private static UtilitiesItemsDetail ConvertBOToDB(UtilitiesDetailsEntity item)
        {
            UtilitiesItemsDetail utilitiesItemsDetail = new UtilitiesItemsDetail();
            UpdateDBFromBO(item, utilitiesItemsDetail);
            utilitiesItemsDetail.UtilitiesItemsID = item.UtilitiesItemsID;
            if (item.UtilitiesItemsDetailsID > 0)
            {
                utilitiesItemsDetail.UtilitiesItemsDetailsID = item.UtilitiesItemsDetailsID;
            }
            return utilitiesItemsDetail;
        }

        private static void UpdateDBFromBO(UtilitiesDetailsEntity item, UtilitiesItemsDetail utilitiesItemsDetail)
        {
            utilitiesItemsDetail.Date = item.Date;
            utilitiesItemsDetail.Description = item.Description;
            utilitiesItemsDetail.Value = item.Value;
        }
    }
}