using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.GData.Calendar;

namespace MyHotel.Business.Entity.Booking
{
    public class RoomBookingEntity
    {
        public int RoomBookingID { get; set; }
        public int RoomID { get; set; }
        public string GuestName { get; set; }
        public string GuestPhone { get; set; }
        public int NumberOfAdult { get; set; }
        public int NumberOfChild { get; set; }
        public int PricePerRoom { get; set; }
        public int PriceOfAdditionalBed { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int BookingStatus { get; set; }
        public string AdditionalInfo { get; set; }
        public int AlreadyPaid { get; set; }

        public int AmountOfDays 
        {
            get
            {
                return (int)(EndDate - StartDate).TotalDays;
            }
        }

        public int TotalSum 
        {
            get 
            {
                return (PricePerRoom + PriceOfAdditionalBed) * AmountOfDays;
            }
        }

        public int RemainsSum
        {
            get
            {
                return TotalSum - AlreadyPaid;
            }
        }
    }
}