using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyHotel.LINQDB;
using MyHotel.Utils;
using MyHotel.Business.Entity.Incomes;
using MyHotel.Business.Entity.Booking;
using MyHotel.Business.WebControls.Booking;

namespace MyHotel.Business.WebControls.Incomes
{
    public class IncomesController
    {
        public static List<IncomeByRoomEntity> GetPlanedIncomesData(DateTime startDate, DateTime endDate)
        {
            List<IncomeByRoomEntity> result = new List<IncomeByRoomEntity>();
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                foreach (var room in dataContext.Rooms)
                {
                    IncomeByRoomEntity incomeByRoomEntity = new IncomeByRoomEntity() { RoomEntity = new RoomEntity() { RoomID = room.RoomID, Name = room.Name, Capacity = room.Capacity }, IncomesByStatus = new List<IncomesByStatus>() };
                    var allBookingsForRoom = BookingController.GetRoomBookingsFromDB(startDate, endDate, room.RoomBookings.AsQueryable());
                    foreach (var statusValue in Enum.GetValues(typeof(EBookingStatus)))
                    {
                        var allDataByStatus = allBookingsForRoom.Where(s => s.BookingStatus == statusValue.GetHashCode());
                        int totalDays = allDataByStatus.Sum(s => (int)getTotalPaidDaysInRange(startDate, endDate, s.StartDate, s.EndDate));
                        double totalSum = allDataByStatus.Sum(s =>
                             (double)
                             (
                                 getTotalPaidDaysInRange(startDate, endDate, s.StartDate, s.EndDate)
                                 *
                                 (s.PricePerRoom + s.PriceOfAdditionalBed)
                             ));
                        IncomesByStatus incomesByStatus = new IncomesByStatus((EBookingStatus)Enum.Parse(typeof(EBookingStatus), statusValue.ToString()), totalSum, totalDays);
                        incomeByRoomEntity.IncomesByStatus.Add(incomesByStatus);
                    }

                    incomeByRoomEntity.AlreadyPaid = allBookingsForRoom.Sum(s => s.AlreadyPaid ?? 0);
                    result.Add(incomeByRoomEntity);
                }

            }
            return result;
        }

        private static double getTotalPaidDaysInRange(DateTime startRangeDate, DateTime endRangeDate, DateTime roomBookingStartDate, DateTime roomBookingEndDate)
        {
            return ((roomBookingEndDate <= endRangeDate ? roomBookingEndDate : endRangeDate.AddDays(1)) - (roomBookingStartDate >= startRangeDate ? roomBookingStartDate : startRangeDate)).TotalDays;
        }
    }
}