<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Про нас</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <%--Вітаємо--%>
    <div class="section">
        <div class="section_header">
            Вітаємо
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> запрошує Вас відпочити в гостьовому будинку та пропонує проживання
            в дво-, три- та чотиримісних номерах. Садиба призначена для затишного і комфортного
            відпочинку.
            <br />
            Також до послуг наших гостей повністю обладнана кухня-їдальня, мангал для приготуання
            смачного шашлику, гойдалка та столики на подвір'ї. Незважаючи на те що садиба знаходиться
            неподалік від центру селища, рух автотранспорту не буде перешкоджати Вашому відпочинку.
            <br />
            Опалення в будинку: автономне водяне.
            <br />
            Цілодобове холодне та гаряче водопостачання.
            <br />
            Під’їзд до садиби: асфальтована дорога.
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
            Наше розташування
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                САДИБА"</span> розташована в мальовничому куточку Східниці з прекрасними краєвидами
            та неподалік від лісу. Ми знаходимося також в п’яти хвилинах пішого ходу від центру
            селища (400м) та 10хв ходьби від автостанції. До ринку, магазинів і закладів харчування
            – 5-10хв пішого ходу. Найближчі джерела, які знаходяться поруч із садибою: 15 джерело
            та гліцеринове – 5хв, 2с (содова) – 15хв, 18 джерело – 20хв, 8,9,10 джерела – 10хв.
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
            Про Cхідницю
        </div>
        <div class="section_content">
            <span class="GreenHouseNormalTextP1">Східниця</span> - це бальнеологічний курорт,
            лікувальні води якого не мають аналогів у Європі. Унікальний склад мікроелементів
            цих вод ефективно лікує хвороби серцево-судинної системи, шлунково-кишкового тракту
            і нирок. Східниця - розташована в живописній долині, оточеній гірськими вершинами
            Карпат на висоті 600 метрів над рівнем моря.
            <br />
            <span class="GreenHouseNormalTextP1">Унікальність курорту Східниця </span>у тому,
            що на одній, порівняно невеликій території, зосереджені різні типи лікувальних вод:
            слабо-мінералізовані - типу «Нафтуся», з розчинними органічними речовинами в кількості
            10-30 мг/л, залізисті мінеральні води з вмістом заліза від 20 до 70 мг/л, унікальні
            лужні (Східницька содова) мінеральні води типу «Боржомі». Окрім них, родовище володіє
            мінеральними природно-столовими водами.
            <br />
            <span class="GreenHouseNormalTextP1">Відпочинок в Східниці </span>- це чистісіньке
            карпатське повітря, тиша гірського поселення і якнайкращі цілющі джерела Європи.
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
        Проживання
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <%--Номери--%>
    <div class="section">
        <div class="section_header">
            Номери
        </div>
        <%--DBLRoom--%>
        <div class="section_content">
            <span>Стандартний </span><span class="GreenHouseNormalTextP1">однокімнатний</span>
            <span>номер - </span><span class="GreenHouseNormalTextP1">2</span> спальних місця
            <br />
            <span class="SmalText">(*додаткове ліжко за домовленістю)</span>
            <ul>
                <li>Одне <span class="GreenHouseNormalTextP1">двоспальне</span> або два <span class="GreenHouseNormalTextP1">
                    односпальні</span> ортопедичні ліжка </li>
                <li>Телевізор із супутниковим телебаченням </li>
                <li>Шафа для одягу </li>
                <li>Журнальний столик, трюмо </li>
                <li>Санвузол (туалет, умивальник, душ) </li>
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
            <span>Сімейний </span><span class="GreenHouseNormalTextP1">двокімнатний</span> <span>
                номер - </span><span class="GreenHouseNormalTextP1">4</span> спальних місця
            <ul>
                <li><span class="GreenHouseNormalTextP1">Двоспальне</span> ортопедичне ліжко </li>
                <li>Розкладний диван</li>
                <li>Телевізор із супутниковим телебаченням </li>
                <li>Шафа для одягу </li>
                <li>Журнальний столик, трюмо </li>
                <li>Санвузол (туалет, умивальник, душ) </li>
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
            <span>До послуг наших гостей </span><span class="GreenHouseNormalTextP1">кухня-їдальня</span>
            <span>спільного користування. Вам не потрібно турбуватися про посуд та кухонну техніку,
                оскільки кухня є повністю укомплектована, а саме:</span>
            <ul>
                <li>Дві газові плити</li>
                <li>Дві кухонні мийки</li>
                <li>Мікрохвильова піч </li>
                <li>Два холодильники</li>
                <li>Електрочайник </li>
                <li>Кожен номер має окрему тумбочку на кухні</li>
                <li>Весь необхідний посуд (сковорідки, каструлі, тарілки, чашки, столові прибори)</li>
                <li>Обідні столи</li>
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
            На подвір'ї
        </div>
        <div class="section_content">
            <span>Наші гості можуть провести час в </span><span class="GreenHouseNormalTextP1">затишних</span>
            <span>куточках, які включають:</span>
            <ul>
                <li>Гойдалку</li>
                <li>Мангал</li>
                <li>Столи зі зрубу</li>
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
        Послуги
    </p>
