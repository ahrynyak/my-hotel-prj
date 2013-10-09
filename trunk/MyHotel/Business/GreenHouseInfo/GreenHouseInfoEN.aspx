<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoEN.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoEN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p class="tabHeaderTextStyle">
        About Us</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <%--Вітаємо--%>
    <div class="section">
        <div class="section_header">
            Welcome
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> invites you to relax in the guesthouse and offers accommodation
            in double, triple and four beds rooms.
            <br />
            Also, we offer our guests a fully equipped kitchen, barbecue, swing and tables in
            the courtyard. Despite the fact that the house is not far from the village center,
            vehicular traffic will not interfere with your rest.
        </div>
        <div class="section_img">
            <obout:ImageZoom ID="imageZoomAbout" runat="server" ImageUrl="../../icons/out5.jpg"
                Effect="Zooming" ThumbnailWidth="200" />
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Наше розташування--%>
    <div class="section">
        <div class="section_header">
            Our location
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> located in a picturesque corner of Skhidnytsya with beautiful
            views and close to the forest. We are also a five minute walk from the village center
            (400m) and 10 min walk from the bus station. Market, shops and food outlets are
            located in 5-10 min walk. Nearest water springs are located near the homestead:
            #15 and Glycerine water springs - 5 min walk, #2c (soda) - 15 min walk, #18 - 20
            min walk, #8,9,10 - 10 min walk.
        </div>
        <div class="section_img">
            <obout:ImageZoom ID="imageZoom" runat="server" ImageUrl="../../icons/shidnycya_karta.jpg"
                Effect="Zooming" ThumbnailFixedSize="True" ThumbnailWidth="100" />
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRoomsName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Accommodation
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <%--Номери--%>
    <div class="section">
        <div class="section_header">
            Rooms
        </div>
        <%--DBLRoom--%>
        <div class="section_content">
            <span>Standard </span><span class="GreenHouseNormalTextP1">double</span><span> (one
                room, 2 guests)</span>
            <br />
            <span class="SmalText">(*extra bed on request)</span>
            <ul>
                <li>One large<span class="GreenHouseNormalTextP1"> double</span> or two <span class="GreenHouseNormalTextP1">
                    single</span> orthopedic beds </li>
                <li>TV with satellite channels </li>
                <li>Wardrobe </li>
                <li>Coffee table, dressing table </li>
                <li>Bathroom (WC, wash basin, shower) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHDBL.jpg" alt="Схема однокімнатного номеру" />
        </div>
        <div class="section_gallery">
            <obout:ImageZoom ID="ImageZoomDBLRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/DBLRoom"
                DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                ShowHeader="False" PageSize="6" CallbackMode="False" />
        </div>
        <div class="section_footer">
        </div>
        <br />
        <%--ApartRoom--%>
        <div class="section_content">
            <span>Family </span><span class="GreenHouseNormalTextP1">suite</span> <span>(two rooms,
                4 guests)</span>
            <ul>
                <li>Large<span class="GreenHouseNormalTextP1"> double </span>orthopedic beds</li>
                <li>Sofa</li>
                <li>TV with satellite channels </li>
                <li>Wardrobe </li>
                <li>Coffee table, dressing table </li>
                <li>Bathroom (WC, wash basin, shower) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHApart.jpg" alt="Схема двокімнатного номеру" />
        </div>
        <div class="section_gallery">
            <obout:ImageZoom ID="ImageZoomApartRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/ApartRoom"
                DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                ShowHeader="False" PageSize="6" />
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Кухня--%>
    <div class="section">
        <div class="section_header">
            Kitchen
        </div>
        <div class="section_content">
            <span>We offer our guests </span><span class="GreenHouseNormalTextP1">shared kitchen</span>
            <span>You need not worry about the dishes on kitchen appliances because the kitchen
                is fully equipped:</span>
            <ul>
                <li>Two gas stoves</li>
                <li>Two kitchen sinks</li>
                <li>Microwave </li>
                <li>Two refrigerators</li>
                <li>Kettle </li>
                <li>Each room has a locker in the kitchen</li>
                <li>All necessary utensils (pans, pots, plates, cups, cutlery)</li>
                <li>Dining tables</li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/Kitchen.png" alt="Схема кухні-їдальні" />
        </div>
        <div class="section_gallery">
            <obout:ImageZoom ID="ImageZoomKitchen" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/Kitchen"
                DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                ShowHeader="False" PageSize="6" />
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--На подвір'ї--%>
    <div class="section">
        <div class="section_header">
            In the yard
        </div>
        <div class="section_content">
            <span>Our guests can spend time in </span><span class="GreenHouseNormalTextP1">cozy</span>
            <span>corners, including:</span>
            <ul>
                <li>Swing</li>
                <li>Barbecue</li>
                <li>Tables with frame</li>
            </ul>
        </div>
        <div class="section_gallery">
            <obout:ImageZoom ID="ImageZoomRelaxZones" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/RelaxZones"
                DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                ShowHeader="False" PageSize="6" />
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabServiceName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Services
    </p>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabService"
    runat="server">
    <%--Послуги включені у вартість--%>
    <div class="section">
        <div class="section_header">
            Services included in the price
        </div>
        <div class="section_content">
            <ul>
                <li>Meeting in <span class="GreenHouseNormalTextP1">Skhidnytsya</span></li>
                <li>Change of clothes (every 8 days) and towels (2 per person every 4 days)</li>
                <li><span class="GreenHouseNormalTextP1">Cleaning</span> of room every 4 days</li>
                <li>Barbecue facilities</li>
                <li>Use iron</li>
                <li>Using a hair dryer</li>
                <li>Providing information services for recreation</li>
                <li>Parking <span class="GreenHouseNormalTextP1">(on request)</span> </li>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Послуги за додаткову оплату--%>
    <div class="section">
        <div class="section_header">
            Services for extra charge
        </div>
        <div class="section_content">
            <ul>
                <li>Washing clothes</li>
                <li>Consultation <span class="GreenHouseNormalTextP1">with an doctor</span></li>
                <li>Massage</li>
                <li><span class="GreenHouseNormalTextP1">Transfer</span> from/to:</li>
                <ul>
                    <li>Lviv - 500 uah</li>
                    <li>Truskavets- 120 uah</li>
                </ul>
                <p class="SmalText">
                    (*prices should be clarified)</p>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Prices
    </p>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
    <%--Ціни на проживання--%>
    <div class="section">
        <div class="section_header">
            Accommodation prices (per room UAH/day)
        </div>
        <div class="section_content">
            <table class="price_table">
                <tr>
                    <td rowspan="4" class="price_table_colored">
                        rooms
                    </td>
                    <td colspan="6" class="price_table_colored">
                        season
                    </td>
                </tr>
                <tr>
                    <td class="price_table_colored">
                        high
                    </td>
                    <td class="price_table_colored">
                        low №1
                    </td>
                    <td class="price_table_colored">
                        low №2
                    </td>
                    <td class="price_table_colored" colspan="2">
                        holiday
                    </td>
                </tr>
                <tr>
                    <td class="price_table_colored" rowspan="2">
                        1.06 - 31.08
                    </td>
                    <td class="price_table_colored" rowspan="2">
                        16.01 - 31.01
                        <br />
                        01.05 - 31.05
                        <br />
                        01.09 - 31.10
                        <br />
                    </td>
                    <td class="price_table_colored" rowspan="2">
                        01.02 - 30.04
                        <br />
                        01.11 - 24.12
                        <br />
                    </td>
                    <td class="price_table_colored" colspan="2">
                        25.12 - 15.01
                    </td>
                </tr>
                <tr class="price_table_colored">
                    <td>
                        5 - 7 days
                    </td>
                    <td>
                        from 7 days
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        standard double
                    </td>
                    <td>
                        180
                    </td>
                    <td>
                        140
                    </td>
                    <td>
                        100/120
                    </td>
                    <td>
                        200
                    </td>
                    <td>
                        180
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        family suite:
                    </td>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        for 3 guests
                    </td>
                    <td>
                        240
                    </td>
                    <td>
                        210
                    </td>
                    <td>
                        150/180
                    </td>
                    <td>
                        300
                    </td>
                    <td>
                        270
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        for 4 guests
                    </td>
                    <td>
                        280
                    </td>
                    <td>
                        240
                    </td>
                    <td>
                        200/240
                    </td>
                    <td>
                        400
                    </td>
                    <td>
                        360
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Знижки--%>
    <div class="section">
        <div class="section_header">
            Discounts
        </div>
        <div class="section_content">
            <ul>
                <li>for stays longer than 15 days discount - 10 UAH per room</li>
                <li>prices can be lower, contact us </li>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotosName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Gallery
    </p>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
    runat="server">
    <%--Галерея--%>
    <div class="section">
        <obout:ImageZoom ID="ImageZoomGallery" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/Gallery"
            ShowFooter="false" PageSize="50" AllowPaging="False" AllowPageSizeSelection="False"
            ShowHeader="False" />
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="ContentPlaceHolderContactsName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Contacts
    </p>
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
    <%--Поштова адреса--%>
    <div class="section">
        <div class="section_header">
            Address
        </div>
        <div class="section_content">
            Skhidnytsia
            <br />
            str. Promyslova 58
            <br />
            Drogobytsky district
            <br />
            Lviv region.
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Телефон--%>
    <div class="section">
        <div class="section_header">
            Phone
        </div>
        <div class="section_content">
            +38 (096) 812-20-98,
            <br />
            +38 (093) 873-83-94,
            <br />
            +38 (093) 566-66-89
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--E-mail--%>
    <div class="section">
        <div class="section_header">
            E-mail
        </div>
        <div class="section_content">
            <a href="mailto:ukr_root@ukr.net">ukr_root@ukr.net</a>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--GPS координати--%>
    <div class="section">
        <div class="section_header">
            GPS coordinates
        </div>
        <div class="section_content">
            <strong>N</strong>: 49.227798
            <br />
            <strong>E</strong>: 23.343444
            <br />
            <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">
                Show on map</a>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Як доїхати--%>
    <div class="section">
        <div class="section_header">
            How to get there
        </div>
        <div class="section_content">
            <strong>Public transport </strong>From Lviv by bus which is departing from the main
            train station (every hour).
            <br />
            <br />
            <strong>By car </strong>direction is through Truskavec. In Skhidnytsya go to the
            bus station, then in the direction of the pointer on the pansion "Gutsulka". Homestead
            is on the right of the road (100 m from the pansion).
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
