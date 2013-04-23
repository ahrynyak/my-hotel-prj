using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity;
using Obout.Ajax.UI.TreeView;
using MyHotel.Business.Entity.Expenses;

namespace MyHotel.Business.WebControls.Expenses
{
    public partial class ExpensesWebControl : System.Web.UI.UserControl, IViewData
    {
        DateTime storedStartDate { get; set; }
        DateTime storedEndDate { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public void Refresh(DateTime startDate, DateTime endDate)
        {
            this.storedStartDate = startDate;
            this.storedEndDate = endDate;
            Refresh();
        }

        [System.Web.Services.WebMethod]
        public void Refresh()
        {
            TreeExpenses.Nodes.Clear();
            TreeExpenses.Nodes.Add(new Node(getHeaderText()));
            var allExpensesItems = ExpensesController.GetExpensesItems();
            var allExpensesDetails = ExpensesController.GetExpensesDetails(this.storedStartDate, this.storedEndDate);
            foreach (var group in allExpensesItems.Where(e => e.ParentExpensesItemID == 0))
            {
                double groupSum = 0;
                Node groupTreeNode = new Node();
                groupTreeNode.Value = group.ExpensesItemID.ToString();
                foreach (var subGroup in allExpensesItems.Where(e => e.ParentExpensesItemID == group.ExpensesItemID))
                {
                    double subGroupSum = 0;
                    Node subGroupTreeNode = new Node();
                    subGroupTreeNode.Value = subGroup.ExpensesItemID.ToString();
                    foreach (var expensesDetails in allExpensesDetails.Where(e => e.ExpensesItemID == subGroup.ExpensesItemID))
                    {
                        subGroupSum += expensesDetails.Cost;
                        Node expensesDetailsTreeNode = new Node(getExpensesDetailsText(expensesDetails));
                        expensesDetailsTreeNode.Value = expensesDetails.ExpensesDetailsID.ToString();
                        subGroupTreeNode.ChildNodes.Add(expensesDetailsTreeNode);
                    }
                    subGroupTreeNode.Text = getExpensesItemsSubGroupText(subGroup, subGroupSum);
                    groupTreeNode.ChildNodes.Add(subGroupTreeNode);
                    groupSum += subGroupSum;
                }
                groupTreeNode.Text = getExpensesItemsGroupText(group, groupSum);
                TreeExpenses.Nodes.Add(groupTreeNode);
            }
            TreeExpenses.ExpandAll();
            TreeExpenses.DataBind();
        }

        #region css format for tree nodes
        private string getHeaderText()
        {
            return String.Format("<strong><span class=\"expensesItemGroupName\">{0}</span><span class=\"expensesDetailsCost\">{1}</span><span class=\"expensesDetailsDescription\">{2}</span></strong>", "Назва/Дата", "Cума", "Інфо");
        }

        private string getExpensesItemsGroupText(ExpensesItemsEntity expensesItemsEntity, double sum)
        {
            return String.Format(
                "<span class=\"expensesItemGroupName\">{0}</span>" +
                "<span class=\"expensesItemGroupSum\">{1}</span>",
                expensesItemsEntity.Name, sum);
        }

        private string getExpensesItemsSubGroupText(ExpensesItemsEntity expensesItemsEntity, double sum)
        {
            return String.Format(
                "<span onclick=\"addNewExpenses(\'{2}\')\">" +
                    "<img src=\"../../icons/add1.ico\" class=\"expensesDetailsAdd\"/>" +
                    "<span class=\"expensesItemSubGroupName\">{0}</span>" +
                    "<span class=\"expensesItemSubGroupSum\">{1}</span>" +
                "</span>",
                expensesItemsEntity.Name, sum, expensesItemsEntity.ExpensesItemID);
        }

        private string getExpensesDetailsText(ExpensesDetailsEntity expensesDetailsEntity)
        {
            return String.Format(
                "<span onclick=\"editExpenses(\'{3}\')\" >" +
                    "<img src=\"../../icons/edit.ico\" class=\"expensesDetailsEdit\"/>" +
                    "<span class=\"expensesDetailsDate\">{0}</span>" +
                    "<span class=\"expensesDetailsCost\">{1}</span>" +
                    "<span class=\"expensesDetailsDescription\">{2}</span>" +
                "</span>",
                expensesDetailsEntity.Date.ToShortDateString(), expensesDetailsEntity.Cost, expensesDetailsEntity.Description, expensesDetailsEntity.ExpensesDetailsID);
        }

        #endregion
    }
}