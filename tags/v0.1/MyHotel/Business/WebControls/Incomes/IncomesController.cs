using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.LINQDB;
using MyHotel.Utils;
using MyHotel.Business.Entity.Incomes;
using MyHotel.Business.Entity.Booking;

namespace MyHotel.Business.WebControls.Incomes
{
    public class IncomesController
    {
        public static List<IncomeByRoomEntity> GetRoomIncomes(DateTime startDate, DateTime endDate)
        {
            List<IncomeByRoomEntity> result = new List<IncomeByRoomEntity>();
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {

                foreach (var room in dataContext.Rooms)
                {
                    IncomeByRoomEntity incomeByRoomEntity = new IncomeByRoomEntity() { RoomEntity = new RoomEntity() { RoomID = room.RoomID, Name = room.Name, Capacity = room.Capacity } };
                    var allBookingsForRoom = room.RoomBookings.Where(s => ((s.StartDate >= startDate && s.StartDate <= endDate) || (s.EndDate <= endDate && s.EndDate >= startDate)));
                    incomeByRoomEntity.AmountOfDays = (int)allBookingsForRoom.Sum(s => ((s.EndDate <= endDate ? s.EndDate : endDate) - (s.StartDate >= startDate ? s.StartDate : startDate)).TotalDays);
                    incomeByRoomEntity.PercenInPeriod = (incomeByRoomEntity.AmountOfDays / (endDate - startDate).TotalDays) * 100;
                    
                    incomeByRoomEntity.NotConfirmedSum = allBookingsForRoom.Where(s => s.BookingStatus == EBookingStatus.NotConfirmed.GetHashCode()).Sum(s => (double)(((s.EndDate <= endDate ? s.EndDate : endDate) - (s.StartDate >= startDate ? s.StartDate : startDate)).TotalDays * (s.PricePerRoom + s.PriceOfAdditionalBed)));
                    incomeByRoomEntity.ConfirmedSum = allBookingsForRoom.Where(s => s.BookingStatus == EBookingStatus.Confirmed.GetHashCode()).Sum(s => (double)(((s.EndDate <= endDate ? s.EndDate : endDate) - (s.StartDate >= startDate ? s.StartDate : startDate)).TotalDays * (s.PricePerRoom + s.PriceOfAdditionalBed)));
                    incomeByRoomEntity.PrepaidSum = allBookingsForRoom.Where(s => s.BookingStatus == EBookingStatus.Prepaid.GetHashCode()).Sum(s => (double)(((s.EndDate <= endDate ? s.EndDate : endDate) - (s.StartDate >= startDate ? s.StartDate : startDate)).TotalDays * (s.PricePerRoom + s.PriceOfAdditionalBed)));
                    incomeByRoomEntity.FullPaidSum = allBookingsForRoom.Where(s => s.BookingStatus == EBookingStatus.Fullpaid.GetHashCode()).Sum(s => (double)(s.AlreadyPaid ?? 0));

                    result.Add(incomeByRoomEntity);
                }

            }
            return result;
        }
    }
}