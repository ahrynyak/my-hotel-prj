<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBookingDetailsForm.aspx.cs"
    Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingDetailsForm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" TagPrefix="bdp" Namespace="BasicFrame.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                Guest Name
            </td>
            <td>
                #Phone
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxGuestName" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxGuestPhone" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                Adults
            </td>
            <td>
                Children
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxAdultNumber" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxChildrenNumber" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                Room Price
            </td>
            <td>
                Extra Bed Price
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxPricePerRoom" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxPriceForExtraBed" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                Check-in Date
            </td>
            <td>
                Check-out Date
            </td>
        </tr>
        <tr>
            <td>
                <bdp:BasicDatePicker ID="datePickeStartDate" runat="server" 
                    DisplayType="TextBox" Width="90%" AutoPostBack="True" />
            </td>
            <td>
                <bdp:BasicDatePicker ID="datePickeEndDate" runat="server" DisplayType="TextBox" 
                    Width="90%" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                Status
            </td>
            <td>
                <asp:DropDownList ID="DropDownListBookingStatus" runat="server" Width="90%" 
                    AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                Aditional Info
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="TextBoxAdditionalInfo" runat="server" Width="90%" Height="50px"
                    TextMode="MultiLine" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
        <td>
            <asp:LinkButton ID="LinkButtonDeleteBooking" runat="server" 
                onclick="LinkButtonDeleteBooking_Click">Delete</asp:LinkButton>
        </td>
            <td colspan="2" align="right">
                <asp:Button ID="ButtonOK" runat="server" Text="OK" Width="60px" OnClick="ButtonOK_Click" />
                &nbsp;
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="60px" 
                    onclick="ButtonCancel_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
