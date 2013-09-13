<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoRU.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoRU" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p class="tabHeaderTextStyle">
        О Нас</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <%--Вітаємо--%>
    <div class="section">
        <div class="section_header">
            Приветствуем
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> приглашает Вас отдохнуть в гостевом доме и предлагает проживаня
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
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> расположена в живописном уголке Сходницы с прекрасными видами
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
                <li>Одна <span class="GreenHouseNormalTextP1">двуспальная</span> или две <span class="GreenHouseNormalTextP1">
                    односпальные</span> ортопедические кровати </li>
                <li>Телевизор со спутниковым телевидением </li>
                <li>Шкаф для одежды </li>
                <li>Журнальный столик, трюмо </li>
                <li>Санузел (туалет, умывальник, душ) </li>
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
            Во дворе
        </div>
        <div class="section_content">
            <span>Наши гости могут провести время в </span><span class="GreenHouseNormalTextP1">
                уютных </span><span>уголках, которые включают:</span>
            <ul>
                <li>Качелю</li>
                <li>Мангал</li>
                <li>Столы со сруба</li>
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
                    <li>Львова - 500 грн</li>
                    <li>Трускавца - 120 грн</li>
                </ul>
                <p class="SmalText">
                    (*цены нужно уточнять)</p>
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
            Цены на проживание (за номер грн/сутки)
        </div>
        <div class="section_content">
            <table class="price_table">
                <tr>
                    <td rowspan="4" class="price_table_colored">
                        номера
                    </td>
                    <td colspan="6" class="price_table_colored">
                        сезон
                    </td>
                </tr>
                <tr>
                    <td class="price_table_colored">
                        высокий
                    </td>
                    <td class="price_table_colored">
                        низкий №1
                    </td>
                    <td class="price_table_colored">
                        низкий №2
                    </td>
                    <td class="price_table_colored" colspan="2">
                        праздничный
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
                        5-7 дней
                    </td>
                    <td>
                        від 7 дней
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        двухместный однокомнатный
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
                        семейный двухкомнатный:
                    </td>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        для 3-х человек
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
                        для 4-х человек
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
            Скидки
        </div>
        <div class="section_content">
            <ul>
                <li>при проживании более 15 дней скидка 10 грн от стоимости номера</li>
                <li>цены могут меняться в меньшую сторону, детали можно узнать по телефону</li>
            </ul>
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
        <obout:ImageZoom ID="ImageZoomGallery" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/Gallery"
            ShowFooter="false" PageSize="50" AllowPaging="False" AllowPageSizeSelection="False"
            ShowHeader="False" />
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
            ул. Промышленная 58
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
            GPS координаты
        </div>
        <div class="section_content">
            <strong>N</strong>: 49.227798
            <br />
            <strong>E</strong>: 23.343444
            <br />
            <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">
                Показать на карте</a>
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
