using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using Google.Apis.Calendar.v3;
using System.Web.UI;
using Google.Apis.Auth.OAuth2;
using System.Threading;
using Google.Apis.Services;
using MyHotel.Business.Entity.Utilities;
using Google.Apis.Calendar.v3.Data;

namespace MyHotel.Utils
{
    public class GoogleCalendarHelper
    {
        static Uri postUri = new Uri("https://www.google.com/calendar/feeds/default/private/full");
        static string calendarID = "zelenasadybainfo@gmail.com";

        public static CalendarService GAuthenticate()
        {
            UserCredential credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                new ClientSecrets
                {
                    ClientId = "279701482689-c42s0ff3tkvuq758elkib5fl0btqdqh4.apps.googleusercontent.com",//"zelenasadybainfo@gmail.com",
                    ClientSecret = "notasecret"//"ukr_root",
                },
                new[] { CalendarService.Scope.Calendar },
                "zelenasadybainfo@gmail.com", CancellationToken.None).Result;
            // Create the service.
            CalendarService calendarService = new CalendarService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = AppDomain.CurrentDomain.FriendlyName,
            });

            return calendarService;
        }

        public static IList<Event> GetEventsByDate(DateTime date)
        {
            EventsResource.ListRequest req = GAuthenticate().Events.List(calendarID);
            req.TimeMin = Convert.ToDateTime(new DateTime(date.Year - 1, 1, 1));
            req.TimeMax = Convert.ToDateTime(new DateTime(date.Year + 1, 1, 1));
            req.SingleEvents = true;
            req.OrderBy = EventsResource.ListRequest.OrderByEnum.StartTime;
            Events events = req.Execute();
            return events.Items;
        }

        public static void ManageRoomBookingEvent(string dbID, string title, string content, DateTime date)
        {
            Event entry = null;
            IList<Event> existingEvents = GetEventsByDate(date);
            if (existingEvents.Any(s => s.Id == dbID))
            {
                entry = existingEvents.First(s => s.Id == dbID);
                setRoomBookingEventParameters(entry, title, content, date);
                var resEvent = GAuthenticate().Events.Update(entry, calendarID, entry.Id).Execute();
            }
            else
            {
                entry = new Event();
                setRoomBookingEventParameters(entry, title, content, date);
                entry.ExtendedProperties.Private.Add("DBID", dbID);
                var resEvent =  GAuthenticate().Events.Insert(entry, calendarID).Execute();
            }
        }

        private static void setRoomBookingEventParameters(Event entry, string title, string description, DateTime date)
        {
            // Set the title and content of the entry.
            entry.Summary = title;
            entry.Description = description;

            EventDateTime start = new EventDateTime();
            start.DateTime = new DateTime(date.Date.Year, date.Date.Month, date.Date.Day, 9, 0, 0, DateTimeKind.Utc);
            entry.Start = start;
            EventDateTime end = new EventDateTime();
            end.DateTime = new DateTime(date.Date.Year, date.Date.Month, date.Date.Day, 10, 0, 0, DateTimeKind.Utc);
            entry.End = end;

            //sms
            EventReminder reminder = new EventReminder();
            reminder.Minutes = (int)TimeSpan.FromDays(1).TotalMinutes;
            reminder.Method = "sms";
            entry.Reminders.Overrides.Add(reminder);
        }

        public static Dictionary<string, Event> GetRoomBookingEvents(DateTime startDate, DateTime endDate)
        {
            Dictionary<string, Event> result = new Dictionary<string, Event>();
            EventsResource.ListRequest req = GAuthenticate().Events.List(calendarID);
            req.TimeMin = Convert.ToDateTime(startDate);
            req.TimeMax = Convert.ToDateTime(endDate);
            req.SingleEvents = true;
            req.OrderBy = EventsResource.ListRequest.OrderByEnum.StartTime;
            Events events = req.Execute();
            foreach (var item in events.Items)
            {
                if (item.ExtendedProperties.Private.Any(s => s.Key == "DBID"))
                {
                    result.Add(item.ExtendedProperties.Private["DBID"], item);
                }
            }
            return result;
        }

        public static void DeleteEvent(string eventID)
        {
            GAuthenticate().Events.Delete(calendarID, eventID).Execute();
        }
    }
}