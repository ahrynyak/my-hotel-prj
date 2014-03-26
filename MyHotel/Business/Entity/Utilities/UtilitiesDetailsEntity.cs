using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Utilities
{
    public class UtilitiesDetailsEntity
    {
        public int UtilitiesItemsDetailsID { get; set; }
        public int UtilitiesItemsID { get; set; }
        public DateTime Date { get; set; }
        public double Value { get; set; }
        public string Description { get; set; }
    }
}