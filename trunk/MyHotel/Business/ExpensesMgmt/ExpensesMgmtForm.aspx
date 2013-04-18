<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm"  Culture="uk-UA" UICulture="uk-UA"%>

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
        modal.height = 200;
        modal.border = "1px solid black";
        modal.closed = function () {
            if (this.result == "OK") {
                window.location.reload();
            }
        };

        function addNewExpenses(expensID) {
            modal.showUrl("ExpensesDetailsMgmtForm.aspx?expensID=" + expensID);
        }
        function editExpenses(subGrID) {
            modal.showUrl("ExpensesDetailsMgmtForm.aspx?subGrID=" + subGrID);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <strong>Видимий період</strong>
        <asp:TextBox runat="server" ID="datePickeStart" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeStart_TextChanged" />
        <asp:CalendarExtender ID="calendarExtenderStart" runat="server" TargetControlID="datePickeStart" />
        <strong>:</strong>
        <asp:TextBox runat="server" ID="datePickeEnd" autocomplete="off" AutoPostBack="True"
            OnTextChanged="datePickeEnd_TextChanged" />
        <asp:CalendarExtender ID="calendarExtenderEnd" runat="server" TargetControlID="datePickeEnd"
            Format="" />
            <hr />
    </div>
    <div style="width: 100%;">
        <obout:Tree ID="TreeExpenses" runat="server" EnableViewState="False" ClientIDMode="AutoID"
            CssClass="vista">
        </obout:Tree>
    </div>
</asp:Content>
