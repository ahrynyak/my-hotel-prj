using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyHotel.Business.Entity.Booking
{
    public class RoomEntity
    {
        public int RoomID { get; set; }
        public string Name { get; set; }
        public int Capacity { get; set; }
    }
}