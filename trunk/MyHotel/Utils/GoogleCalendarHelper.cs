using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Google.GData.Calendar;
using Google.GData.Extensions;
using Google.GData.Client;
using System.Net;

namespace MyHotel.Utils
{
    public class GoogleCalendarHelper
    {
        static Uri postUri = new Uri("https://www.google.com/calendar/feeds/default/private/full");

        public static CalendarService GAuthenticate()
        {
            CalendarService calendarService = new CalendarService(AppDomain.CurrentDomain.FriendlyName);
            calendarService.setUserCredentials("zelenasadybainfo@gmail.com", "ukr_root");
            return calendarService;
        }

        public static void ManageRoomBookingEvent(string dbID, string title, string content, DateTime date)
        {
            EventEntry entry = null;
            Dictionary<string, EventEntry> existingEvents = GetRoomBookingEvents(new DateTime(date.Year, date.Month - 1, 1), new DateTime(date.Year, date.Month + 1, 1));
            if (existingEvents.Any(s => s.Key == dbID))
            {
                entry = existingEvents.First(s => s.Key == dbID).Value;
                setRoomBookingEventParameters(entry, title, content, date);
                entry.Update();
            }
            else
            {
                entry = new EventEntry();
                setRoomBookingEventParameters(entry, title, content, date);
                //db id
                ExtendedProperty propertyDBID = new ExtendedProperty();
                propertyDBID.Name = "DBID";
                propertyDBID.Value = dbID;
                entry.ExtensionElements.Add(propertyDBID);

                // Send the request and receive the response:
                AtomEntry insertedEntry = GAuthenticate().Insert(postUri, entry);
            }
        }

        private static void setRoomBookingEventParameters(EventEntry entry, string title, string content, DateTime date)
        {
            // Set the title and content of the entry.
            entry.Title.Text = title;
            entry.Content.Content = content;

            When eventTime = new When(date.Date.AddHours(12), date.Date.AddHours(13));
            entry.Times.Clear();
            entry.Times.Add(eventTime);

            //sms
            Reminder smsReminder = new Reminder();
            smsReminder.Days = 1;
            smsReminder.Method = Reminder.ReminderMethod.sms;
            entry.Reminders.Add(smsReminder);
        }

        public static Dictionary<string, EventEntry> GetRoomBookingEvents(DateTime startDate, DateTime endDate)
        {
            Dictionary<string, EventEntry> result = new Dictionary<string, EventEntry>();
            EventQuery eventQuery = new EventQuery();
            eventQuery.Uri = postUri;
            eventQuery.StartTime = startDate;
            eventQuery.EndTime = endDate;
            var res = GAuthenticate().Query(eventQuery);
            foreach (var item in res.Entries)
            {
                if (item is EventEntry)
                {
                    EventEntry eventEntry = (EventEntry)item;
                    IEnumerable<ExtendedProperty> extendedProperties = eventEntry.ExtensionElements.OfType<ExtendedProperty>();
                    if (extendedProperties.Any())
                    {
                        result.Add(extendedProperties.First(s => s.Name == "DBID").Value, eventEntry);
                    }
                }
            }
            return result;
        }
    }
}