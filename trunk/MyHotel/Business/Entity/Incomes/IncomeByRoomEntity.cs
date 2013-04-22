using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Business.Entity.Booking;

namespace MyHotel.Business.Entity.Incomes
{
    public class IncomeByRoomEntity
    {
        public RoomEntity RoomEntity { get; set; }
        public double NotConfirmedSum { get; set; }
        public double ConfirmedSum { get; set; }
        public double PrepaidSum { get; set; }
        public double FullPaidSum { get; set; }
        public int AmountOfDays { get; set; }
        public double PercenInPeriod { get; set; }
    }
}