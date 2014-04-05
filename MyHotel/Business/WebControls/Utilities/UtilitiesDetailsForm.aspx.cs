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
        private DateTime startDate = DateTime.MinValue;
        private IEnumerable<int> utilitiesItemsDetailsIDs = new List<int>();
        List<UtilitiesItemsEntity> utilitiesItems = new List<UtilitiesItemsEntity>();
        private List<UtilitiesDetailsEntity> utilitiesDetails = new List<UtilitiesDetailsEntity>();

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
                    string startDateStr = Request.QueryString["startDate"];
                    if (!string.IsNullOrEmpty(startDateStr))
                    {
                        startDate = DateTime.Parse(startDateStr);
                    }
                }
                utilitiesItems = UtilitiesController.GetUtilitiesItems(utilitiesItemsDetailsIDs);
                utilitiesDetails = getCtrlValues();
                if (startDate == DateTime.MinValue)
                {
                    if (utilitiesItems != null && utilitiesItems.Any() && utilitiesItems.SelectMany(s => s.UtilitiesDetailsEntities).Any())
                    {
                        startDate = utilitiesItems.SelectMany(s => s.UtilitiesDetailsEntities).First().Date;
                    }
                    else if (utilitiesDetails != null && utilitiesDetails.Any())
                    {
                        startDate = utilitiesDetails.First().Date;
                    }
                    else
                    {
                        startDate = HelperCommon.GetUADateTimeNow();
                    }
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionNoToolTip(LabelError, ex);
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
                cellDate.ColumnSpan = 2;
                cellDate.Controls.Add(new TextBox() { ID = "TextBoxDate", Text = startDate.ToString(HelperCommon.DateFormat) });
                cellDate.Controls.Add(new CalendarExtender() { ID = "CalendarExtenderDate", TargetControlID = "TextBoxDate", Format = HelperCommon.DateFormat });
                rowDate.Cells.Add(cellDate);

                //Header
                TableRow rowHeader = new TableRow();
                TableUtilitiesDetails.Rows.Add(rowHeader);
                rowHeader.Cells.Add(new TableCell() { Text = "Показник лічильника", CssClass = "boldLabel", ColumnSpan = 2 });
                rowHeader.Cells.Add(new TableCell() { Text = "Інфо", CssClass = "boldLabel" });

                //Controlls
                foreach (var item in utilitiesItems)
                {
                    TableRow row = new TableRow();
                    TableUtilitiesDetails.Rows.Add(row);

                    TableCell cellLable = new TableCell();
                    cellLable.Controls.Add(new Label() { Text = item.Name, ID = item.UtilitiesItemsID.ToString() });
                    row.Cells.Add(cellLable);

                    UtilitiesDetailsEntity utilitiesDetailsEntity = null;
                    if (item.UtilitiesDetailsEntities != null && item.UtilitiesDetailsEntities.Any())
                    {
                        utilitiesDetailsEntity = item.UtilitiesDetailsEntities.First();
                    }
                    else if (utilitiesDetails != null && utilitiesDetails.Any())
                    {
                        utilitiesDetailsEntity = utilitiesDetails.FirstOrDefault(s => s.UtilitiesItemsID == item.UtilitiesItemsID);
                    }

                    ButtonDelete.Enabled = utilitiesDetailsEntity != null;
                    string txtName = getTxtBoxName((utilitiesDetailsEntity != null ? utilitiesDetailsEntity.UtilitiesItemsDetailsID : int.MinValue), item.UtilitiesItemsID, "Value");

                    TableCell cellValue = new TableCell();
                    cellValue.Controls.Add(new TextBox() { Text = (utilitiesDetailsEntity != null ? utilitiesDetailsEntity.Value.ToString() : ""), ID = txtName });
                    cellValue.Controls.Add(new RequiredFieldValidator() { ErrorMessage = "*", CssClass = "errorValidation", ControlToValidate = txtName, ToolTip = "Обов'язкове поле" });
                    cellValue.Controls.Add(new FilteredTextBoxExtender() { TargetControlID = txtName, FilterType = FilterTypes.Custom, ValidChars = "01234567890.," });
                    row.Cells.Add(cellValue);

                    TableCell cellDesc = new TableCell();
                    cellDesc.Controls.Add(new TextBox() { Text = (utilitiesDetailsEntity != null ? utilitiesDetailsEntity.Description : ""), ID = getTxtBoxName((utilitiesDetailsEntity != null ? utilitiesDetailsEntity.UtilitiesItemsDetailsID : int.MinValue), item.UtilitiesItemsID, "Desc") });
                    row.Cells.Add(cellDesc);
                }
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionNoToolTip(LabelError, ex);
            }
        }

        private void saveData()
        {
            UtilitiesController.SaveUtilitiesDetails(getCtrlValues());
        }

        private List<UtilitiesDetailsEntity> getCtrlValues()
        {
            List<UtilitiesDetailsEntity> result = new List<UtilitiesDetailsEntity>();
            if (Request.Form.AllKeys.Count() > 0)
            {
                DateTime date = DateTime.ParseExact(Request.Form.GetValues("TextBoxDate")[0], HelperCommon.DateFormat, CultureInfo.CurrentCulture);
                foreach (string txtKey in Request.Form.AllKeys.Where(s => s.Contains("Value")))
                {
                    int utilitiesItemsDetailsID = int.MinValue;
                    int utilitiesItemsID = int.MinValue;
                    string[] par = txtKey.Split(new string[] { "Value" }, StringSplitOptions.RemoveEmptyEntries);
                    if (par.Length > 0)
                    {
                        utilitiesItemsID = int.Parse(par[0]);
                        if (par.Length > 1)
                        {
                            utilitiesItemsDetailsID = int.Parse(par[1]);
                        }
                    }

                    string txtBoxValueText = Request.Form.GetValues(getTxtBoxName(utilitiesItemsDetailsID, utilitiesItemsID, "Value"))[0];
                    double uidValue = uidValue = (string.IsNullOrEmpty(txtBoxValueText) ? "0" : txtBoxValueText).ToDouble();
                    string uidDescr = Request.Form.GetValues(getTxtBoxName(utilitiesItemsDetailsID, utilitiesItemsID, "Desc"))[0];

                    if (utilitiesItemsID != int.MinValue && uidValue != double.MinValue)
                    {
                        result.Add(new UtilitiesDetailsEntity()
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
            return result;
        }

        private static string getTxtBoxName(int utilitiesItemsDetailsID, int utilitiesItemsID, string prefix)
        {
            return utilitiesItemsID + prefix + (utilitiesItemsDetailsID != int.MinValue ? utilitiesItemsDetailsID.ToString() : "");
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
                HelperCommon.ProcessExceptionNoToolTip(LabelError, ex);
                refreshUI();
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
                UtilitiesController.DeleteUtilitiesItems(getCtrlValues().Select(s => s.UtilitiesItemsDetailsID).Where(s => s > 0));
                Modal.Close(this, "OK");
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessExceptionNoToolTip(LabelError, ex);
            }
        }
    }
}