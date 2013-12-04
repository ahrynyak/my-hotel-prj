<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm"
    Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register TagPrefix="ExpensesView" TagName="ExpensesWebControl" Src="~/Business/WebControls/Expenses/ExpensesWebControl.ascx" %>
<%@ Register TagPrefix="DateRanger" TagName="DateRangerControl" Src="~/Business/WebControls/DateRange/DateRangerControl.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <DateRanger:DateRangerControl runat="server" ID="DateRangerPeriod" />
        <asp:CheckBox ID="CheckBoxShowAllLevel" runat="server" Text="Показувати всі рівні"
            AutoPostBack="True" OnCheckedChanged="CheckBoxShowAllLevel_CheckedChanged" ToolTip="Показувати всі рівні" />
    </div>
    <div>
        <ExpensesView:ExpensesWebControl runat="server" ID="ExpensesViewCtrl" />
    </div>
</asp:Content>
