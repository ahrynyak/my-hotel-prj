<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="ExpensesView" TagName="ExpensesWebControl" Src="~/Business/WebControls/Expenses/ExpensesWebControl.ascx" %>
<%@ Register TagPrefix="IncomesView" TagName="IncomesWebControl" Src="~/Business/WebControls/Incomes/IncomesWebControl.ascx" %>
<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <hr />
    </div>
    <div style="float:left;">
        <ExpensesView:ExpensesWebControl runat="server" ID="ExpensesViewCtrl" />
    </div>
    <div style="float:left;">
        <IncomesView:IncomesWebControl runat="server" ID="IncomesViewCtrl" />
    </div>
</asp:Content>
