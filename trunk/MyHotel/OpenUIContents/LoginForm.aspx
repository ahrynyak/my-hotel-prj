<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master"
    AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="MyHotel.OpenUIContents.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder">
    <div>
        <div class="defaultPageInfoDiv">
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Login ID="LoginData" runat="server" OnAuthenticate="LoginData_Authenticate"
                            CssClass="loginForm" DisplayRememberMe="False">
                            <CheckBoxStyle CssClass="labelVisiblePeriod" />
                            <LabelStyle CssClass="labelVisiblePeriod" />
                            <TitleTextStyle CssClass="labelVisiblePeriod" />
                        </asp:Login>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
