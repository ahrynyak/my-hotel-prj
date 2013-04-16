using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyHotel.Business.Entity.Expenses;
using Obout.Ajax.UI.TreeView;

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
                }
                updateVisiblePeriod();
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

        }

        private void updateVisiblePeriod()
        {
            TreeExpenses.Nodes.Add(new Node(getHeaderText()));
            foreach (var group in ExpensesMgmtController.GetExpensesItems(0))
            {
                double groupSum = 0;
                Node groupTreeNode = new Node();
                groupTreeNode.Value = group.ExpensesItemID.ToString();
                foreach (var subGroup in ExpensesMgmtController.GetExpensesItems(group.ExpensesItemID))
                {
                    double subGroupSum = 0;
                    Node subGroupTreeNode = new Node();
                    subGroupTreeNode.Value = subGroup.ExpensesItemID.ToString();
                    foreach (var expensesDetails in ExpensesMgmtController.GetExpensesDetails(subGroup.ExpensesItemID))
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
        }
        #region css format for tree nodes
        private string getHeaderText()
        {
            return String.Format("<strong><span class=\"expensesItemGroupName\">{0}</span><span class=\"expensesDetailsCost\">{1}</span><span class=\"expensesDetailsDescription\">{2}</span></strong>", "Назва/Дата", "Cума", "Інфо");
        }

        private string getExpensesItemsGroupText(ExpensesItemsEntity expensesItemsEntity, double sum)
        {
            return String.Format("<span class=\"expensesItemGroupName\">{0}</span><span class=\"expensesItemGroupSum\">{1}</span>", expensesItemsEntity.Name, sum);
        }

        private string getExpensesItemsSubGroupText(ExpensesItemsEntity expensesItemsEntity, double sum)
        {
            
            return String.Format("<span class=\"expensesItemSubGroupName\">{0}</span><span class=\"expensesItemSubGroupSum\">{1}</span> <asp:ImageButton ID=\"ImageButton1\" runat=\"server\" onclick=\"ImageButton1_Click\" ImageUrl=\"~/icons/refresh_green.ico\" />", expensesItemsEntity.Name, sum);
        }

        private string getExpensesDetailsText(ExpensesDetailsEntity expensesDetailsEntity)
        {
            return String.Format("<span class=\"expensesDetailsDate\">{0}</span><span class=\"expensesDetailsCost\">{1}</span><span class=\"expensesDetailsDescription\">{2}</span>", expensesDetailsEntity.Date.ToShortDateString(), expensesDetailsEntity.Cost, expensesDetailsEntity.Description);
        }

        #endregion
    }
}