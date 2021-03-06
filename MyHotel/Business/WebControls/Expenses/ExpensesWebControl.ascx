﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpensesWebControl.ascx.cs"
    Inherits="MyHotel.Business.WebControls.Expenses.ExpensesWebControl" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<link href="/css/expenses.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/modal.js"></script>
<script type="text/javascript">
    var modal = new DayPilot.Modal();
    modal.top = 0;
    modal.width = 250;
    modal.opacity = 60;
    modal.height = 250;
    modal.closed = function () {
        if (this.result == "OK") {
            document.getElementById("ButtonrRefresh").click();
        }
    };

    function addNewExpenses(expensID, startDate) {
        modal.showUrl("/Business/WebControls/Expenses/ExpensesDetailsForm.aspx?expensID=" + expensID + "&startDate=" + startDate);
    }
    function editExpenses(subGrID, startDate) {
        modal.showUrl("/Business/WebControls/Expenses/ExpensesDetailsForm.aspx?subGrID=" + subGrID + "&startDate=" + startDate);
    }
</script>
<div style="width: 100%;">
    <asp:Button ID="ButtonrRefresh" runat="server" Text="Button" ClientIDMode="Static"
        Height="1" Width="1" />
    <obout:Tree ID="TreeExpenses" runat="server" CssClass="vista">
    </obout:Tree>
</div>
