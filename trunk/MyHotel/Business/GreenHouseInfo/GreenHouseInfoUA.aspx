<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/GreenHouseInfo.Master"
    AutoEventWireup="true" CodeBehind="GreenHouseInfoUA.aspx.cs" Inherits="MyHotel.Business.GreenHouseInfo.GreenHouseInfoUA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHomeName"
    runat="server">
    <p>
        Про нас</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabHome"
    runat="server">
    <table>
        <tr>
            <td class="content_box">
                <p class="H1Text">
                    Вітаємо
                </p>
                <div id="aboutDiv" class="topicImageDiv">
                    <obout:ImageZoom ID="imageZoomAbout" runat="server" ImageUrl="../../icons/out5.jpg"
                        Effect="Zooming" ThumbnailWidth="200" />
                </div>
                <p>
                    <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                        САДИБА"</span> запрошує Вас відпочити в гостьовому будинку та пропонує проживаня
                    в дво-, три- та чотиримісних номерах. Садиба призначена для затишного і комфортного
                    відпочинку. Також до послуг наших гостей повністю обладнана кухня-їдальня, мангал
                    для приготуання смачного шашлику, гойдалка та столики на подвір'ї. Незважаючи на
                    те що садиба знаходиться неподалік від центру селища, рух автотранспорту не буде
                    перешкоджати Вашому відпочинку. Опалення в будинку: автономне водяне. Цілодобове
                    холодне та гаряче водопостачання. Під’їзд до садиби: асфальтована дорога.
                </p>
            </td>
        </tr>
        <tr>
            <td class="content_box">
                <p class="H1Text">
                    Наше розташування
                </p>
                <div id="mapDiv" class="topicImageDiv">
                    <obout:ImageZoom ID="imageZoom" runat="server" ImageUrl="../../icons/shidnycya_karta.jpg"
                        Effect="Zooming" ThumbnailFixedSize="True" ImageSizeOptions="200X100" ThumbnailWidth="200"
                        ThumbnailHeight="100" />
                </div>
                <p>
                    <span class="GreenHouseNormalTextP1">"ЗЕЛЕНА </span><span class="GreenHouseNormalTextP2">
                        САДИБА"</span> розташована в мальовничому куточку Східниці з прекрасними краєвидами
                    та неподалік від лісу. Ми знаходимося також в п’яти хвилинах пішого ходу від центру
                    селища (400м) та 10хв ходьби від автостанції. До ринку, магазинів і закладів харчування
                    – 5-10хв пішого ходу. Найближчі джерела, які знаходяться поруч із садибою: 15 джерело
                    та гліцеринове – 5хв, 2с (содова) – 15хв, 18 джерело – 20хв, 8,9,10 джерела – 10хв.
                </p>
            </td>
        </tr>
        <tr>
            <td class="content_box">
                <p class="H1Text">
                    Про Cхідницю
                </p>
                <div id="shidInfo" class="topicImageDiv">
                    <obout:ImageZoom ID="imageZoom1" runat="server" ImageUrl="../../icons/1248809363_shidnicha.gif"
                        Effect="Zooming" ThumbnailFixedSize="False" ThumbnailWidth="200" />
                </div>
                <p>
                    <span class="GreenHouseNormalTextP1">Східниця</span> - це бальнеологічний курорт,
                    лікувальні води якого не мають аналогів у Європі. Унікальний склад мікроелементів
                    цих вод ефективно лікує хвороби серцево-судинної системи, шлунково-кишкового тракту
                    і нирок. Східниця - розташована в живописній долині, оточеній гірськими вершинами
                    Карпат на висоті 600 метрів над рівнем моря.
                </p>
                <p>
                    <span class="GreenHouseNormalTextP1">Унікальність курорту Східниця </span>у тому,
                    що на одній, порівняно невеликій території, зосереджені різні типи лікувальних вод:
                    слабо-мінералізовані - типу «Нафтуся», з розчинними органічними речовинами в кількості
                    10-30 мг/л, залізисті мінеральні води з вмістом заліза від 20 до 70 мг/л, унікальні
                    лужні (Східницька содова) мінеральні води типу «Боржомі». Окрім них, родовище володіє
                    мінеральними природно-столовими водами.
                </p>
                <p>
                    <span class="GreenHouseNormalTextP1">Відпочинок в Східниці </span>- це чистісіньке
                    карпатське повітря, тиша гірського поселення і якнайкращі цілющі джерела Європи
                </p>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRoomsName"
    runat="server">
    <p>
        Проживання
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabRooms"
    runat="server">
    <p class="H1Text">
        Номери
    </p>
    <table width="100%">
        <tr>
            <td colspan="2">
                <br />
                <span>Стандартний </span><span class="GreenHouseNormalTextP1">однокімнатний</span>
                <span>номер - </span><span class="GreenHouseNormalTextP1">2</span> спальних місця
                <br />
                <span class="SmalText">(*додаткове ліжко за домовленістю)</span>
            </td>
            <td rowspan="2">
                <div id="dblImgDiv">
                    <img src="../../icons/GHDBL.jpg" alt="Схема однокімнатного номеру" />
                    <p class="SmalText">
                        Схема однокімнатного номеру</p>
                </div>
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <ul>
                    <li>Одне <span class="GreenHouseNormalTextP1">двоспальне</span> або два <span class="GreenHouseNormalTextP1">
                        односпальні</span> ортопедичні ліжка </li>
                    <li>Телевізор з супутниковим телебаченням </li>
                    <li>Шафа для одягу </li>
                    <li>Журнальний столик, трюмо </li>
                    <li>Санвузол (туалет, умивальник, душ) </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="roomGalery">
                <center>
                    <obout:ImageZoom ID="ImageZoomDBLRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/DBLRoom"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" CallbackMode="False" />
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <span>Cімейний </span><span class="GreenHouseNormalTextP1">двокімнатний</span> <span>
                    номер - </span><span class="GreenHouseNormalTextP1">4</span> спальних місця
            </td>
            <td rowspan="2">
                <div id="apartImgDiv">
                    <img src="../../icons/GHApart.jpg" alt="Схема двокімнатного номеру" />
                    <p class="SmalText">
                        Схема двокімнатного номеру</p>
                </div>
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <ul>
                    <li><span class="GreenHouseNormalTextP1">Двоспальне</span> ортопедичне ліжко </li>
                    <li>Розкладний диван</li>
                    <li>Телевізор з супутниковим телебаченням </li>
                    <li>Шафа для одягу </li>
                    <li>Журнальний столик, трюмо </li>
                    <li>Санвузол (туалет, умивальник, душ) </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="roomGalery">
                <center>
                    <obout:ImageZoom ID="ImageZoomApartRoom" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/ApartRoom"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
            </td>
        </tr>
    </table>
    <hr />
    <p class="H1Text">
        Кухня
    </p>
    <table width="100%">
        <tr>
            <td colspan="2">
                <p>
                    <span>До послуг наших гостей </span><span class="GreenHouseNormalTextP1">кухня-їдальня</span>
                    <span>спільного користування. Вам не потрібно турбуватися про посуд та кухонну техніку,
                        оскільки кухня є повністюукомплектован, а саме:</span></p>
            </td>
            <td rowspan="2">
                <div id="kitchenDiv">
                    <img src="../../icons/Kitchen.png" alt="Схема кухні-їдальні" />
                    <p class="SmalText">
                        Схема кухні-їдальні</p>
                </div>
            </td>
        </tr>
        <tr>
            <td class="subPartBody">
                <ul>
                    <li>Дві газові плити</li>
                    <li>Дві кухонні мийки</li>
                    <li>Мікрохвильова піч </li>
                    <li>Два холодильники</li>
                    <li>Електрочайник </li>
                    <li>Окремі шафки для зберігання</li>
                    <li>Весь необхідний посуд (сковорідки, каструлі, тарілки, чашки, столові прибори)</li>
                    <li>Обідні столи</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="roomGalery">
                <center>
                    <obout:ImageZoom ID="ImageZoomKitchen" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/Kitchen"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
            </td>
        </tr>
    </table>
    <hr />
    <p class="H1Text">
        На подвір'ї
    </p>
    <p>
        <span>До послуг наших гостей <span class="GreenHouseNormalTextP1">затишні</span> куточки
            на подвір'ї, а саме:</span></p>
    <table width="100%">
        <tr>
            <td class="subPartBody">
                <ul>
                    <li>Гойдалка</li>
                    <li>Мангал</li>
                    <li>Столи зі зрубу в різних куточках</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <center>
                    <obout:ImageZoom ID="ImageZoomRelaxZones" runat="server" ImageUrl="~/Business/GreenHouseInfo/img/RelaxZones"
                        DisplayStyle="ListView" Thumnailwidth="50" ThumnailHeight="50" ShowFooter="False"
                        ShowHeader="False" PageSize="6" />
                </center>
            </td>
        </tr>
    </table>
    <hr />
