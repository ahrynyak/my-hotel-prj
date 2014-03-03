using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Utils;
using AjaxControlToolkit;

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
                    if(!string.IsNullOrEmpty(startDateStr))
                    {
                        startDate = DateTime.Parse(startDateStr);
                    }
                }

                //Date
                TableRow rowDate = new TableRow();
                TableUtilitiesDetails.Rows.Add(rowDate);

                TableCell cellLableDate = new TableCell();
                cellLableDate.Controls.Add(new Label() { Text = "Дата", CssClass = "boldLabel" });
                rowDate.Cells.Add(cellLableDate);

                TableCell cellDate = new TableCell();
                cellDate.Controls.Add(new TextBox() { ID = "TextBoxDate" });
                cellDate.Controls.Add(new CalendarExtender() { ID = "CalendarExtenderDate", TargetControlID = "TextBoxDate" });
                rowDate.Cells.Add(cellDate);

                //Header
                TableRow rowHeader = new TableRow();
                TableUtilitiesDetails.Rows.Add(rowHeader);
                rowHeader.Cells.Add(new TableCell() { Text = "", CssClass = "boldLabel" }); ;
                rowHeader.Cells.Add(new TableCell() { Text = "Показник лічильника", CssClass = "boldLabel" });
                rowHeader.Cells.Add(new TableCell() { Text = "Інфо", CssClass = "boldLabel" });


                //Controlls
                foreach (var item in UtilitiesController.GetUtilitiesItems())
                {
                    TableRow row = new TableRow();
                    TableUtilitiesDetails.Rows.Add(row);

                    TableCell cellLable = new TableCell();
                    cellLable.Controls.Add(new Label() { Text = item.Name, ID = item.UtilitiesItemsID.ToString() });
                    row.Cells.Add(cellLable);


                    TableCell cellValue = new TableCell();
                    cellValue.Controls.Add(new TextBox() { Text = "", ID = item.UtilitiesItemsID.ToString() + "Value" });
                    cellValue.Controls.Add(new RequiredFieldValidator() { ErrorMessage = "*", CssClass = "errorValidation", ControlToValidate = item.UtilitiesItemsID.ToString() + "Value", ToolTip = "Обов'язкове поле" });
                    cellValue.Controls.Add(new FilteredTextBoxExtender() { TargetControlID = item.UtilitiesItemsID.ToString() + "Value", FilterType = FilterTypes.Custom, ValidChars = "01234567890.," });
                    row.Cells.Add(cellValue);

                    TableCell cellDesc = new TableCell();
                    cellDesc.Controls.Add(new TextBox() { Text = "", ID = item.UtilitiesItemsID.ToString() + "Desc" });
                    row.Cells.Add(cellDesc);
                }
            }
            catch (Exception ex)
            {
                //HelperCommon.ProcessException(La, ex);
            }
        }

        private void refreshUI()
        {
            try
            {
                
            }
            catch (Exception ex)
            {
                //HelperCommon.ProcessException(this, ex);
            }
        }
        protected void ButtonOK_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {

        }
    }
}