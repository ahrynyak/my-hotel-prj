using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity;
using Obout.Ajax.UI.TreeView;
using MyHotel.Business.Entity.Incomes;

namespace MyHotel.Business.WebControls.Incomes
{
    public partial class IncomesControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Refresh(DateTime startDate, DateTime endDate)
        {
            TreeIncomes.Nodes.Clear();
            TreeIncomes.Nodes.Add(new Node(getHeaderText()));
            var allIncomes = IncomesController.GetRoomIncomes(startDate, endDate);
            foreach (var incomeByRoom in allIncomes)
            {
                Node roomTreeNode = new Node();
                roomTreeNode.Text = getIncomeItemText(incomeByRoom);
                TreeIncomes.Nodes.Add(roomTreeNode);
            }
            TreeIncomes.ExpandAll();
        }

        #region css format for tree nodes
        private string getHeaderText()
        {
            return String.Format("<strong>" +
            "<span class=\"incomesHeaderRoomNameDiv\">{0}</span>" +
            "<span class=\"incomesHeaderSumDiv\">{1}</span>" +
            "<span class=\"incomesHeaderSumDiv\">{2}</span>" +
            "<span class=\"incomesHeaderSumDiv\">{3}</span>" +
            "<span class=\"incomesHeaderSumDiv\">{4}</span>" +
            "<span class=\"incomesHeaderAmountOfDayDiv\">{5}</span>" +
            "<span class=\"incomesHeaderPercentDiv\">{6}</span></strong>", "Номер", "Не підв.сума", "Підв.сума", "Передопл.сума", "Оплачена сума", "К-ть днів", "%");
        }

        private string getIncomeItemText(IncomeByRoomEntity expensesItemsEntity)
        {
            return String.Format(
                "<span class=\"incomesRoomNameDiv\">{0}</span>" +
                "<span class=\"incomesSumDiv\">{1}</span>" +
                "<span class=\"incomesSumDiv\">{2}</span>" +
                "<span class=\"incomesSumDiv\">{3}</span>" +
                "<span class=\"incomesSumDiv\">{4}</span>" +
                "<span class=\"incomesAmountOfDayDiv\">{5}</span>" +
                "<span class=\"incomesPercentDiv\">{6}</span>",
                expensesItemsEntity.RoomEntity.Name,
                expensesItemsEntity.NotConfirmedSum,
                expensesItemsEntity.ConfirmedSum,
                expensesItemsEntity.PrepaidSum,
                expensesItemsEntity.FullPaidSum,
                expensesItemsEntity.AmountOfDays,
                expensesItemsEntity.PercenInPeriod
                );
        }

        #endregion
    }
}