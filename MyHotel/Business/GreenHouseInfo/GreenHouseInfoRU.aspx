﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoRU.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoRU" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p class="tabHeaderTextStyle">
        О Нас
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <%--Вітаємо--%>
    <div class="section">
        <div class="section_header">
            Приветствуем
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">САДИБА"</span> приглашает Вас отдохнуть в гостевом доме и предлагает проживаня
            в двух-, трех-и четырехместных номерах. Усадьба предназначена для уютного и комфортного
            отдыха.
            <br />
            Также к услугам наших гостей полностью оборудованная кухня-столовая, мангал для
            приготовления вкусного шашлыка, качеля и столики во дворе. Несмотря на то что дом
            находится недалеко от центра поселка, движение автотранспорта не препятствовать
            Вашему отдыху.
            <br />
            Отопление в доме: автономное водяное.
            <br />
            Круглосуточное холодное и горячее водоснабжение.
            <br />
            Подъезд к дому: асфальтированная дорога.
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
            Наше местоположение
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">САДИБА"</span> расположена в живописном уголке Сходницы с прекрасными видами
            и недалеко от леса. Мы находимся также в пяти минутах ходьбы от центра поселка (400м)
            и 10 мин ходьбы от автостанции. К рынку, магазинам и кафе - 5-10мин ходьбы. Ближайшие
            источники, которые находятся рядом с усадьбой: 15 источник и глицериновый - 5мин,
            2с (содовая) - 15мин, 18 источник - 20мин, 8,9,10 источники - 10мин.
        </div>
        <div class="section_img">
            <obout:ImageZoom ID="imageZoom" runat="server" ImageUrl="../../icons/shidnycya_karta.jpg"
                Effect="Zooming" ThumbnailFixedSize="True" ThumbnailWidth="100" />
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Про Cхідницю--%>
    <div class="section">
        <div class="section_header">
            О Cходнице
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">Сходница</span> - это бальнеологический курорт,
            лечебные воды которого не имеют аналогов в Европе. Уникальный состав микроэлементов
            этих вод эффективно лечит болезни сердечно-сосудистой системы, желудочно-кишечного
            тракта и почек. Сходница - расположена в живописной долине, окруженной горными вершинами
            Карпат на высоте 600 метров над уровнем моря.
            <br />
            <span class="GreenHouseNormalTextP1">Уникальность курорта Сходница </span>в том,
            что на одной, сравнительно небольшой территории, сосредоточенные разные типы лечебных
            вод: слабо-минерализованные - типа «Нафтуся», с растворимыми органическими веществами
            в количестве 10-30 мг / л, железистые минеральные воды с содержанием железа от 20
            до 70 мг / л, уникальные щелочные (Сходницкая содовая) минеральные воды типа «Боржоми».
            Кроме них, курорт обладает минеральными природно-столовыми водами.
            <br />
            <span class="GreenHouseNormalTextP1">Отдых в Cходнице </span>- это чистейший карпатский
            воздух, тишина горного поселения и наилучшие целебные источники Европы.
        </div>
        <div class="section_img">
            <obout:ImageZoom ID="imageZoomShidn" runat="server" ImageUrl="../../icons/1248809363_shidnicha.gif"
                Effect="Zooming" ThumbnailFixedSize="False" ThumbnailWidth="200" />
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRoomsName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Проживание
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <%--Номери--%>
    <div class="section">
        <div class="section_header">
            Номера
        </div>
        <%--DBLRoom--%>
        <div class="section_content">
            <span>Стандартный </span><span class="GreenHouseNormalTextP1">однокомнатный</span>
            <span>номер - </span><span class="GreenHouseNormalTextP1">2</span> спальных места
            <br />
            <span class="SmalText">(*дополнительная кровать по договоренности)</span>
            <ul>
                <li>Одна <span class="GreenHouseNormalTextP1">двуспальная</span> или две <span class="GreenHouseNormalTextP1">односпальные</span> ортопедические кровати </li>
                <li>Телевизор со спутниковым телевидением </li>
                <li>Шкаф для одежды </li>
                <li>Журнальный столик, трюмо </li>
                <li>Санузел (туалет, умывальник, душ) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHDBL.jpg" alt="Схема однокомнатного номера" />
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
            <span>Семейный </span><span class="GreenHouseNormalTextP1">двухкомнатный</span>
            <span>номер - </span><span class="GreenHouseNormalTextP1">4</span> спальных места
            <ul>
                <li><span class="GreenHouseNormalTextP1">Двуспальная</span> ортопедическая кровать
                </li>
                <li>Раскладной диван</li>
                <li>Телевизор со спутниковым телевидением </li>
                <li>Шкаф для одежды </li>
                <li>Журнальный столик, трюмо </li>
                <li>Санузел (туалет, умывальник, душ) </li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/GHApart.jpg" alt="Схема двухкомнатного номера" />
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
            Кухня
        </div>
        <div class="section_content">
            <span>К услугам наших гостей </span><span class="GreenHouseNormalTextP1">кухня-столовая</span>
            <span>общего пользования. Вам не нужно беспокоиться о посуде и кухонной технике, поскольку
                кухня полностью укомплектована, а именно:</span>
            <ul>
                <li>Две газовые плиты</li>
                <li>Две кухонные мойки</li>
                <li>Микроволновая печь</li>
                <li>Два холодильника</li>
                <li>Электрочайник</li>
                <li>Каждый номер имеет отдельную тумбочку на кухне</li>
                <li>Вся необходимая посуда (сковородки, кастрюли, тарелки, чашки, столовые приборы)</li>
                <li>Обеденные столы</li>
            </ul>
        </div>
        <div class="section_img">
            <img src="../../icons/Kitchen.png" alt="Схема кухни-столовой" />
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
            Во дворе
        </div>
        <div class="section_content">
            <span>Наши гости могут провести время в </span><span class="GreenHouseNormalTextP1">уютных </span><span>уголках, которые включают:</span>
            <ul>
                <li>Качелю</li>
                <li>Мангал</li>
                <li>Столы со сруба</li>
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
<asp:Content ID="Content12" runat="server" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabServiceName">
    <p class="tabHeaderTextStyle">
        Услуги
    </p>
