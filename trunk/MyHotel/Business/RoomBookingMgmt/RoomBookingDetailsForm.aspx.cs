using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity;
using MyHotel.Utils;

namespace MyHotel.Business.RoomBookingMgmt
{
    public partial class RoomBookingDetailsForm : System.Web.UI.Page
    {
        private RoomBookingEntity roomBookingEntity = null;
        private RoomDetailedEntity roomDetailedEntity = null;
        private bool isEdit = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                initData();
                refreshUI();
                calculateSum();
            }
        }

        private void initData()
        {
            if (Request.QueryString.Count > 0)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    isEdit = true;
                    //edit
                    roomBookingEntity = RoomBookingMgmtController.GetRoomBookingByID(int.Parse(id));
                }
                else
                {
                    isEdit = false;
                    //new
                    string startDate = Request.QueryString["start"];
                    string endDate = Request.QueryString["end"];
                    string resourceID = Request.QueryString["r"];
                    roomBookingEntity = new RoomBookingEntity()
                    {
                        BookingStatus = EBookingStatus.NotConfirmed.GetHashCode(),
                        EndDate = DateTime.Parse(endDate),
                        RoomID = int.Parse(resourceID),
                        StartDate = DateTime.Parse(startDate)
                    };
                }

                if (roomBookingEntity != null)
                {
                    roomDetailedEntity = RoomBookingMgmtController.GetRoomDetailedByID(roomBookingEntity.RoomID);
                    if (!isEdit && roomDetailedEntity != null)
                    {
                        roomBookingEntity.NumberOfAdult = roomDetailedEntity.Capacity;
                    }
                }
                else
                {

                    //"roomBookingEntity null"
                }
            }
            else
            {
                //" should be some parameters set"
            }
        }

        private void refreshUI()
        {
            if (roomBookingEntity != null)
            {
                if (roomDetailedEntity != null)
                {
                    LabelRoomNameValue.Text = roomDetailedEntity.Name;
                }
                TextBoxGuestName.Text = roomBookingEntity.GuestName;
                TextBoxGuestPhone.Text = roomBookingEntity.GuestPhone;
                TextBoxAdultNumber.Text = roomBookingEntity.NumberOfAdult.ToString();
                TextBoxChildrenNumber.Text = roomBookingEntity.NumberOfChild.ToString();
                TextBoxPricePerRoom.Text = roomBookingEntity.PricePerRoom.ToString();
                TextBoxPriceForExtraBed.Text = roomBookingEntity.PriceOfAdditionalBed.ToString();
                datePickeStartDate.SelectedDate = roomBookingEntity.StartDate;
                datePickeEndDate.SelectedDate = roomBookingEntity.EndDate;
                DropDownListBookingStatus.Items.Clear();
                foreach (var item in RoomBookingMgmtController.GetStatuses())
                {
                    var listItem = new ListItem(item.Key, item.Value);
                    listItem.Selected = item.Value == roomBookingEntity.BookingStatus.GetHashCode().ToString();
                    DropDownListBookingStatus.Items.Add(listItem);
                }
                TextBoxAdditionalInfo.Text = roomBookingEntity.AdditionalInfo ?? "";
            }
        }

        private void saveData()
        {
            initData();
            if (roomBookingEntity != null)
            {
                roomBookingEntity.GuestName = TextBoxGuestName.Text;
                roomBookingEntity.GuestPhone = TextBoxGuestPhone.Text;
                roomBookingEntity.NumberOfAdult = int.Parse(TextBoxAdultNumber.Text);
                roomBookingEntity.NumberOfChild = int.Parse(TextBoxChildrenNumber.Text);
                roomBookingEntity.PricePerRoom = int.Parse(TextBoxPricePerRoom.Text);
                roomBookingEntity.PriceOfAdditionalBed = int.Parse(TextBoxPriceForExtraBed.Text);
                roomBookingEntity.StartDate = datePickeStartDate.SelectedDate;
                roomBookingEntity.EndDate = datePickeEndDate.SelectedDate;
                roomBookingEntity.BookingStatus = int.Parse(DropDownListBookingStatus.SelectedItem.Value);
                roomBookingEntity.AdditionalInfo = TextBoxAdditionalInfo.Text;
                RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            saveData();
            Modal.Close(this, "OK");
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }

        protected void LinkButtonDeleteBooking_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            RoomBookingMgmtController.DeleteRoomBooking(int.Parse(id));
            Modal.Close(this, "OK");
        }

        private void calculateSum()
        {
            LabelAmountOfDaysValue.Text = (datePickeEndDate.SelectedDate - datePickeStartDate.SelectedDate).TotalDays.ToString();
            LabelAmountToBePaidValue.Text = (
                (int.Parse(!string.IsNullOrEmpty(TextBoxPricePerRoom.Text) ? TextBoxPricePerRoom.Text : "0") + int.Parse(!string.IsNullOrEmpty(TextBoxPriceForExtraBed.Text) ? TextBoxPriceForExtraBed.Text : "0"))
                *
                int.Parse(LabelAmountOfDaysValue.Text)
                ).ToString();
            LabelAmountRemainderToBePaidValue.Text = (int.Parse(LabelAmountToBePaidValue.Text) - int.Parse(!string.IsNullOrEmpty(TextBoxPaid.Text) ? TextBoxPaid.Text : "0")).ToString();
        }

        protected void TextBoxPricePerRoom_TextChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void datePickeStartDate_SelectionChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void datePickeEndDate_SelectionChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void TextBoxPriceForExtraBed_TextChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void TextBoxPaid_TextChanged(object sender, EventArgs e)
        {
            calculateSum();
        }

        protected void ImageButtonRefreshCalculation_Click(object sender, ImageClickEventArgs e)
        {
            calculateSum();
        }

    }
}