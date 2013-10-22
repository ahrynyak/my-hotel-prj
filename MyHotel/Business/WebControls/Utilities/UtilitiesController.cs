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
        private static UtilitiesItemsEntity UtilitiesItemToUtilitiesItemsEntity(UtilitiesItem e)
        {
            return new UtilitiesItemsEntity() { UtilitiesItemsID = e.UtilitiesItemsID, Name = e.Name };
        }

        public static List<UtilitiesItemsEntity> GetUtilitiesItems()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.UtilitiesItems.Select(e => UtilitiesItemToUtilitiesItemsEntity(e)).ToList();
            }
        }
    }
}