</asp:Content>
<asp:Content ID="Content13" runat="server" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabService">
    <%--Послуги включені у вартість--%>
    <div class="section">
        <div class="section_header">
            Услуги включены в стоимость
        </div>
        <div class="section_content">
            <ul>
                <li>Встреча в <span class="GreenHouseNormalTextP1">Сходнице</span></li>
                <li>Смена постельного белья (1 раз в 8 дней) и полотенец (2 на человека 1 раз в 4 дня)</li>
                <li><span class="GreenHouseNormalTextP1">Уборка</span> номеров 1 раз в 4 дня</li>
                <li>Пользование мангалом</li>
                <li>Пользование утюгом</li>
                <li>Пользование феном</li>
                <li>Вызов <span class="GreenHouseNormalTextP1">такси</span></li>
                <li>Предоставление информационных услуг по отдыху</li>
                <li>Место для авто <span class="GreenHouseNormalTextP1">(по договоренности)</span>
                </li>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Послуги за додаткову оплату--%>
    <div class="section">
        <div class="section_header">
            Услуги за дополнительную плату
        </div>
        <div class="section_content">
            <ul>
                <li>Стирка одежды</li>
                <li>Консультация <span class="GreenHouseNormalTextP1">врача</span></li>
                <li>Массаж</li>
                <li><span class="GreenHouseNormalTextP1">Трансфер</span> от/до:</li>
                <ul>
                    <li>Львова - 800 грн</li>
                    <li>Трускавца - 250 грн</li>
                </ul>
                <p class="SmalText">
                    (*цены нужно уточнять)
                </p>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Цены
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
    <%--Ціни на проживання--%>
    <div class="section">
        <div class="section_header">
            Цены на проживание
        </div>
        <div class="section_content">
            <div class="price_shortver">
                175-250 грн/сутки за человека
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
        Галерея
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
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
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolderContactsName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Контакты
    </p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
    <%--Поштова адреса--%>
    <div class="section">
        <div class="section_header">
            Почтовый адрес
        </div>
        <div class="section_content">
            пгт. Сходница
            <br />
            ул. Промышленная
            <br />
            Дрогобычский р-н
            <br />
            Львовская обл.
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Телефон--%>
    <div class="section">
        <div class="section_header">
            Телефон
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
            GPS координаты
        </div>
        <div class="section_content">
            <strong>N</strong>: 49.227798
            <br />
            <strong>E</strong>: 23.343444
            <br />
            <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">Показать на карте</a>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Як доїхати--%>
    <div class="section">
        <div class="section_header">
            Как доехать
        </div>
        <div class="section_content">
            <strong>Общественным транспортом </strong>Со Львова автобусом от главного железнодорожного
            вокзала (отправляется каждый час).
            <br />
            Другой вариант доезда - электропоездом Львов-Трускавец от пригородного вокзала,
            с Трускавца - автобусом от железнодорожного или автовокзала (отправляется каждый
            час).
            <br />
            <br />
            <strong>Автомобилем</strong> До Сходницы через Дрогобыч, Трускавец. В Сходнице ехать
            до автовокзала, далее в направлении указателя на пансионат "Гуцулка" (дорогой вверх).
            Усадьба будет справа от дороги (100 м от пансионата).
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
