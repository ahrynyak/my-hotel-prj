using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity;
using Obout.Ajax.UI.TreeView;
using MyHotel.Business.Entity.Incomes;
using MyHotel.Business.Entity.Booking;
using MyHotel.Utils;

namespace MyHotel.Business.WebControls.Incomes
{
    public partial class IncomesControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Refresh(DateTime startDate, DateTime endDate)
        {
            var allIncomes = IncomesController.GetPlanedIncomesData(startDate, endDate);
            this.TablePlanned.Rows.Clear();
            this.TablePlanned.Rows.AddRange(getHeaderRow(allIncomes.Select(s => s.RoomEntity).ToList()).ToArray());
            foreach (var statusValue in Enum.GetValues(typeof(EBookingStatus)))
            {
                this.TablePlanned.Rows.Add(getDataRow(allIncomes, (EBookingStatus)statusValue, (int)(endDate - startDate).TotalDays));
            }

        }

        private List<TableRow> getHeaderRow(List<RoomEntity> rooms)
        {
            List<TableRow> result = new List<TableRow>();

            TableRow header = new TableRow();
            header.CssClass = "incomesHeaderRow";
            header.Cells.Add(new TableCell() { Text = "Статус", RowSpan = 2 });
            foreach (var room in rooms)
            {
                header.Cells.Add(new TableCell() { Text = room.Name, ColumnSpan = 3 });
            }
            header.Cells.Add(new TableCell() { Text = "Сума", ColumnSpan = 2 });
            header.Cells.Add(new TableCell() { Text = "Avg", ColumnSpan = 3 });


            TableRow subHeader = new TableRow();
            subHeader.CssClass = "incomesSubHeaderRow";
            foreach (var room in rooms)
            {
                subHeader.Cells.Add(new TableCell() { Text = "∑₴", CssClass = "incomesSubHeaderCell" });
                subHeader.Cells.Add(new TableCell() { Text = "днів", CssClass = "incomesSubHeaderCell" });
                subHeader.Cells.Add(new TableCell() { Text = "%", CssClass = "incomesSubHeaderCell" });
            }
            //sum
            subHeader.Cells.Add(new TableCell() { Text = "∑₴", CssClass = "incomesSubHeaderTotalCell" });
            subHeader.Cells.Add(new TableCell() { Text = "днів", CssClass = "incomesSubHeaderTotalCell" });

            //avg
            subHeader.Cells.Add(new TableCell() { Text = "∑₴", CssClass = "incomesSubHeaderTotalCell" });
            subHeader.Cells.Add(new TableCell() { Text = "днів", CssClass = "incomesSubHeaderTotalCell" });
            subHeader.Cells.Add(new TableCell() { Text = "%", CssClass = "incomesSubHeaderTotalCell" });

            result.Add(header);
            result.Add(subHeader);
            return result;

        }

        private TableRow getDataRow(List<IncomeByRoomEntity> planedIncomesData, EBookingStatus bookingStatus, int daysInSelectedRange)
        {
            TableRow result = new TableRow() { CssClass = "incomesDataRow" };
            result.Cells.Add(new TableCell() { Text = bookingStatus.ToString() });
            List<double> allSumByRow = new List<double>();
            List<double> allDaysByRow = new List<double>();
            List<double> allPercentByRow = new List<double>();

            foreach (var dataForRoom in planedIncomesData)
            {
                var data = dataForRoom.IncomesByStatus.First(s => s.BookingStatus == bookingStatus);
                allSumByRow.Add(data.TotalSum);
                result.Cells.Add(new TableCell() { Text = allSumByRow.Last().ToString(), CssClass = "incomesDataCell" });
                allDaysByRow.Add(data.TotalDays);
                result.Cells.Add(new TableCell() { Text = allDaysByRow.Last().ToString(), CssClass = "incomesDataCell" });
                allPercentByRow.Add(((data.TotalDays / daysInSelectedRange) * 100));
                result.Cells.Add(new TableCell() { Text = allPercentByRow.Last().ToString(), CssClass = "incomesDataCell" });

            }
            //sum
            result.Cells.Add(new TableCell() { Text = allSumByRow.Sum().ToString(), CssClass = "incomesTotalDataCell" });
            result.Cells.Add(new TableCell() { Text = allDaysByRow.Sum().ToString(), CssClass = "incomesTotalDataCell" });
            //avg
            result.Cells.Add(new TableCell() { Text = allSumByRow.Average().ToString(), CssClass = "incomesTotalDataCell" });
            result.Cells.Add(new TableCell() { Text = allDaysByRow.Average().ToString(), CssClass = "incomesTotalDataCell" });
            result.Cells.Add(new TableCell() { Text = allPercentByRow.Average().ToString(), CssClass = "incomesTotalDataCell" });
            return result;
        }

    }
}