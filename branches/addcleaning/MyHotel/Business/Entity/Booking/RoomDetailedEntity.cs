using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Booking
{
    public class RoomDetailedEntity : RoomEntity
    {
        /// <summary>
        /// Key - booked start date 
        /// Value - booked end date
        /// </summary>
        public Dictionary<DateTime, DateTime> BookedDates { get; set; }
    }
}