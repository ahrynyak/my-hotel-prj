<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoEN.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoEN" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p class="tabHeaderTextStyle">
        About Us
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <%--Вітаємо--%>
    <div class="section">
        <div class="section_header">
            Welcome
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"Zelena </span><span class="GreenHouseNormalTextP2">Sadyba"</span> invites you to relax in the guesthouse and offers accommodation
            in double, triple and four beds rooms.
            <br />
            Also, we offer to our guests a fully equipped kitchen, barbecue, swing and tables
            in the courtyard. Despite of the fact that the house is not far from the village
            center, the vehicular traffic will not interfere with your rest.
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
            <span class="GreenHouseNormalTextP1">"Zelena </span><span class="GreenHouseNormalTextP2">Sadyba"</span> is located in a picturesque corner of Skhidnytsya with beautiful
            views and it is close to the forest. We are also located a five minute walk from
            the village center (400m) and 10 minute walk from the bus station. Market, shops
            and food outlets are 5-10 minute walk. The nearest water springs which are located
            near the homestead are: №15 and Glycerin water springs - 5 min walk, №2c (soda)
            - 15 min walk, №18 - 20 min walk, №8,9,10 - 10 min walk.
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
                <li>One large<span class="GreenHouseNormalTextP1"> double</span> or two <span class="GreenHouseNormalTextP1">single</span> beds </li>
                <li>Satellite TV </li>
                <li>Wardrobe </li>
                <li>Coffee table, dressing table </li>
                <li>Bathroom (WC, wash basin, shower) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHDBL.jpg" alt="Схема однокімнатного номеру" />
        </div>
        <div class="section_gallery">
            <%--Image zoom effect--%>
            <a href="#DBLRoom_img1">
                <img src="img/DBLRoom/DSC_0219.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#DBLRoom_img2">
                <img src="img/DBLRoom/DSC_0232.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#DBLRoom_img3">
                <img src="img/DBLRoom/DSC_0437.jpg" width="130" height="80" alt=""/>
            </a>
            <div class="overlay" id="DBLRoom_img1">
                <a href="#close">
                    <img src="img/DBLRoom/DSC_0219.jpg" />
                </a>
            </div>
            <div class="overlay" id="DBLRoom_img2">
                <a href="#close">
                    <img src="img/DBLRoom/DSC_0232.jpg" />
                </a>
            </div>
             <div class="overlay" id="DBLRoom_img3">
                <a href="#close">
                    <img src="img/DBLRoom/DSC_0437.jpg" />
                </a>
            </div>
            <%--Image zoom effect end--%>
        </div>
        <div class="section_footer">
        </div>
        <br />
        <%--ApartRoom--%>
        <div class="section_content">
            <span>Family </span><span class="GreenHouseNormalTextP1">suite</span> <span>(two rooms,
                4 guests)</span>
            <ul>
                <li>One large<span class="GreenHouseNormalTextP1"> double </span>or two single beds</li>
                <li>Sofa</li>
                <li>Satellite TV </li>
                <li>Wardrobe </li>
                <li>Coffee table, dressing table </li>
                <li>Bathroom (WC, wash basin, shower) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHApart.jpg" alt="Схема двокімнатного номеру" />
        </div>
        <div class="section_gallery">
        <%--Image zoom effect--%>
            <a href="#ApartRoom_img1">
                <img src="img/ApartRoom/DSC_0420.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#ApartRoom_img2">
                <img src="img/ApartRoom/DSC_0421.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#ApartRoom_img3">
                <img src="img/ApartRoom/DSC_0422.jpg" width="130" height="80" alt=""/>
            </a>
             <a href="#ApartRoom_img4">
                <img src="img/ApartRoom/DSC_0434.jpg" width="130" height="80" alt=""/>
            </a>
            <div class="overlay" id="ApartRoom_img1">
                <a href="#close">
                    <img src="img/ApartRoom/DSC_0420.jpg" />
                </a>
            </div>
            <div class="overlay" id="ApartRoom_img2">
                <a href="#close">
                    <img src="img/ApartRoom/DSC_0421.jpg" />
                </a>
            </div>
             <div class="overlay" id="ApartRoom_img3">
                <a href="#close">
                    <img src="img/ApartRoom/DSC_0422.jpg" />
                </a>
            </div>
             <div class="overlay" id="ApartRoom_img4">
                <a href="#close">
                    <img src="img/ApartRoom/DSC_0434.jpg" />
                </a>
            </div>
            <%--Image zoom effect end--%>
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
            <span>We offer to our guests  </span><span class="GreenHouseNormalTextP1">shared kitchen</span>
            <span>You do not need to worry about utensils and appliances on the kitchen because the kitchen is fully equipped:</span>
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
            <%--Image zoom effect--%>
            <a href="#Kitchen_img1">
                <img src="img/Kitchen/DSC_0072.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Kitchen_img2">
                <img src="img/Kitchen/DSC_0212.jpg" width="130" height="80" alt=""/>
            </a>
            <div class="overlay" id="Kitchen_img1">
                <a href="#close">
                    <img src="img/Kitchen/DSC_0072.jpg" />
                </a>
            </div>
            <div class="overlay" id="Kitchen_img2">
                <a href="#close">
                    <img src="img/Kitchen/DSC_0212.jpg" />
                </a>
            </div>
            <%--Image zoom effect end--%>
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
            <span>Our guests can relax in </span><span class="GreenHouseNormalTextP1">cozy</span>
            <span>corners which include:</span>
            <ul>
                <li>Swing</li>
                <li>Barbecue</li>
                <li>Wooden tables</li>
            </ul>
        </div>
        <div class="section_gallery">
            <%--Image zoom effect--%>
            <a href="#RelaxZones_img1">
                <img src="img/RelaxZones/IMG_7549.JPG" width="130" height="80" alt=""/>
            </a>
            <a href="#RelaxZones_img2">
                <img src="img/RelaxZones/IMG_7554.JPG" width="130" height="80" alt=""/>
            </a>
            <div class="overlay" id="RelaxZones_img1">
                <a href="#close">
                    <img src="img/RelaxZones/IMG_7549.JPG" />
                </a>
            </div>
            <div class="overlay" id="RelaxZones_img2">
                <a href="#close">
                    <img src="img/RelaxZones/IMG_7554.JPG" />
                </a>
            </div>
            <%--Image zoom effect end--%>
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
                <li>Changing of the bedclothes (every 8 days) and towels (2 per person every 4 days)</li>
                <li>Rooms <span class="GreenHouseNormalTextP1">cleaning</span> every 4 days</li>
                <li>Barbecue facilities</li>
                <li>Iron</li>
                <li>Hair dryer</li>
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
                <li>Laundry</li>
                <li>Doctor's <span class="GreenHouseNormalTextP1">consultation</span></li>
                <li>Massage</li>
                <li><span class="GreenHouseNormalTextP1">Shuttle </span>service (from/to):</li>
                <ul>
                    <li>Lviv - 800 uah</li>
                    <li>Truskavets- 250 uah</li>
                </ul>
                <p class="SmalText">
                    (*prices can vary)
                </p>
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
            Accommodation prices
        </div>
        <div class="section_content">
            <div class="price_shortver">
                175-250 UAH/day per person
            </div>
            <br />
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
        <div class="section_gallery">
            <%--Image zoom effect--%>
            <a href="#Gallery_img1">
                <img src="img/Gallery/_MG_7507.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img2">
                <img src="img/Gallery/1259728.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img3">
                <img src="img/Gallery/4131.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img4">
                <img src="img/Gallery/666609899.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img5">
                <img src="img/Gallery/DSC_0271.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img6">
                <img src="img/Gallery/DSC_0277.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img7">
                <img src="img/Gallery/DSC_0294.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img8">
                <img src="img/Gallery/DSC_0303.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img9">
                <img src="img/Gallery/DSC_0307.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img10">
                <img src="img/Gallery/DSC_0330.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img11">
                <img src="img/Gallery/DSC_0334.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img12">
                <img src="img/Gallery/DSC_0478.jpg" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img13">
                <img src="img/Gallery/IMG_5834.JPG" width="130" height="80" alt=""/>
            </a>
            <a href="#Gallery_img14">
                <img src="img/Gallery/SNC00031.jpg" width="130" height="80" alt=""/>
            </a>
            <div class="overlay" id="Gallery_img1">
                <a href="#close">
                    <img src="img/Gallery/_MG_7507.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img2">
                <a href="#close">
                    <img src="img/Gallery/1259728.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img3">
                <a href="#close">
                    <img src="img/Gallery/4131.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img4">
                <a href="#close">
                    <img src="img/Gallery/666609899.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img5">
                <a href="#close">
                    <img src="img/Gallery/DSC_0271.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img6">
                <a href="#close">
                    <img src="img/Gallery/DSC_0277.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img7">
                <a href="#close">
                    <img src="img/Gallery/DSC_0294.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img8">
                <a href="#close">
                    <img src="img/Gallery/DSC_0303.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img9">
                <a href="#close">
                    <img src="img/Gallery/DSC_0307.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img10">
                <a href="#close">
                    <img src="img/Gallery/DSC_0330.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img11">
                <a href="#close">
                    <img src="img/Gallery/DSC_0334.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img12">
                <a href="#close">
                    <img src="img/Gallery/DSC_0478.jpg" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img13">
                <a href="#close">
                    <img src="img/Gallery/IMG_5834.JPG" />
                </a>
            </div>
            <div class="overlay" id="Gallery_img14">
                <a href="#close">
                    <img src="img/Gallery/SNC00031.jpg" />
                </a>
            </div>
            <%--Image zoom effect end--%>
        </div>
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
            str. Promyslova
            <br />
            Drogobytsky district
            <br />
            Lviv region.
            <br />
            Ukraine 
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
            <a href="mailto:zelenasadybainfo@gmail.com">zelenasadybainfo@gmail.com</a>
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
            <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">Show on map</a>
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
