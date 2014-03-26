using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using AjaxControlToolkit;
using MyHotel.Business.Entity.Utilities;
using System.Globalization;

namespace MyHotel.Business.WebControls.Utilities
{
    public partial class UtilitiesDetailsForm : System.Web.UI.Page
    {
        private bool isRemove = false;
        private DateTime startDate = DateTime.MinValue;
        private IEnumerable<int> utilitiesItemsDetailsIDs = new List<int>();
        
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
                    string utilitiesItemsDetailsIDsStr = Request.QueryString["utilitiesItemsDetailsIDs"];
                    if (!string.IsNullOrEmpty(utilitiesItemsDetailsIDsStr))
                    {
                        utilitiesItemsDetailsIDs = utilitiesItemsDetailsIDsStr.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(s => int.Parse(s));
                    }
                    string remove = Request.QueryString["remove"];
                    if (!string.IsNullOrEmpty(remove))
                    {
                        isRemove = bool.Parse(remove);
                    }
                    string startDateStr = Request.QueryString["startDate"];
                    if (!string.IsNullOrEmpty(startDateStr))
                    {
                        startDate = DateTime.Parse(startDateStr);
                    }
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(LabelError, ex);
            }
        }

        private void refreshUI()
        {
            try
            {
                //Date
                TableRow rowDate = new TableRow();
                TableUtilitiesDetails.Rows.Add(rowDate);

                TableCell cellLableDate = new TableCell();
                cellLableDate.Controls.Add(new Label() { Text = "Дата", CssClass = "boldLabel" });
                rowDate.Cells.Add(cellLableDate);

                TableCell cellDate = new TableCell();
                cellDate.Controls.Add(new TextBox() { ID = "TextBoxDate" });
                cellDate.Controls.Add(new CalendarExtender() { ID = "CalendarExtenderDate", TargetControlID = "TextBoxDate", Format = HelperCommon.DateFormat });
                rowDate.Cells.Add(cellDate);

                //Header
                TableRow rowHeader = new TableRow();
                TableUtilitiesDetails.Rows.Add(rowHeader);
                rowHeader.Cells.Add(new TableCell() { Text = "", CssClass = "boldLabel" }); ;
                rowHeader.Cells.Add(new TableCell() { Text = "Показник лічильника", CssClass = "boldLabel" });
                rowHeader.Cells.Add(new TableCell() { Text = "Інфо", CssClass = "boldLabel" });

                //Controlls
                foreach (var item in UtilitiesController.GetUtilitiesItems(utilitiesItemsDetailsIDs))
                {
                    TableRow row = new TableRow();
                    TableUtilitiesDetails.Rows.Add(row);

                    TableCell cellLable = new TableCell();
                    cellLable.Controls.Add(new Label() { Text = item.Name, ID = item.UtilitiesItemsID.ToString() });
                    row.Cells.Add(cellLable);
                    UtilitiesDetailsEntity utilitiesDetailsEntity = item.UtilitiesDetailsEntities.FirstOrDefault();
                    string txtName = item.UtilitiesItemsID.ToString() + "Value" + (utilitiesDetailsEntity != null ? utilitiesDetailsEntity.UtilitiesItemsDetailsID.ToString() : "");

                    TableCell cellValue = new TableCell();
                    cellValue.Controls.Add(new TextBox() { Text = (utilitiesDetailsEntity != null ? utilitiesDetailsEntity.Value.ToString() : ""), ID = txtName, AutoPostBack = true });
                    cellValue.Controls.Add(new RequiredFieldValidator() { ErrorMessage = "*", CssClass = "errorValidation", ControlToValidate = txtName, ToolTip = "Обов'язкове поле" });
                    cellValue.Controls.Add(new FilteredTextBoxExtender() { TargetControlID = txtName, FilterType = FilterTypes.Custom, ValidChars = "01234567890.," });
                    row.Cells.Add(cellValue);

                    TableCell cellDesc = new TableCell();
                    cellDesc.Controls.Add(new TextBox() { Text = (utilitiesDetailsEntity != null ? utilitiesDetailsEntity.Description : ""), ID = item.UtilitiesItemsID.ToString() + "Desc" });
                    row.Cells.Add(cellDesc);
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(LabelError, ex);
            }
        }

        private void saveData()
        {
            initData();
            List<UtilitiesDetailsEntity> utilitiesItemsDetailsValues = new List<UtilitiesDetailsEntity>();
            foreach (TableRow row in TableUtilitiesDetails.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    int utilitiesItemsDetailsID = int.MinValue;
                    int utilitiesItemsID = int.MinValue;
                    double uidValue = double.MinValue;
                    string uidDescr = string.Empty;
                    DateTime date = DateTime.MinValue;
                    foreach (Control ctrl in cell.Controls)
                    {
                        if (!string.IsNullOrEmpty(ctrl.ID) && ctrl.ID == "TextBoxDate")
                        {
                            date = DateTime.ParseExact(((TextBox)ctrl).Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                        }
                        if (!string.IsNullOrEmpty(ctrl.ID) && ctrl.ID.Contains("Value"))
                        {
                            uidValue = double.Parse(string.IsNullOrEmpty(((TextBox)ctrl).Text) ? "0" : ((TextBox)ctrl).Text);

                            #region Parse IDs

                            string[] par = ctrl.ID.Split(new string[] { "Value" }, StringSplitOptions.RemoveEmptyEntries);
                            if (par.Length > 0)
                            {
                                utilitiesItemsID = int.Parse(par[0]);
                                if (par.Length > 1)
                                {
                                    utilitiesItemsDetailsID = int.Parse(par[1]);
                                }
                            }

                            #endregion
                        }
                        if (!string.IsNullOrEmpty(ctrl.ID) && ctrl.ID.Contains("Desc"))
                        {
                            uidDescr = ((TextBox)ctrl).Text;
                        }
                    }

                    if (utilitiesItemsID != int.MinValue && uidValue != double.MinValue)
                    {
                        utilitiesItemsDetailsValues.Add(new UtilitiesDetailsEntity()
                        {
                            UtilitiesItemsID = utilitiesItemsID,
                            UtilitiesItemsDetailsID = utilitiesItemsDetailsID != int.MinValue ? utilitiesItemsDetailsID : 0,
                            Description = uidDescr,
                            Value = uidValue,
                            Date = date
                        });
                    }
                }
            }
            //utilitiesItemsDetailsValues
                
             //[0].Cells[1].Controls[0].ID

            //if (roomBookingEntity != null)
            //{
            //    roomBookingEntity.GuestName = TextBoxGuestName.Text;
            //    roomBookingEntity.GuestPhone = TextBoxGuestPhone.Text;
            //    roomBookingEntity.NumberOfAdult = int.Parse(string.IsNullOrEmpty(TextBoxAdultNumber.Text) ? "0" : TextBoxAdultNumber.Text);
            //    roomBookingEntity.NumberOfChild = int.Parse(string.IsNullOrEmpty(TextBoxChildrenNumber.Text) ? "0" : TextBoxChildrenNumber.Text);
            //    roomBookingEntity.PricePerRoom = int.Parse(string.IsNullOrEmpty(TextBoxPricePerRoom.Text) ? "0" : TextBoxPricePerRoom.Text);
            //    roomBookingEntity.PriceOfAdditionalBed = int.Parse(string.IsNullOrEmpty(TextBoxPriceForExtraBed.Text) ? "0" : TextBoxPriceForExtraBed.Text);
            //    roomBookingEntity.StartDate = DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
            //    roomBookingEntity.EndDate = DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture);
            //    roomBookingEntity.BookingStatus = int.Parse((DropDownListBookingStatus.SelectedItem != null ? DropDownListBookingStatus.SelectedItem.Value : "0"));
            //    roomBookingEntity.AdditionalInfo = TextBoxAdditionalInfo.Text;
            //    roomBookingEntity.AlreadyPaid = int.Parse(TextBoxPaid.Text);
            //    BookingController.SaveRoomBooking(roomBookingEntity);
            //}
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
                HelperCommon.ProcessException(LabelError, ex);
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
                UtilitiesController.DeleteUtilitiesItems(utilitiesItemsDetailsIDs);
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(LabelError, ex);
            }
        }
    }
}