</asp:Content>
<asp:Content ID="Content13" runat="server" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabService">
    <%--Послуги включені у вартість--%>
    <div class="section">
        <div class="section_header">
            Послуги включені у вартість
        </div>
        <div class="section_content">
            <ul>
                <li>Зустріч у <span class="GreenHouseNormalTextP1">Східниці</span></li>
                <li>Зміна постелі (1 раз на 8 днів) та рушників (2 на особу 1 раз на 4 днів)</li>
                <li><span class="GreenHouseNormalTextP1">Прибирання</span> номерів 1 раз на 4 дні</li>
                <li>Користування мангалом</li>
                <li>Користування праскою</li>
                <li>Користування феном</li>
                <li>Виклик <span class="GreenHouseNormalTextP1">таксі</span></li>
                <li>Надання інформаційних послуг щодо відпочинку</li>
                <li>Місце для авто <span class="GreenHouseNormalTextP1">(за домовленістю)</span>
                </li>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Послуги за додаткову оплату--%>
    <div class="section">
        <div class="section_header">
            Послуги за додаткову оплату
        </div>
        <div class="section_content">
            <ul>
                <li>Прання одягу</li>
                <li>Консультація <span class="GreenHouseNormalTextP1">лікаря</span></li>
                <li>Масаж</li>
                <li><span class="GreenHouseNormalTextP1">Трансфер</span> з/до:</li>
                <ul>
                    <li>Львова - 500 грн</li>
                    <li>Трускавця - 150 грн</li>
                </ul>
                <p class="SmalText">
                    (*ціни потрібно уточняти)</p>
            </ul>
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    <p class="tabHeaderTextStyle">
        Ціни
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
    <%--Ціни на проживання--%>
    <div class="section">
        <div class="section_header">
            Ціни на проживання (за номер грн/доба)
        </div>
        <div class="section_content">
            <table class="price_table">
                <tr>
                    <td rowspan="4" class="price_table_colored">
                        номери
                    </td>
                    <td colspan="6" class="price_table_colored">
                        сезон
                    </td>
                </tr>
                <tr>
                    <td class="price_table_colored">
                        високий
                    </td>
                    <td class="price_table_colored">
                        низький №1
                    </td>
                    <td class="price_table_colored">
                        низький №2
                    </td>
                    <td class="price_table_colored" colspan="2">
                        святковий
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
                        5 - 7 днів
                    </td>
                    <td>
                        від 7 днів
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        двомісний однокімнатний
                    </td>
                    <td>
                        200
                    </td>
                    <td>
                        160
                    </td>
                    <td>
                        120/140
                    </td>
                    <td>
                        220
                    </td>
                    <td>
                        200
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        сімейний двокімнатний:
                    </td>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        для 3-ох осіб
                    </td>
                    <td>
                        270
                    </td>
                    <td>
                        240
                    </td>
                    <td>
                        180/210
                    </td>
                    <td>
                        330
                    </td>
                    <td>
                        300
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;" class="price_table_colored">
                        для 4-ох осіб
                    </td>
                    <td>
                        320
                    </td>
                    <td>
                        280
                    </td>
                    <td>
                        240/280
                    </td>
                    <td>
                        440
                    </td>
                    <td>
                        400
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
            Знижки
        </div>
        <div class="section_content">
            <ul>
                <li>при проживанні більше 15 днів діє знижка - 10 грн від вартості номера</li>
                <li>ціни можуть змінюватися в меншу сторону, деталі можна дізнатися по телефону</li>
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
        Контакти
    </p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
    <%--Поштова адреса--%>
    <div class="section">
        <div class="section_header">
            Поштова адреса
        </div>
        <div class="section_content">
            смт. Східниця
            <br />
            вул. Промислова 58
            <br />
            Дрогобицький р-н
            <br />
            Львівська обл.
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
            GPS координати
        </div>
        <div class="section_content">
            <strong>N</strong>: 49.227798
            <br />
            <strong>E</strong>: 23.343444
            <br />
            <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">
                Показати на карті</a>
        </div>
        <div class="section_footer">
        </div>
    </div>
    <%--Як доїхати--%>
    <div class="section">
        <div class="section_header">
            Як доїхати
        </div>
        <div class="section_content">
            <strong>Громадським транспортом </strong>Зі Львова автобусом від головного залізничного
            вокзалу (відправляється щогодини).
            <br />
            Інший варіант доїзду — електропоїздом Львів—Трускавець від приміського вокзалу,
            з Трускавця — автобусом від залізничного або автовокзалу (відправляється щогодини).
            <br />
            <br />
            <strong>Автомобілем</strong> До Східниці через Дрогобич, Трускавець. У Східниці
            їхати до автовокзалу, далі в напрямку вказівника на пансіонат "Гуцулка" (дорогою
            вгору). Садиба буде праворуч від дороги (100 м від пансіонату).
        </div>
        <div class="section_footer">
        </div>
    </div>
</asp:Content>
