<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UtilitiesDetailsForm.aspx.cs"
    Inherits="MyHotel.Business.WebControls.Utilities.UtilitiesDetailsForm" Culture="uk-UA"
    UICulture="uk-UA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/css/utilities.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formUD" runat="server">
    <asp:ToolkitScriptManager ID="ScriptManagerUtilitiesDetails" runat="server" EnableScriptGlobalization="true" />
    <asp:UpdatePanel ID="UpdatePanelUtilitiesDetails" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:PostBackTrigger ControlID="ButtonOK" />
            <asp:PostBackTrigger ControlID="ButtonCancel" />
            <asp:PostBackTrigger ControlID="ButtonDelete" />
        </Triggers>
        <ContentTemplate>
            <div style="width:410px;"> 
                <div class="utilitiesDetailsHeaderDiv">
                    <asp:Label ID="LabelHeader" runat="server" Text="Внесення даних ком.послуг" CssClass="boldLabel" />
                    <hr />
                </div>
                <div class="utilitiesDetailsControlsDiv">
                    <asp:Table ID="TableUtilitiesDetails" runat="server">
                    </asp:Table>
                    <asp:Label ID="LabelError" runat="server" Text="..." CssClass="errorValidation" Visible="false"
                        Width="60%" />
                </div>
                <div class="utilitiesDetailsButtonDiv">
                    <asp:Button ID="ButtonOK" runat="server" Text="OK" OnClick="ButtonOK_Click" />
                    &nbsp;
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click"
                        CausesValidation="false" />
                    &nbsp;
                    <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click"
                        CausesValidation="false" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
