<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="MyHotel.OpenUIContents.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../css/main.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder">
    <asp:Login ID="LoginData" runat="server" OnAuthenticate="LoginData_Authenticate">
        <CheckBoxStyle CssClass="labelVisiblePeriod" />
        <LabelStyle CssClass="labelVisiblePeriod" />
        <TitleTextStyle CssClass="labelVisiblePeriod" />
    </asp:Login>
</asp:Content>
