using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MyHotel.LINQDB;
using MyHotel.Business.Entity;
using MyHotel.Utils;

namespace MyHotel.Business.RoomBookingMgmt
{
    public class RoomBookingMgmtController
    {
        public static DateTime GetDefaultStartDate()
        {
            return DateTime.Now;
        }

        public static DateTime GetDefaultEndDate()
        {
            return DateTime.Now.AddMonths(6);
        }

        public static List<RoomEntity> GetRooms()
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.Rooms.Select(s => new RoomEntity() { RoomID = s.RoomID, Name = s.Name, Capacity = s.Capacity }).ToList();
            }
        }

        public static List<RoomBookingEntity> GetRoomBookings(DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return dataContext.RoomBookings.Where(s => (s.StartDate >= startDate && s.StartDate <= endDate) || (s.EndDate <= endDate && s.EndDate >= startDate)).Select(s => new RoomBookingEntity()
                {
                    AdditionalInfo = s.AdditionalInfo,
                    BookingStatus = s.BookingStatus,
                    EndDate = s.EndDate,
                    GuestName = s.GuestName,
                    GuestPhone = s.GuestPhone,
                    NumberOfAdult = s.NumberOfAdult,
                    NumberOfChild = s.NumberOfChild ?? 0,
                    PriceOfAdditionalBed = s.PriceOfAdditionalBed ?? 0,
                    PricePerRoom = s.PricePerRoom,
                    RoomBookingID = s.RoomBookingID,
                    RoomID = s.RoomID,
                    StartDate = s.StartDate
                }).ToList();
            }
        }

        public static void SaveRoomBooking(RoomBookingEntity roomBookingEntity)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                if (roomBookingEntity.StartDate >= DateTime.Now)
                {
                    if (RoomBookingMgmtController.IsRoomBookingFree(roomBookingEntity.RoomBookingID, roomBookingEntity.RoomID, roomBookingEntity.StartDate, roomBookingEntity.EndDate))
                    {
                        //todo: add validation of roomBookingEntity
                        //      1) DB validation
                        //      2) overlaping of dates and rooms
                        if (roomBookingEntity.RoomBookingID > 0)
                        {
                            RoomBooking roomBooking = dataContext.RoomBookings.FirstOrDefault(s => s.RoomBookingID == roomBookingEntity.RoomBookingID);
                            if (roomBooking != null)
                            {
                                roomBooking.AdditionalInfo = roomBookingEntity.AdditionalInfo;
                                roomBooking.BookingStatus = roomBookingEntity.BookingStatus;
                                roomBooking.EndDate = roomBookingEntity.EndDate;
                                roomBooking.GuestName = roomBookingEntity.GuestName;
                                roomBooking.GuestPhone = roomBookingEntity.GuestPhone;
                                roomBooking.NumberOfAdult = roomBookingEntity.NumberOfAdult;
                                roomBooking.NumberOfChild = roomBookingEntity.NumberOfChild;
                                roomBooking.PriceOfAdditionalBed = roomBookingEntity.PriceOfAdditionalBed;
                                roomBooking.PricePerRoom = roomBookingEntity.PricePerRoom;
                                roomBooking.RoomID = roomBookingEntity.RoomID;
                                roomBooking.StartDate = roomBookingEntity.StartDate;
                                dataContext.SubmitChanges();
                            }
                            else
                            {
                                //todo: not found
                            }
                        }
                        else
                        {
                            dataContext.RoomBookings.InsertOnSubmit(new RoomBooking()
                            {
                                AdditionalInfo = roomBookingEntity.AdditionalInfo,
                                BookingStatus = roomBookingEntity.BookingStatus,
                                EndDate = roomBookingEntity.EndDate,
                                GuestName = roomBookingEntity.GuestName,
                                GuestPhone = roomBookingEntity.GuestPhone,
                                NumberOfAdult = roomBookingEntity.NumberOfAdult,
                                NumberOfChild = roomBookingEntity.NumberOfChild,
                                PriceOfAdditionalBed = roomBookingEntity.PriceOfAdditionalBed,
                                PricePerRoom = roomBookingEntity.PricePerRoom,
                                RoomID = roomBookingEntity.RoomID,
                                StartDate = roomBookingEntity.StartDate
                            });
                            dataContext.SubmitChanges();
                        }
                    }
                    else
                    {
                        //error: room is not free
                    }
                }
                else
                {
                    //error: can not add/update new booking to the past
                }
            }
        }

        public static void DeleteRoomBooking(int roomBookingID)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                //todo: add validation of roomBookingEntity
                //      1) DB child validation
                //      2) can not remove past booking
                RoomBooking roomBooking = dataContext.RoomBookings.FirstOrDefault(s => s.RoomBookingID == roomBookingID);
                if (roomBooking != null)
                {
                    if (roomBooking.StartDate >= DateTime.Now)
                    {
                        dataContext.RoomBookings.DeleteOnSubmit(roomBooking);
                        dataContext.SubmitChanges();
                    }
                    else 
                    {
                        //error: can not remove from past
                    }
                }
                else
                {
                    //todo: not found
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
                    StartDate = roomBooking.StartDate
                };
                }
            }
            return null;
        }

        public static bool IsRoomBookingFree(int roomBookingID, int roomID, DateTime startDate, DateTime endDate)
        {
            using (DataClassesDataContext dataContext = HelperCommon.GetDataContext())
            {
                return !dataContext.RoomBookings.Any(s => !((s.EndDate <= startDate) || (s.StartDate >= endDate)) && s.RoomBookingID != roomBookingID && s.RoomID == roomID);
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
    }
}