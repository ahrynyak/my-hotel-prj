<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpensesWebControl.ascx.cs"
    Inherits="MyHotel.Business.WebControls.Expenses.ExpensesWebControl" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<script type="text/javascript" src="/js/modal.js"></script>
<script type="text/javascript">
    var modal = new DayPilot.Modal();
    modal.top = 200;
    modal.width = 250;
    modal.opacity = 60;
    modal.height = 250;
    modal.border = "1px solid black";
    modal.closed = function () {
        if (this.result == "OK") {
            window.location.reload();
        }
    };

    function addNewExpenses(expensID) {
        modal.showUrl("/Business/WebControls/Expenses/ExpensesDetailsForm.aspx?expensID=" + expensID);
    }
    function editExpenses(subGrID) {
        modal.showUrl("/Business/WebControls/Expenses/ExpensesDetailsForm.aspx?subGrID=" + subGrID);
    }
</script>
<div style="width: 100%;">
    <obout:Tree ID="TreeExpenses" runat="server" EnableViewState="False" ClientIDMode="AutoID"
        CssClass="vista">
    </obout:Tree>
</div>
