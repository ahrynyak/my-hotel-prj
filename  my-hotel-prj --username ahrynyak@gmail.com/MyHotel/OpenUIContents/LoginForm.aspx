<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="MyHotel.OpenUIContents.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="MyHotelMgmtContentPlaceHolder">
    <asp:Login ID="LoginData" runat="server" 
    onauthenticate="LoginData_Authenticate">
    </asp:Login>
</asp:Content>

