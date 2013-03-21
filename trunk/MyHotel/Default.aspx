<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyHotel.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolderRightLeftCornerMaster">
    <asp:LinkButton ID="linkButtonSignIn" runat="server" CssClass="loginoutbutton" Text="Sign in"
        OnClick="linkButtonSignIn_Click" />
</asp:Content>
