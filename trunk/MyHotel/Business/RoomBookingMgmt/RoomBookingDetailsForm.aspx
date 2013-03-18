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
                Імя Гостя
            </td>
            <td>
                Телефон
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxGuestName" runat="server" Width="90%" AutoPostBack="True" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxGuestPhone" runat="server" Width="90%" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                К-ть дорослих
            </td>
            <td>
                К-ть дітей
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxAdultNumber" runat="server" Width="90%" AutoPostBack="True" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxChildrenNumber" runat="server" Width="90%" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td>
                Ціна номера
            </td>
            <td>
                Ціна дод. місця
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxPricePerRoom" runat="server" Width="90%" AutoPostBack="True"
                    OnTextChanged="TextBoxPricePerRoom_TextChanged" />
            </td>
            <td>
                <asp:TextBox ID="TextBoxPriceForExtraBed" runat="server" Width="90%" AutoPostBack="True"
                    OnTextChanged="TextBoxPriceForExtraBed_TextChanged" />
            </td>
        </tr>
        <tr>
            <td>
                Дата заїзду
            </td>
            <td>
                Дата виїзду
            </td>
        </tr>
        <tr>
            <td>
                <bdp:BasicDatePicker ID="datePickeStartDate" runat="server" DisplayType="TextBox"
                    Width="90%" AutoPostBack="True" OnSelectionChanged="datePickeStartDate_SelectionChanged" />
            </td>
            <td>
                <bdp:BasicDatePicker ID="datePickeEndDate" runat="server" DisplayType="TextBox" Width="90%"
                    AutoPostBack="True" OnSelectionChanged="datePickeEndDate_SelectionChanged" />
            </td>
        </tr>
        <tr>
            <td>
                Статус броні
            </td>
            <td>
                <asp:DropDownList ID="DropDownListBookingStatus" runat="server" Width="90%" AutoPostBack="True" />
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
                <strong>Оплачено </strong>
            </td>
            <td>
                <asp:TextBox ID="TextBoxPaid" runat="server" Width="90%" AutoPostBack="True" OnTextChanged="TextBoxPaid_TextChanged"
                    Font-Bold="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelAmountToBePaid" runat="server" Text="Заг.Сума:" Font-Bold="True"
                    ForeColor="#009933" />
                &nbsp;
                <asp:Label ID="LabelAmountToBePaidValue" runat="server" Text="0" Font-Bold="True"
                    ForeColor="#009933" />
            </td>
            <td>
                <asp:Label ID="LabelAmountOfDays" runat="server" Text="К-ть днів:" Font-Bold="True"
                    ForeColor="#009933" />
                &nbsp;
                <asp:Label ID="LabelAmountOfDaysValue" runat="server" Text="0" Font-Bold="True" ForeColor="#009933" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LabelAmountRemainderToBePaid" runat="server" Text="Залишок:" Font-Bold="True"
                    ForeColor="Red" />
                &nbsp;
                <asp:Label ID="LabelAmountRemainderToBePaidValue" runat="server" Text="0" Font-Bold="True"
                    ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButtonDeleteBooking" runat="server" OnClick="LinkButtonDeleteBooking_Click"
                    CausesValidation="False">Delete</asp:LinkButton>
            </td>
            <td colspan="2" align="right">
                <asp:Button ID="ButtonOK" runat="server" Text="OK" Width="60px" OnClick="ButtonOK_Click"
                    CausesValidation="False" />
                &nbsp;
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="60px" OnClick="ButtonCancel_Click"
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
