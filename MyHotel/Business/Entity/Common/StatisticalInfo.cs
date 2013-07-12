using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Common
{
    public class StatisticalInfo
    {
        public int AmountOfCleaning { get; set; }

        public int AmountOfCheckIns { get; set; }

        public int AmountOfWorkingDays { get; set; }

        public int AmountOfExtraWorkingDays { get; set; }

        public DateTime WeekStartDate { get; set; }
        
        public DateTime WeekEndDate { get; set; }
        
    }
}