﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpensesDetailsForm.aspx.cs"
    Inherits="MyHotel.Business.WebControls.Expenses.ExpensesDetailsForm" Culture="uk-UA"
    UICulture="uk-UA" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/css/expenses.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formED" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManagerExpensesDetails" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelExpensesDetails" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonOK" />
            <asp:PostBackTrigger ControlID="ButtonCancel" />
            <asp:PostBackTrigger ControlID="ButtonDelete" />
        </Triggers>
        <ContentTemplate>
            <div class="expensesDetailsHeaderDiv">
                <asp:Label ID="LabelHeader" runat="server" Text="..." class="labelBookingDetails" />
                <hr />
            </div>
            <div class="expensesDetailsControlsDiv">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LabelDate" runat="server" Text="Дата" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxDate" runat="server" Width="90%" />
                            <asp:CalendarExtender ID="CalendarExtenderDate" runat="server" TargetControlID="TextBoxDate">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelCost" runat="server" Text="Сума" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCost" runat="server" Width="90%" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCost" runat="server" ErrorMessage="*"
                                CssClass="errorValidation" ControlToValidate="TextBoxCost" ToolTip="Обов'язкове поле" />
                            <asp:FilteredTextBoxExtender ID="FilteredtextboxextenderCost" runat="server" TargetControlID="TextBoxCost"
                                FilterType="Custom" ValidChars="01234567890.," />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelInfo" runat="server" Text="Інфо" class="labelBookingDetails" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxInfo" runat="server" TextMode="MultiLine" Width="90%" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="LabelError" runat="server" Text="..." CssClass="errorValidation" Visible="false"
                                Width="90%" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="expensesDetailsButtonDiv">
                <asp:Button ID="ButtonOK" runat="server" Text="OK" OnClick="ButtonOK_Click" />
                &nbsp;
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                &nbsp;
                <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
