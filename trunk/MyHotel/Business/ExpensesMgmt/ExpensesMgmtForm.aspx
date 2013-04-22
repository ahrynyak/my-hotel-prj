<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="ExpensesView" TagName="ExpensesWebControl" Src="~/Business/WebControls/Expenses/ExpensesWebControl.ascx" %>
<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <hr />
    </div>
    <div>
        <ExpensesView:ExpensesWebControl runat="server" ID="ExpensesViewCtrl" />
    </div>
</asp:Content>
