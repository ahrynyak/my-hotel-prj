<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBookingDetailsForm.aspx.cs"
    Inherits="MyHotel.Business.RoomBookingMgmt.RoomBookingDetailsForm" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" TagPrefix="bdp" Namespace="BasicFrame.WebControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManagerBookingDetails" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelBookingDetails" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonOK"/>
            <asp:PostBackTrigger ControlID="ButtonCancel"/>
        </Triggers>
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="LabelRoomName" runat="server" Text="Номер:" CssClass="labelBookingDetailsSpecial" />
                    </td>
                    <td>
                        <asp:Label ID="LabelRoomNameValue" runat="server" Text="..." CssClass="labelBookingDetailsSpecial" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails">
                        Імя гостя
                    </td>
                    <td class="labelBookingDetails">
                        Телефон
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxGuestName" runat="server" Width="90%" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxGuestPhone" runat="server" Width="90%" />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails">
                        К-ть дорослих
                    </td>
                    <td class="labelBookingDetails">
                        К-ть дітей
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxAdultNumber" runat="server" Width="90%" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxChildrenNumber" runat="server" Width="90%" />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails">
                        Ціна номера
                    </td>
                    <td class="labelBookingDetails">
                        Ціна дод. місця
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBoxPricePerRoom" runat="server" Width="90%" OnTextChanged="TextBoxPricePerRoom_TextChanged" AutoPostBack="True" />
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPriceForExtraBed" runat="server" Width="90%" AutoPostBack="True"
                            OnTextChanged="TextBoxPriceForExtraBed_TextChanged" />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails">
                        Дата заїзду
                    </td>
                    <td class="labelBookingDetails">
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
                    <td class="labelBookingDetails">
                        Статус броні
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownListBookingStatus" runat="server" Width="90%" />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails" colspan="2">
                        Додаткова інформація
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails" colspan="2">
                        <asp:TextBox ID="TextBoxAdditionalInfo" runat="server" Width="95%" Height="50px"
                            TextMode="MultiLine" />
                    </td>
                </tr>
                <tr>
                    <td class="labelBookingDetails">
                        Оплачено
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPaid" runat="server" Width="90%" AutoPostBack="True" OnTextChanged="TextBoxPaid_TextChanged"
                            Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelAmountToBePaid" runat="server" Text="Заг.сума:" CssClass="labelBookingDetailsSpecial" />
                        &nbsp;
                        <asp:Label ID="LabelAmountToBePaidValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                    </td>
                    <td>
                        <asp:Label ID="LabelAmountOfDays" runat="server" Text="К-ть днів:" CssClass="labelBookingDetailsSpecial" />
                        &nbsp;
                        <asp:Label ID="LabelAmountOfDaysValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelAmountRemainderToBePaid" runat="server" Text="Залишок:" CssClass="labelBookingDetailsSpecial" />
                        &nbsp;
                        <asp:Label ID="LabelAmountRemainderToBePaidValue" runat="server" Text="0" CssClass="labelBookingDetailsSpecial" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButtonDeleteBooking" runat="server" OnClick="LinkButtonDeleteBooking_Click"
                            CausesValidation="False" Font-Bold="True">Delete</asp:LinkButton>
                    </td>
                    <td align="right">
                        <asp:Button ID="ButtonOK" runat="server" Text="OK" Width="60px" OnClick="ButtonOK_Click" />
                        &nbsp;
                        <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" Width="60px" OnClick="ButtonCancel_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
