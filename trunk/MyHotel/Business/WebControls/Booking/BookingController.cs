using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MyHotel.LINQDB;
using MyHotel.Business.Entity;
using MyHotel.Utils;
using MyHotel.Business.Entity.Booking;
using MyHotel.Business.Entity.Common;
using Google.GData.Calendar;
using Google.GData.Extensions;

namespace MyHotel.Business.WebControls.Booking
{
    public class BookingController
    {
        public static bool IsEditPastEnabled { get; set; }

        private static List<string> cleaningList;

        public static List<RoomEntity> GetRooms()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.Rooms.Select(s => new RoomEntity() { RoomID = s.RoomID, Name = s.Name, Capacity = s.Capacity }).ToList();
            }
        }

        public static List<RoomBookingEntity> GetRoomBookings(DateTime startDate, DateTime endDate)
        {
            List<RoomBookingEntity> result = new List<RoomBookingEntity>();
            Dictionary<string, EventEntry> calendarEvents = getCalendarEvents(startDate, endDate);
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                IQueryable<RoomBooking> resDB = GetRoomBookingsFromDB(startDate, endDate, dataContext.RoomBookings);
                foreach (var roomBooking in resDB)
                {
                    result.Add(
                        new RoomBookingEntity()
                        {
                            AdditionalInfo = roomBooking.AdditionalInfo,
                            BookingStatus = roomBooking.BookingStatus,
                            EndDate = roomBooking.EndDate,
                            GuestName = roomBooking.GuestName,
                            GuestPhone = roomBooking.GuestPhone,
                            NumberOfAdult = roomBooking.NumberOfAdult,
                            NumberOfChild = roomBooking.NumberOfChild ?? 0,
                            PriceOfAdditionalBed = roomBooking.PriceOfAdditionalBed ?? 0,
                            PricePerRoom = roomBooking.PricePerRoom,
                            RoomBookingID = roomBooking.RoomBookingID,
                            RoomID = roomBooking.RoomID,
                            StartDate = roomBooking.StartDate,
                            AlreadyPaid = roomBooking.AlreadyPaid ?? 0,
                            EventEntry = calendarEvents.Any(ce => ce.Key == roomBooking.RoomBookingID.ToString()) ? calendarEvents.FirstOrDefault(ce => ce.Key == roomBooking.RoomBookingID.ToString()).Value : null
                        }
                        );
                }
                return result;
            }
        }

        public static IQueryable<RoomBooking> GetRoomBookingsFromDB(DateTime startDate, DateTime endDate, IQueryable<RoomBooking> roomBookings)
        {
            return roomBookings.Where(s => s.StartDate <= endDate && s.EndDate > startDate);
        }

        private static Dictionary<string, EventEntry> getCalendarEvents(DateTime startDate, DateTime endDate)
        {
            Dictionary<string, EventEntry> calendarEvents = new Dictionary<string, EventEntry>();
            try
            {
                calendarEvents = GoogleCalendarHelper.GetRoomBookingEvents(startDate, endDate);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return calendarEvents;
        }

        public static void SaveRoomBooking(RoomBookingEntity roomBookingEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (IsEditPastEnabled || roomBookingEntity.StartDate >= DateTime.Now.Date)
                {
                    if (roomBookingEntity.StartDate.Date >= roomBookingEntity.EndDate.Date)
                    {
                        throw new InvalidConstraintException("Дата заїзду повинна бути менша за дату виїзду");
                    }
                    if (BookingController.IsRoomBookingFree(roomBookingEntity.RoomBookingID, roomBookingEntity.RoomID, roomBookingEntity.StartDate, roomBookingEntity.EndDate))
                    {
                        if (roomBookingEntity.RoomBookingID > 0)
                        {
                            RoomBooking roomBooking = dataContext.RoomBookings.FirstOrDefault(s => s.RoomBookingID == roomBookingEntity.RoomBookingID);
                            if (roomBooking != null)
                            {
                                roomBooking.AdditionalInfo = roomBookingEntity.AdditionalInfo;
                                roomBooking.BookingStatus =
                                (roomBookingEntity.AlreadyPaid > 0
                                &&
                                (roomBookingEntity.BookingStatus == EBookingStatus.NotConfirmed.GetHashCode() || roomBookingEntity.BookingStatus == EBookingStatus.Confirmed.GetHashCode()))
                                ? EBookingStatus.Prepaid.GetHashCode() : roomBookingEntity.BookingStatus;
                                roomBooking.EndDate = roomBookingEntity.EndDate;
                                roomBooking.GuestName = roomBookingEntity.GuestName;
                                roomBooking.GuestPhone = roomBookingEntity.GuestPhone;
                                roomBooking.NumberOfAdult = roomBookingEntity.NumberOfAdult;
                                roomBooking.NumberOfChild = roomBookingEntity.NumberOfChild;
                                roomBooking.PriceOfAdditionalBed = roomBookingEntity.PriceOfAdditionalBed;
                                roomBooking.PricePerRoom = roomBookingEntity.PricePerRoom;
                                roomBooking.RoomID = roomBookingEntity.RoomID;
                                roomBooking.StartDate = roomBookingEntity.StartDate;
                                roomBooking.AlreadyPaid = roomBookingEntity.AlreadyPaid;
                                dataContext.SubmitChanges();
                                manageRoomBoookingCalendar(roomBookingEntity, roomBooking);
                            }
                            else
                            {
                                throw new InvalidConstraintException("Бронь для зміни не знайдена №" + roomBookingEntity.RoomBookingID);
                            }
                        }
                        else
                        {
                            RoomBooking roomBooking = new RoomBooking()
                            {
                                AdditionalInfo = roomBookingEntity.AdditionalInfo,
                                BookingStatus =
                                (roomBookingEntity.AlreadyPaid > 0
                                &&
                                (roomBookingEntity.BookingStatus == EBookingStatus.NotConfirmed.GetHashCode() || roomBookingEntity.BookingStatus == EBookingStatus.Confirmed.GetHashCode()))
                                ? EBookingStatus.Prepaid.GetHashCode() : roomBookingEntity.BookingStatus,
                                EndDate = roomBookingEntity.EndDate,
                                GuestName = roomBookingEntity.GuestName,
                                GuestPhone = roomBookingEntity.GuestPhone,
                                NumberOfAdult = roomBookingEntity.NumberOfAdult,
                                NumberOfChild = roomBookingEntity.NumberOfChild,
                                PriceOfAdditionalBed = roomBookingEntity.PriceOfAdditionalBed,
                                PricePerRoom = roomBookingEntity.PricePerRoom,
                                RoomID = roomBookingEntity.RoomID,
                                StartDate = roomBookingEntity.StartDate,
                                AlreadyPaid = roomBookingEntity.AlreadyPaid
                            };
                            dataContext.RoomBookings.InsertOnSubmit(roomBooking);
                            dataContext.SubmitChanges();
                            manageRoomBoookingCalendar(roomBookingEntity, roomBooking);
                        }
                    }
                    else
                    {
                        throw new InvalidConstraintException("Бронь не може перекриватись іншою броню");
                    }
                }
                else
                {
                    throw new InvalidConstraintException("Неможливо додати або модифікувати бронь в минулому");
                }
            }
        }

        private static void manageRoomBoookingCalendar(RoomBookingEntity roomBookingEntity, RoomBooking roomBooking)
        {
            try
            {
                string title = string.Format("{0} {1} ({2}) {3}грн", roomBooking.GuestPhone, roomBooking.GuestName, roomBooking.StartDate.ToString("dd.MM"), roomBookingEntity.RemainsSum);
                string content = string.Format("{0}грн {1}", roomBookingEntity.RemainsSum, roomBooking.AdditionalInfo);
                GoogleCalendarHelper.ManageRoomBookingEvent(roomBooking.RoomBookingID.ToString(), title, content, roomBooking.StartDate.Date);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public static void DeleteRoomBooking(int roomBookingID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                RoomBooking roomBooking = dataContext.RoomBookings.FirstOrDefault(s => s.RoomBookingID == roomBookingID);
                if (roomBooking != null)
                {
                    if (IsEditPastEnabled || roomBooking.StartDate >= DateTime.Now)
                    {
                        if ((roomBooking.AlreadyPaid ?? 0) > 0)
                        {
                            throw new InvalidConstraintException("Неможливо видалити оплачену бронь");
                        }
                        else
                        {
                            dataContext.RoomBookings.DeleteOnSubmit(roomBooking);
                            dataContext.SubmitChanges();
                            try
                            {
                                Dictionary<string, EventEntry> calendarEvents = getCalendarEvents(roomBooking.StartDate, roomBooking.EndDate);
                                if (calendarEvents.Any(ce => ce.Key == roomBooking.RoomBookingID.ToString()))
                                {
                                    calendarEvents.FirstOrDefault(ce => ce.Key == roomBooking.RoomBookingID.ToString()).Value.Delete();
                                }
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(ex.Message);
                            }
                        }
                    }
                    else
                    {
                        throw new InvalidConstraintException("Неможливо видалити бронь в минулому");
                    }
                }
                else
                {
                    throw new InvalidConstraintException("Бронь для видалення не знайдена №" + roomBookingID);
                }
            }
        }

        public static RoomBookingEntity GetRoomBookingByID(int roomBookingID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                RoomBooking roomBooking = dataContext.RoomBookings.FirstOrDefault(s => s.RoomBookingID == roomBookingID);
                if (roomBooking != null)
                {
                    Dictionary<string, EventEntry> calendarEvents = getCalendarEvents(roomBooking.StartDate, roomBooking.EndDate);
                    return new RoomBookingEntity()
                    {
                        AdditionalInfo = roomBooking.AdditionalInfo,
                        BookingStatus = roomBooking.BookingStatus,
                        EndDate = roomBooking.EndDate,
                        GuestName = roomBooking.GuestName,
                        GuestPhone = roomBooking.GuestPhone,
                        NumberOfAdult = roomBooking.NumberOfAdult,
                        NumberOfChild = roomBooking.NumberOfChild ?? 0,
                        PriceOfAdditionalBed = roomBooking.PriceOfAdditionalBed ?? 0,
                        PricePerRoom = roomBooking.PricePerRoom,
                        RoomBookingID = roomBooking.RoomBookingID,
                        RoomID = roomBooking.RoomID,
                        StartDate = roomBooking.StartDate,
                        AlreadyPaid = roomBooking.AlreadyPaid ?? 0,
                        EventEntry = calendarEvents.Any(ce => ce.Key == roomBooking.RoomBookingID.ToString()) ? calendarEvents.FirstOrDefault(ce => ce.Key == roomBooking.RoomBookingID.ToString()).Value : null
                    };
                }
            }
            return null;
        }

        public static bool IsRoomBookingFree(int roomBookingID, int roomID, DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return !GetRoomBookingsFromDB(startDate, endDate, dataContext.RoomBookings).Any(s => s.RoomBookingID != roomBookingID && s.RoomID == roomID);
            }
        }

        public static RoomDetailedEntity GetRoomDetailedByID(int roomID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                Room room = dataContext.Rooms.FirstOrDefault(s => s.RoomID == roomID);
                if (room != null)
                {

                    return new RoomDetailedEntity()
                    {
                        Capacity = room.Capacity,
                        Name = room.Name,
                        RoomID = room.RoomID,
                        BookedDates = room.RoomBookings.ToDictionary(rb => rb.StartDate, rb => rb.EndDate)
                    };
                }
            }
            return null;
        }

        public static Dictionary<string, string> GetStatuses()
        {
            Dictionary<string, string> result = new Dictionary<string, string>();
            foreach (var item in Enum.GetValues(typeof(EBookingStatus)))
            {
                result.Add(Enum.GetName(typeof(EBookingStatus), item.GetHashCode()), item.GetHashCode().ToString());
            }
            return result;
        }

        public static bool IsCleaning(int roomID, DateTime dateOfCleaning)
        {
            if (cleaningList == null)
            {
                using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
                {
                    cleaningList = dataContext.Cleanings.Select(s => getCleaningKey(s.RoomID, s.DateOfCleaning)).ToList();
                }
            }
            return cleaningList.Any(s => s == getCleaningKey(roomID, dateOfCleaning));
        }

        private static string getCleaningKey(int roomID, DateTime dateOfCleaning)
        {
            return "R" + roomID + "D" + dateOfCleaning.Date.Ticks;
        }

        private static bool isCleaningInDB(int roomID, DateTime dateOfCleaning, DataClassesDataContext dataContext)
        {
            return dataContext.Cleanings.Any(s => s.RoomID == roomID && s.DateOfCleaning == dateOfCleaning.Date);
        }

        public static void AddCleaning(int roomID, DateTime dateOfCleaning)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (!isCleaningInDB(roomID, dateOfCleaning, dataContext))
                {
                    Cleaning сleaning = new Cleaning();
                    сleaning.DateOfCleaning = dateOfCleaning.Date;
                    сleaning.RoomID = roomID;
                    dataContext.Cleanings.InsertOnSubmit(сleaning);
                    dataContext.SubmitChanges();
                    cleaningList.Add(getCleaningKey(roomID, dateOfCleaning));
                }
            }
        }

        public static void RemoveCleaning(int roomID, DateTime dateOfCleaning)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (isCleaningInDB(roomID, dateOfCleaning, dataContext))
                {
                    dataContext.Cleanings.DeleteOnSubmit(dataContext.Cleanings.First(s => s.RoomID == roomID && s.DateOfCleaning == dateOfCleaning.Date));
                    dataContext.SubmitChanges();
                    cleaningList.Remove(getCleaningKey(roomID, dateOfCleaning));
                }
            }
        }

        public static void CleanCache()
        {
            cleaningList = null;
        }

        public static DateTime Next(DateTime from, DayOfWeek dayOfWeek)
        {
            int start = (int)from.DayOfWeek;
            int target = (int)dayOfWeek;
            if (target <= start)
                target += 7;
            return from.AddDays(target - start);
        }

        public static StatisticalInfo GetStatisticalList(DateTime date)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                DateTime testDate = DateTime.MinValue;
                if (date.DayOfWeek != DayOfWeek.Sunday)
                {
                    testDate = Next(date, DayOfWeek.Sunday);
                }
                else
                {
                    testDate = date.Date;
                }
                DateTime weekStartDate = testDate.Date.AddDays(-6);
                DateTime weekEndDate = testDate.Date.AddDays(1).AddTicks(-1);
                StatisticalInfo result = new StatisticalInfo() { WeekStartDate = weekStartDate, WeekEndDate = weekEndDate };
                result.AmountOfCheckIns = dataContext.RoomBookings.Count(s => (s.StartDate >= weekStartDate && s.StartDate <= weekEndDate));
                result.AmountOfCleaning = dataContext.Cleanings.Count(s => s.DateOfCleaning >= weekStartDate && s.DateOfCleaning <= weekEndDate);
                TimeSpan weekDiff = weekEndDate - weekStartDate;
                int workDays = 0;
                int extraWorkDays = 0;
                for (int y = 0; y < weekDiff.Days + 1; y++)
                {
                    DateTime day = weekStartDate.AddDays(y + 1).AddTicks(-1);
                    var rbPerDay = dataContext.RoomBookings.Where(s => (s.StartDate <= day && s.EndDate >= day));
                    if (rbPerDay.Any(s => (s.StartDate <= day && s.EndDate >= day)))
                    {
                        workDays++;
                    }
                    if (rbPerDay.Select(s => s.RoomID).Count() > 3)
                    {
                        extraWorkDays += rbPerDay.Select(s => s.RoomID).Distinct().Count() - 3;
                    }
                }
                result.AmountOfWorkingDays = workDays;
                result.AmountOfExtraWorkingDays = extraWorkDays;
                return result;
            }
        }
    }
}