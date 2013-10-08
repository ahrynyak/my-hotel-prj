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
            this.TablePlanned.Rows.AddRange(getHeaderRow().ToArray());
            int totalDays = (int)(endDate - startDate).TotalDays;
            totalDays = totalDays == 0 ? 1 : totalDays;
            foreach (var room in allIncomes)
            {
                this.TablePlanned.Rows.AddRange(getDataRow(room, totalDays).ToArray());
            }

            this.TablePlanned.Rows.AddRange(getTotalRow(allIncomes, totalDays).ToArray());
        }

        private List<TableRow> getHeaderRow()
        {
            List<TableRow> result = new List<TableRow>();

            TableRow header = new TableRow();
            header.Cells.Add(new TableCell() { Text = "Номер", RowSpan = 2, ColumnSpan = 2, CssClass = "incomesRoomHeaderColl" });

            var statuses = Enum.GetValues(typeof(EBookingStatus));
            header.Cells.Add(new TableCell() { Text = "Статус", ColumnSpan = statuses.Length, CssClass = "incomesStatusHeaderCell" });
            
            TableRow subHeader = new TableRow();
            foreach (var statusValue in statuses)
            {
                subHeader.Cells.Add(new TableCell() { Text = statusValue.ToString(), CssClass = "incomesSubHeaderColl" });
            }
            header.Cells.Add(new TableCell() { Text = "Сума", RowSpan = 2, CssClass = "incomesTotalHeaderColl" });

            result.Add(header);
            result.Add(subHeader);
            return result;

        }

        private List<TableRow> getDataRow(IncomeByRoomEntity incomeByRoomEntity, int daysInSelectedRange)
        {
            List<TableRow> result = new List<TableRow>();
            TableRow roomName = new TableRow();
            roomName.Cells.Add(new TableCell() { Text = incomeByRoomEntity.RoomEntity.Name, RowSpan = 4, CssClass = "incomesRoomNameDataRow" });
            result.Add(roomName);

            TableRow tableRowSum = new TableRow();
            tableRowSum.Cells.Add(new TableCell() { Text = "∑", CssClass = "incomesRoomSumDataRow" });
            
            TableRow tableRowDays = new TableRow();
            tableRowDays.Cells.Add(new TableCell() { Text = "днів", CssClass = "incomesRoomDaysDataRow" });
            
            TableRow tableRowPercent = new TableRow();
            tableRowPercent.Cells.Add(new TableCell() { Text = "%", CssClass = "incomesRoomPercentDataRow" });

            List<double> allSumByRow = new List<double>();
            List<double> allDaysByRow = new List<double>();
            List<double> allPercentByRow = new List<double>();
            foreach (var valueByStatus in incomeByRoomEntity.IncomesByStatus)
            {
                allSumByRow.Add(valueByStatus.TotalSum);
                tableRowSum.Cells.Add(new TableCell() { Text = allSumByRow.Last().ToString(HelperCommon.DoubleFormat), CssClass = "incomesDataRow" });
                allDaysByRow.Add(valueByStatus.TotalDays);
                tableRowDays.Cells.Add(new TableCell() { Text = allDaysByRow.Last().ToString(), CssClass = "incomesDataRow" });
                allPercentByRow.Add(((double)(valueByStatus.TotalDays * 100 / daysInSelectedRange)));
                tableRowPercent.Cells.Add(new TableCell() { Text = allPercentByRow.Last().ToString(HelperCommon.DoubleFormat), CssClass = "incomesDataRow" });
            }

            tableRowSum.Cells.Add(new TableCell() { Text = allSumByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalDataRow" });

            tableRowDays.Cells.Add(new TableCell() { Text = allDaysByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalDataRow" });

            tableRowPercent.Cells.Add(new TableCell() { Text = allPercentByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalDataRow" });

            result.Add(tableRowSum);
            result.Add(tableRowDays);
            result.Add(tableRowPercent);

            return result;
        }

        private List<TableRow> getTotalRow(List<IncomeByRoomEntity> allIncomes, int daysInSelectedRange)
        {
            List<TableRow> result = new List<TableRow>();
            
            TableRow tableTotalRow = new TableRow();
            tableTotalRow.Cells.Add(new TableCell() { Text = "Сума", RowSpan = 4, CssClass = "incomesTotalHeaderRow" });
            result.Add(tableTotalRow);

            TableRow tableRowSum = new TableRow();
            tableRowSum.Cells.Add(new TableCell() { Text = "∑", CssClass = "incomesTotalHeaderSubRow" });

            TableRow tableRowDays = new TableRow();
            tableRowDays.Cells.Add(new TableCell() { Text = "днів", CssClass = "incomesTotalHeaderSubRow" });

            TableRow tableRowPercent = new TableRow();
            tableRowPercent.Cells.Add(new TableCell() { Text = "%", CssClass = "incomesTotalHeaderSubRow" });
            result.Add(tableRowSum);
            result.Add(tableRowDays);
            result.Add(tableRowPercent);

            List<double> allSumByRow = new List<double>();
            List<double> allDaysByRow = new List<double>();
            List<double> allPercentByRow = new List<double>();
            foreach (var valueByStatus in allIncomes.SelectMany(s => s.IncomesByStatus).GroupBy(s => s.BookingStatus))
            {
                allSumByRow.Add(valueByStatus.Sum(s=>s.TotalSum));
                tableRowSum.Cells.Add(new TableCell() { Text = allSumByRow.Last().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalHeaderSubRow" });
                allDaysByRow.Add(valueByStatus.Sum(s=>s.TotalDays));
                tableRowDays.Cells.Add(new TableCell() { Text = allDaysByRow.Last().ToString(), CssClass = "incomesTotalHeaderSubRow" });
                allPercentByRow.Add(valueByStatus.Sum(s => (double)(s.TotalDays * 100 / daysInSelectedRange)));
                tableRowPercent.Cells.Add(new TableCell() { Text = allPercentByRow.Last().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalHeaderSubRow" });
            }

            tableRowSum.Cells.Add(new TableCell() { Text = allSumByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalHeaderSubRow" });

            tableRowDays.Cells.Add(new TableCell() { Text = allDaysByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalHeaderSubRow" });

            tableRowPercent.Cells.Add(new TableCell() { Text = allPercentByRow.Where(s => s > 0).Sum().ToString(HelperCommon.DoubleFormat), CssClass = "incomesTotalHeaderSubRow" });

            return result;
        }

    }
}