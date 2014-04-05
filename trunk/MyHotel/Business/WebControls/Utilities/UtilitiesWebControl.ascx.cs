using MyHotel.Business.Entity.Utilities;
using MyHotel.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyHotel.Business.WebControls.Utilities
{
    public partial class UtilitiesWebControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void Refresh(DateTime startDate, DateTime endDate)
        {
            List<UtilitiesItemsEntity> allUtilities = UtilitiesController.GetUtilitiesItems(startDate, endDate);
            TableRow headerRow = getHeaderRow(allUtilities);
            this.TableUtilities.Rows.Clear();
            this.TableUtilities.Rows.Add(headerRow);
            List<string> cssStyleList = new List<string>() { "White", "Silver" };
            foreach (var item in allUtilities.SelectMany(s => s.UtilitiesDetailsEntities).GroupBy(s => s.Date))
            {
                int cssIdx = 0;
                TableRow tableRowData = new TableRow();
                tableRowData.Cells.Add(new TableCell() { Text = item.Key.ToString(HelperCommon.DateFormatUtilities), CssClass = "utilitiesDataRow" + cssIdx });
                string utilitiesItemsDetailsIDs = string.Empty;
                foreach (var subItem in item.OrderBy(s => s.UtilitiesItemsID))
                {
                    tableRowData.Cells.Add(new TableCell() { Text = subItem.Value.ToString(), ToolTip = subItem.Description, CssClass = "utilitiesDataRow" + cssIdx });
                    utilitiesItemsDetailsIDs += subItem.UtilitiesItemsDetailsID + ",";
                }
                for (int i = 2; i < headerRow.Cells.Count - item.Count(); i++)
                {
                    tableRowData.Cells.Add(new TableCell() { Text = "", CssClass = "utilitiesDataRow" + cssIdx });
                }
                tableRowData.Cells.Add(new TableCell() { Text = getEditRow(utilitiesItemsDetailsIDs), CssClass = "utilitiesDataRow" + cssIdx });
                cssIdx = cssIdx == 0 ? 1 : 0;
                this.TableUtilities.Rows.Add(tableRowData);
            }
            if (FindControl("LabelAddNewRow") == null)
            {
                this.Controls.Add(new Label() { ID = "LabelAddNewRow", Text = getAddRow(startDate) });
            }
        }

        private TableRow getHeaderRow(List<UtilitiesItemsEntity> utilitiesItems)
        {
            TableRow result = new TableRow();
            result.Cells.Add(new TableCell() { Text = "Дата", CssClass = "utilitiesHeaderColl" });
            foreach (var item in utilitiesItems)
            {
                result.Cells.Add(new TableCell() { Text = item.Name, CssClass = "utilitiesHeaderColl" });
            }
            result.Cells.Add(new TableCell() { Text = "", CssClass = "utilitiesHeaderColl" });
            return result;
        }

        private string getAddRow(DateTime startDate)
        {
            return String.Format(
                "<span onclick=\"addNewUtilities(\'{0}\')\">" +
                    "<img src=\"../../icons/add1.ico\" class=\"utilitiesAddButton\"/>" +
                "</span>",
                startDate.ToShortDateString());
        }

        private string getEditRow(string utilitiesItemsDetailsIDs)
        {
            return String.Format(
                "<span onclick=\"editUtilities(\'{0}\')\">" +
                    "<img src=\"../../icons/edit.ico\" class=\"utilitiesEditButton\"/>" +
                "</span>", utilitiesItemsDetailsIDs);
        }
    }
}