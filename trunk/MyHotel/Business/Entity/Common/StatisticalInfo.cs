using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Common
{
    public class StatisticalInfo
    {
        public int AmountOfCleaning { get; set; }

        public int AmountOfCheckIn { get; set; }

        public int AmountOfWorkDay { get; set; }

        public DateTime WeekStartDate { get; set; }
        
        public DateTime WeekEndDate { get; set; }
        
    }
}