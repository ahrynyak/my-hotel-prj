using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using MyHotel.Business.Entity.Expenses;

namespace MyHotel.Business.ExpensesMgmt
{
    public partial class ExpensesDetailsMgmtForm : System.Web.UI.Page
    {
        private bool isEdit = false;
        private ExpensesDetailsEntity expensesDetailsEntity = null;
        private ExpensesItemsEntity expensesItemsEntity = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                initData();
                refreshUI();
            }
        }

        private void initData()
        {
            try
            {
                if (Request.QueryString.Count > 0)
                {
                    string expensID = Request.QueryString["expensID"];
                    if (!string.IsNullOrEmpty(expensID))
                    {
                        //new
                        isEdit = false;
                        expensesItemsEntity = ExpensesMgmtController.GetExpensesItemsByID(int.Parse(expensID));
                        expensesDetailsEntity = new ExpensesDetailsEntity() { ExpensesItemID = expensesItemsEntity.ExpensesItemID, Cost = 0, Date = DateTime.Now };
                    }
                    else
                    {
                        //edit
                        isEdit = true;
                        string subGrID = Request.QueryString["subGrID"];
                        if (!string.IsNullOrEmpty(expensID))
                        {
                            expensesDetailsEntity = ExpensesMgmtController.GetExpensesDetailsByID(int.Parse(subGrID));
                            expensesItemsEntity = ExpensesMgmtController.GetExpensesItemsByID(expensesDetailsEntity.ExpensesItemID);
                        }
                        else
                        {
                            MessageBox.Show("Некоректні параметри");
                        }
                    }
                    ButtonDelete.Visible = isEdit;
                }
                else
                {
                    MessageBox.Show("Відсутні параметри");
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        private void refreshUI()
        {
            try
            {
                if (expensesDetailsEntity != null)
                {
                    TextBoxDate.Text = expensesDetailsEntity.Date.ToString(HelperCommon.DateFormat);
                    TextBoxCost.Text = expensesDetailsEntity.Cost.ToString();
                    TextBoxInfo.Text = expensesDetailsEntity.Description;
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        private void saveData()
        {
            initData();
            if (roomBookingEntity != null)
            {
                roomBookingEntity.GuestName = TextBoxGuestName.Text;
                roomBookingEntity.GuestPhone = TextBoxGuestPhone.Text;
                roomBookingEntity.NumberOfAdult = int.Parse(string.IsNullOrEmpty(TextBoxAdultNumber.Text) ? "0" : TextBoxAdultNumber.Text);
                roomBookingEntity.NumberOfChild = int.Parse(string.IsNullOrEmpty(TextBoxChildrenNumber.Text) ? "0" : TextBoxChildrenNumber.Text);
                roomBookingEntity.PricePerRoom = int.Parse(string.IsNullOrEmpty(TextBoxPricePerRoom.Text) ? "0" : TextBoxPricePerRoom.Text);
                roomBookingEntity.PriceOfAdditionalBed = int.Parse(string.IsNullOrEmpty(TextBoxPriceForExtraBed.Text) ? "0" : TextBoxPriceForExtraBed.Text);
                roomBookingEntity.StartDate = DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                roomBookingEntity.EndDate = DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                roomBookingEntity.BookingStatus = int.Parse((DropDownListBookingStatus.SelectedItem != null ? DropDownListBookingStatus.SelectedItem.Value : "0"));
                roomBookingEntity.AdditionalInfo = TextBoxAdditionalInfo.Text;
                roomBookingEntity.AlreadyPaid = int.Parse(TextBoxPaid.Text);
                RoomBookingMgmtController.SaveRoomBooking(roomBookingEntity);
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            try
            {
                saveData();
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string id = Request.QueryString["id"];
                RoomBookingMgmtController.DeleteRoomBooking(int.Parse(id));
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
            }

        }
    }
}