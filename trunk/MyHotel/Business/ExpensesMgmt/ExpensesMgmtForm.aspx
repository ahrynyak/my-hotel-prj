<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="ExpensesMgmtForm.aspx.cs" Inherits="MyHotel.Business.ExpensesMgmt.ExpensesMgmtForm" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="/css/expenses.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">

<div>
here time range
</div>
<div>
    <obout:Tree ID="TreeExpenses" runat="server" EnableViewState="false">
    </obout:Tree>
</div>
</asp:Content>
