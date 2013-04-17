<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/expenses.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/modal.js"></script>
    <script type="text/javascript">
        var modal = new DayPilot.Modal();
        modal.top = 200;
        modal.width = 230;
        modal.opacity = 60;
        modal.height = 155;
        modal.border = "1px solid black";
        modal.closed = function () {
            if (this.result == "OK") {
                dps.commandCallBack('refresh');
            }
        };

        function addNewExpenses(subGrID) {
            modal.showUrl("ExpensesDetailsMgmtForm.aspx?subGrID=" + subGrID);
        }
        function editExpenses(expensID) {
            modal.showUrl("ExpensesDetailsMgmtForm.aspx?expensID=" + expensID);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        here time range
    </div>
    <div style="width: 100%;">
        <obout:Tree ID="TreeExpenses" runat="server" EnableViewState="False" ClientIDMode="AutoID"
            CssClass="vista">
        </obout:Tree>
    </div>
</asp:Content>
