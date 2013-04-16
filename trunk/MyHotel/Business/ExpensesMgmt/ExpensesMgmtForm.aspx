<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../css/expenses.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        here time range
    </div>
    <div style="width:100%;">
        <cc1:Grid ID="GridExpenses" runat="server" 
            DataSourceID="ObjectDataSourceExpensesGridView" Width="100%" 
            AllowGrouping="True">
        </cc1:Grid>
        <asp:ObjectDataSource ID="ObjectDataSourceExpensesGridView" runat="server" 
            DataObjectTypeName="MyHotel.Business.Entity.Expenses.ExpensesGridView" 
            DeleteMethod="DeleteExpensesDetails" InsertMethod="SaveExpensesDetails" 
            SelectMethod="GetExpensesGridView" 
            TypeName="MyHotel.Business.ExpensesMgmt.ExpensesMgmtController" 
            UpdateMethod="SaveExpensesDetails"></asp:ObjectDataSource>
    </div>
</asp:Content>
