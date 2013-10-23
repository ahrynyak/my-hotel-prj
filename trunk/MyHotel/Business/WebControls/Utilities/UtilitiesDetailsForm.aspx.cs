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
                Panel panel = new Panel();
                Table table = new Table();
                panel.Controls.Add(table);

                //Date
                TableRow rowDate = new TableRow();
                table.Rows.Add(rowDate);

                TableCell cellLableDate = new TableCell();
                cellLableDate.Controls.Add(new Label() { Text = "Дата", CssClass = "boldLabel" });
                rowDate.Cells.Add(cellLableDate);

                TableCell cellDate = new TableCell();
                cellDate.Controls.Add(new TextBox() { ID = "TextBoxDate" });
                cellDate.Controls.Add(new CalendarExtender() { ID = "CalendarExtenderDate", TargetControlID = "TextBoxDate" });
                rowDate.Cells.Add(cellDate);

                //Header
                TableRow rowHeader = new TableRow();
                table.Rows.Add(rowHeader);
                rowHeader.Cells.Add(new TableCell() { Text = "", CssClass = "boldLabel" }); ;
                rowHeader.Cells.Add(new TableCell() { Text = "Показник лічильника", CssClass = "boldLabel" });
                rowHeader.Cells.Add(new TableCell() { Text = "Інфо", CssClass = "boldLabel" });


                //Controlls
                foreach (var item in UtilitiesController.GetUtilitiesItems())
                {
                    TableRow row = new TableRow();
                    table.Rows.Add(row);

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

                this.formUD.Controls.Add(panel);
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
                
            }
            catch (Exception ex)
            {
                HelperCommon.ProcessException(ex);
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