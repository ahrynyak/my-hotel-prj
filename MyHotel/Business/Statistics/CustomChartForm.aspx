<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MyHotelMgmt.Master" AutoEventWireup="true" CodeBehind="CustomChartForm.aspx.cs" Inherits="MyHotel.Business.Statistics.CustomChartForm" Culture="uk-UA" UICulture="uk-UA" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyHotelMgmtContentPlaceHolder" runat="server">
    <div>
        <table width="90%">
            <tr>
                <td>
                    <asp:ListBox ID="ListBoxScriptSelection" runat="server" Width="100%" Height="100%"  ></asp:ListBox>
                </td>
                <td>
                    <asp:ListBox ID="ListBoxLegends" runat="server" Width="100%" Height="100%" ></asp:ListBox>
                </td>
                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ImageButton ID="ImageButtonRun" runat="server" ImageUrl="~/icons/Play.png" Height="16px" Width="16px" />
                    <asp:ImageButton ID="ImageButtonSave" runat="server" ImageUrl="~/icons/save-as-xxl.png" Height="16px" Width="16px" />
                    <asp:TextBox ID="TextBoxScriptName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxScript" runat="server" TextMode="MultiLine" Width="100%" Height="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="100%" Height="150px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Chart ID="ChartCustom" runat="server">
        </asp:Chart>
    </div>
</asp:Content>
