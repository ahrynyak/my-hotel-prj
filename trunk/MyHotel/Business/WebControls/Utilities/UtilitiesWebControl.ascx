﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UtilitiesWebControl.ascx.cs" Inherits="MyHotel.Business.WebControls.Utilities.UtilitiesWebControl" %>
<link href="/css/utilities.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/modal.js"></script>
<script type="text/javascript">
    var modal = new DayPilot.Modal();
    modal.top = 0;
    modal.width = 420;
    modal.opacity = 60;
    modal.height = 270;
    modal.closed = function () {
        if (this.result == "OK") {
            location.reload();
        }
    };

    function addNewUtilities(startDate) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?startDate=" + startDate);
    }

    function editUtilities(utilitiesItemsDetailsIDs) {
        modal.showUrl("/Business/WebControls/Utilities/UtilitiesDetailsForm.aspx?utilitiesItemsDetailsIDs=" + utilitiesItemsDetailsIDs);
    }
</script>
<div>
    <asp:Table ID="TableUtilities" runat="server" GridLines="Both">
    </asp:Table>
</div>
