using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Business.Entity.Utilities;
using MyHotel.LINQDB;
using MyHotel.Utils;

namespace MyHotel.Business.WebControls.Utilities
{
    public class UtilitiesController
    {
        private static UtilitiesItemsEntity UtilitiesItemToUtilitiesItemsEntity(UtilitiesItem e, DateTime startDate, DateTime endDate)
        {
            UtilitiesItemsEntity item = new UtilitiesItemsEntity() { UtilitiesItemsID = e.UtilitiesItemsID, Name = e.Name };
            item.UtilitiesDetailsEntities = new List<UtilitiesDetailsEntity>();
            if (startDate != DateTime.MinValue && endDate != DateTime.MinValue)
            {
                foreach (var subItem in e.UtilitiesItemsDetails.Where(s => s.Date >= startDate && s.Date <= endDate))
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
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e, startDate, endDate)).ToList();
            }
        }

        public static List<UtilitiesItemsEntity> GetUtilitiesItems()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e, DateTime.MinValue, DateTime.MinValue)).ToList();
            }
        }
    }
}