</asp:Content>
<asp:Content ID="Content12" runat="server" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabServiceName">
    <p>
        Послуги
    </p>
</asp:Content>
<asp:Content ID="Content13" runat="server" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabService">
    <p class="H1Text">
        Послуги включені у вартість
    </p>
    <ul>
        <li>Зустріч у <span class="GreenHouseNormalTextP1">Східниці</span></li>
        <li>Зміна постелі (1 раз на 8 днів) та рушників (2 на особу 1 раз на 4 днів)</li>
        <li><span class="GreenHouseNormalTextP1">Прибирання</span> номерів 1 раз на 4 дні</li>
        <li>Користування мангалом</li>
        <li>Користування праскою</li>
        <li>Виклик <span class="GreenHouseNormalTextP1">таксі</span></li>
        <li>Надання інформаційних послуг щодо відпочинку</li>
        <li>Місце для авто <span class="GreenHouseNormalTextP1">(за домовленістю)</span>
        </li>
    </ul>
    <hr />
    <p class="H1Text">
        Послуги за додаткову оплату
    </p>
    <ul>
        <li>Прання одягу</li>
        <li>Консультація <span class="GreenHouseNormalTextP1">лікаря</span></li>
        <li>Масаж</li>
        <li><span class="GreenHouseNormalTextP1">Трансфер</span> з/до:</li>
        <ul>
            <li>Львова - 500 грн</li>
            <li>Трускавця - 120 грн</li>
        </ul>
        <p class="SmalText">
            (*ціни потрібно уточняти)</p>
    </ul>
    <hr />
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPricesName"
    runat="server">
    <p>
        Ціни
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPrices"
    runat="server">
    <p class="H1Text">
        Ціни на проживання
    </p>
    <p>
        період 15.01.2013 - 20.04.2013 <span class="GreenHouseNormalTextP1">(низький сезон)</span>
    </p>
    <ul>
        <li>двомісний однокімнатний номер - 140 грн/доба </li>
        <li>сімейний двокімнатний номер :</li>
        <ul>
            <li>для 3-ох осіб - 200 грн/доба</li>
            <li>для 4-ох осіб - 240 грн/доба</li>
        </ul>
    </ul>
    <p>
        період 21.04.2013 - 25.09.2013 <span class="GreenHouseNormalTextP1">(високий сезон)</span></p>
    <ul>
        <li>двомісний однокімнатний номер - 180 грн/доба </li>
        <li>сімейний двокімнатний номер :</li>
        <ul>
            <li>для 3-ох осіб - 240 грн/доба</li>
            <li>для 4-ох осіб - 280 грн/доба</li>
        </ul>
    </ul>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotosName"
    runat="server">
    <p>
        Фото
    </p>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="GreenHouseContentPlaceHolderTabPhotos"
    runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="ContentPlaceHolderContactsName"
    runat="server">
    <p>
        Контакти
    </p>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolderContacts" runat="server">
    <table>
        <tr>
            <td>
                <p class="H1Text">
                    Поштова адреса
                </p>
                <p>
                    смт. Східниця
                    <br />
                    вул. Промислова 58
                    <br />
                    Дрогобицький р-н
                    <br />
                    Львівська обл.
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Телефон
                </p>
                <p>
                    +38 (096) 812-20-98,
                    <br />
                    +38 (093) 873-83-94,
                    <br />
                    +38 (093) 566-66-89
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    E-mail:
                </p>
                <p>
                    <a href="mailto:ukr_root@ukr.net">ukr_root@ukr.net</a>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    GPS координати:
                </p>
                <p>
                    <strong>N</strong>: 49.227798
                    <br />
                    <strong>E</strong>: 23.343444
                    
                    <br />
                    <a href="https://maps.google.com.ua/maps?q=49.227798+23.343444&hl=uk&ll=49.227798,23.343444&spn=0.095845,0.264187&t=m&z=13">
                        Показати на карті</a>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="H1Text">
                    Як доїхати:
                </p>
                <p>
                    <strong>Громадським транспортом </strong>
                </p>
                <p>
                    Зі Львова автобусом від головного залізничного вокзалу (відправляється щогодини).</p>
                <p>
                    Інший варіант доїзду — електропоїздом Львів—Трускавець від приміського вокзалу,
                    з Трускавця — автобусом від залізничного або автовокзалу (відправляється щогодини).
                </p>
                <p>
                    <strong>Автомобілем</strong></p>
                <p>
                    До Східниці через Дрогобич, Трускавець. У Східниці їхати до автовокзалу, далі в
                    напрямку вказівника на пансіонат "Гуцулка" (дорогою вгору). Садиба буде праворуч
                    від дороги (100 м від пансіонату).
                </p>
            </td>
        </tr>
    </table>
</asp:Content>
