<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IncomesWebControl.ascx.cs" Inherits="MyHotel.Business.WebControls.Incomes.IncomesControl" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<link href="/css/incomes.css" rel="stylesheet" type="text/css" />
<div style="width: 100%;">
        <obout:Tree ID="TreeIncomes" runat="server" EnableViewState="False" ClientIDMode="AutoID"
            CssClass="vista">
        </obout:Tree>
</div>