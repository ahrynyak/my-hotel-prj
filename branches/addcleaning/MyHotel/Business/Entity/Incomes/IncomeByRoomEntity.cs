using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.Business.Entity.Booking;
using MyHotel.Utils;

namespace MyHotel.Business.Entity.Incomes
{
    public class IncomeByRoomEntity
    {
        public RoomEntity RoomEntity { get; set; }
        public List<IncomesByStatus> IncomesByStatus { get; set; }
        public double AlreadyPaid { get; set; }
    }

    public class IncomesByStatus
    {
        public IncomesByStatus(EBookingStatus bookingStatus, double totalSum, int totalDays)
        {
            this.BookingStatus = bookingStatus;
            this.TotalSum = totalSum;
            this.TotalDays = totalDays;
        }
        public EBookingStatus BookingStatus { get; private set; }
        public double TotalSum { get; private set; }
        public int TotalDays { get; private set; }
    }
}