<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="ExpensesView" TagName="ExpensesWebControl" Src="~/Business/WebControls/Expenses/ExpensesWebControl.ascx" %>
<%@ Register TagPrefix="IncomesView" TagName="IncomesWebControl" Src="~/Business/WebControls/Incomes/IncomesWebControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/expenses.css" rel="stylesheet" type="text/css" />
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
    <div>
        <ExpensesView:ExpensesWebControl runat="server" ID="ExpensesViewCtrl" />
    </div>
    <%--<div>
        <IncomesView:IncomesWebControl runat="server" ID="IncomesViewCtrl" />
    </div>--%>
</asp:Content>
