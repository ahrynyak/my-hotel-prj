using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity.Expenses;
using Obout.Ajax.UI.TreeView;
using MyHotel.Utils;
using System.Globalization;

namespace MyHotel.Business.ExpensesMgmt
{
    public partial class ExpensesMgmtForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User != null && this.Page.User.Identity.IsAuthenticated)
            {
                if (ScriptManager.GetCurrent(Page) == null)
                {
                    Page.Form.Controls.AddAt(0, new ScriptManager());
                }
                if (!Page.IsPostBack)
                {
                    initData();
                    updateVisiblePeriod();
                }
            }
            else
            {
                Response.Redirect("/LoginForm.aspx");
            }
        }

        private void initData()
        {
            initCalendar();

        }

        private void initCalendar()
        {
            if (string.IsNullOrEmpty(datePickeStart.Text))
            {
                datePickeStart.Text = ExpensesMgmtController.GetDefaultStartDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderStart.Format = HelperCommon.DateFormat;
            }
            if (string.IsNullOrEmpty(datePickeEnd.Text))
            {
                datePickeEnd.Text = ExpensesMgmtController.GetDefaultEndDate().ToString(HelperCommon.DateFormat).ToLower();
                calendarExtenderEnd.Format = HelperCommon.DateFormat;
            }
        }

        private void updateVisiblePeriod()
        {
            if (!string.IsNullOrEmpty(datePickeStart.Text) && !string.IsNullOrEmpty(datePickeEnd.Text))
            {
                TreeExpenses.Nodes.Clear();
                TreeExpenses.Nodes.Add(new Node(getHeaderText()));
                var allExpensesItems = ExpensesMgmtController.GetExpensesItems();
                var allExpensesDetails = ExpensesMgmtController.GetExpensesDetails(DateTime.ParseExact(datePickeStart.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture), DateTime.ParseExact(datePickeEnd.Text, HelperCommon.DateFormat, CultureInfo.CurrentCulture));
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
            }
            else
            {
                initCalendar();
            }
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

        protected void datePickeStart_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

        protected void datePickeEnd_TextChanged(object sender, EventArgs e)
        {
            updateVisiblePeriod();
        }

    }
}