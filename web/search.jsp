<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="products" class="java.util.HashMap" scope="request"/>
<jsp:useBean id="categories" class="java.util.HashSet" scope="request"/>
<jsp:useBean id="vendors" class="java.util.HashSet" scope="request"/>
<jsp:useBean id="geozone" class="java.util.HashSet" scope="request"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Ricerca
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/bootstrap-slider-master/bootstrap-slider-master/dist/css/bootstrap-slider.css">
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/search/search.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-slider-master/bootstrap-slider-master/dist/bootstrap-slider.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="container banner">
            <h5>
                <a href="index.jsp">Home</a>
                <c:if test="${param.cat != null}">
                    <i class="fa fa-angle-right"></i>
                    <a class="text-capitalize" href="search.jsp?cat=${param.cat}&q=">${param.cat}</a>
                </c:if>

                <span class="text-capitalize">: <b>"${param.q}"</b> <small>(${products.size()} risultati)</small></span>
            </h5>
        </div>

        <div class="container">
            <div class="row hidden">
                <div class='col-md-2 sidebar'>
                    <h3>Left Sidebar</h3>
                    <ul class="nav nav-tabs nav-stacked">
                        <li><a href='#'>Another Link 1</a></li>
                        <li><a href='#'>Another Link 2</a></li>
                        <li><a href='#'>Another Link 3</a></li>
                    </ul>
                </div>
                <div class='col-md-10 main'>
                    <h2>Main Content Section</h2>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.<p>

                    <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <div class="search_row">
                        <h3 class="text-center collapsed" data-toggle="collapse" data-target="#categorie_accordion"
                            style="cursor:pointer;">Categorie <span class="caret"></span></h3>
                        <ul class="list-group collapse" aria-expanded="false" id="categorie_accordion">
                            <c:if test="${not empty categories}">
                                <c:forEach var="icat" items="${categories}">
                                    <c:choose>
                                        <c:when test="${param.cat == icat}">
                                            <li class="list-group-item"><input type="radio" name="${icat}" value="${icat}"
                                                                               onclick="filterRadio(this,'cat');"
                                                                               checked/> ${icat}</li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="list-group-item"><input type="radio" name="${icat}" value="${icat}"
                                                                               onclick="filterRadio(this,'cat');"/> ${icat}</li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <h3 class="text-center collapsed" data-toggle="collapse" data-target="#venditori_accordion"
                            style="cursor:pointer;">Venditori <span class="caret"></span></h3>
                        <ul class="list-group collapse" aria-expanded="false" id="venditori_accordion">
                            <c:set var="vendoritem" scope="page" value="${paramValues.get('vendors')}"/>

                            <c:if test="${not empty vendors}">
                                <c:choose>
                                    <c:when test="${not empty vendoritem}">
                                        <c:forEach var="iven" items="${vendors}">
                                            <c:set var="found" value="false" scope="page"/>
                                            <c:forEach var="ivan" items="${vendoritem}">
                                                <c:if test="${ivan eq iven}">
                                                    <c:set var="found" value="true" scope="page"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${found eq true}">
                                                    <li class="list-group-item"><input type="checkbox" iven="${iven}"
                                                                                       name="${iven}" value="${iven}"
                                                                                       onclick="filter(this,'vendor');"/> ${iven}
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="list-group-item"><input type="checkbox" civen="${iven}"
                                                                                       name="${iven}" value="${iven}"
                                                                                       onclick="filter(this,'vendor');"
                                                                                       checked/> ${iven}</li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="iven" items="${vendors}">
                                            <li class="list-group-item"><input type="checkbox" name="${iven}" value="${iven}"
                                                                               onclick="filter(this,'vendor');"
                                                                               checked/> ${iven}</li>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </ul>
                        <h3 class="text-center collapsed" data-toggle="collapse" data-target="#geozone_accordion" style="cursor:pointer;">
                            Area Geografica <span class="caret"></span></h3>
                        <ul class="list-group collapse" aria-expanded="false" id="geozone_accordion">
                            <c:set var="geozoneitem" scope="page" value="${paramValues.get('geo')}"/>

                            <c:if test="${not empty geozone}">
                                <c:choose>
                                    <c:when test="${not empty geozoneitem}">
                                        <c:forEach var="iven" items="${geozone}">
                                            <c:set var="found" value="false" scope="page"/>
                                            <c:forEach var="ivan" items="${geozoneitem}">
                                                <c:if test="${ivan eq iven}">
                                                    <c:set var="found" value="true" scope="page"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${found eq true}">
                                                    <li class="list-group-item"><input type="checkbox" iven="${iven}"
                                                                                       name="${iven}" value="${iven}"
                                                                                       onclick="filter(this,'geo');"/> ${iven}
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="list-group-item"><input type="checkbox" civen="${iven}"
                                                                                       name="${iven}" value="${iven}"
                                                                                       onclick="filter(this,'geo');"
                                                                                       checked/> ${iven}</li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="iven" items="${geozone}">
                                            <li class="list-group-item"><input type="checkbox" name="${iven}" value="${iven}"
                                                                               onclick="filter(this,'geo');" checked/> ${iven}
                                            </li>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </ul>
                        <h3 class="text-center">Prezzo</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <h6 style="margin-left:10%;">Minimo</h6>
                                <h6 style="margin-left:10%;">Massimo</h6>
                            </div>
                            <div class="col-md-6" style="text-align:right;">
                                <c:choose>
                                    <c:when test="${not empty param.minPrice}">
                                        <input class="form-control no-border input_prezzo" type="text"
                                               onfocusout="filterPrice(this,'minPrice');" value="${param.minPrice}">
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control no-border input_prezzo" type="text"
                                               onfocusout="filterPrice(this,'minPrice');" value="">
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${not empty param.maxPrice}">
                                        <input class="form-control no-border input_prezzo" type="text"
                                               onfocusout="filterPrice(this,'maxPrice');" value="${param.maxPrice}">
                                    </c:when>
                                    <c:otherwise>
                                        <input class="form-control no-border input_prezzo" type="text"
                                               onfocusout="filterPrice(this,'maxPrice');" value="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="row" style="padding-bottom:15px">
                            <h3 class="text-center">Valutazione</h3>
                            <div class="col-md-12" style="margin-left:5%">
                                <i class="fa fa-star rating_star" aria-hidden="true" id="stella_0" onmouseover="setStar(this)"
                                   onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_1" onmouseover="setStar(this)"
                                   onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_2" onmouseover="setStar(this)"
                                   onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_3" onmouseover="setStar(this)"
                                   onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_4" onmouseover="setStar(this)"
                                   onclick="setStarFilter()" style="cursor:pointer"></i>&nbsp;
                                &nbsp;o più
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-10">
                    <c:if test="${not empty products}">
                        <ul class="list-group">
                        <c:forEach var="prod" items="${products}" varStatus="status">
                            <div class="search_row row vcenter ${status.first ? '' : 'separated'}">
                                <div class="col-md-2">
                                    <c:choose>
                                        <c:when test="${not empty prod.value.getImageData()}">
                                            <img src='${prod.value.getImageData()}' alt='images Here' width="100" height="100"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src='http://via.placeholder.com/1000x1000' alt='images Here' width="100"
                                                 height="100"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-md-7 text-left">
                                    <h2><a style="color:#2c3e50" href="${pageContext.request.contextPath}/product.jsp?product=${prod.value.getList().get(0).getProductID()}&shop=${prod.value.getList().get(0).getShopID()}">${prod.value.getList().get(0).getProductName()}</a></h2>
                                    <p>Venduto da <a href="${pageContext.request.contextPath}/shop.jsp?id=${prod.value.getList().get(0).getShopID()}">${prod.value.getList().get(0).getShopName()}</a>&nbsp&nbsp<span
                                            style="font-size:12px">o da altri <a href="javascript:void(0);"
                                                                                 onclick="openModal('${prod.value.getList().get(0).getProductName()}');">${prod.value.getList().size()}</a> venditori</span>
                                    </p>
                                    <h1 class="prezzo">${prod.value.getList().get(0).getActualPrice()} €</h1>
                                </div>
                                <div class="col-md-3">

                                    <c:forEach begin="0" end="${prod.value.getList().get(0).getRating() - 1}" varStatus="loop">
                                        <i class="fa fa-star rating_star" aria-hidden="true"></i>
                                    </c:forEach>
                                    <c:forEach begin="0" end="${5 - prod.value.getList().get(0).getRating()}" varStatus="loop">
                                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                    </c:forEach>
                                    <fmt:formatNumber var="rc" groupingUsed = "false" maxFractionDigits = "0" value="${prod.value.getReviewCount()}"/>
                                    <!-- da testare i due primi when -->
                                    <c:choose>
                                        <c:when test="${rc == 0}">
                                            &nbsp&nbsp<span class="text-right">Nessuna recensione</span>
                                        </c:when>
                                        <c:when test="${rc == 1}">
                                            &nbsp&nbsp<span class="text-right">1 recensione</span>
                                        </c:when>
                                        <c:otherwise>
                                            &nbsp&nbsp<span class="text-right">${rc} recensioni</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="javascript:void(0);" class="btn btn-default margins"
                                       onclick="addToCart('${prod.value.getList().get(0).getProductID()}','${prod.value.getList().get(0).getShopID()}');">Aggiungi
                                        al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </c:forEach>
                        </ul>
                    </c:if>

                </div>
            </div>

        </div>

        <!-- Modal -->
        <div class="modal fade" id="vendorsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="row">
                <div class="card card-signup centerize" data-background-color="orange" id="signup_login_card">
                            <span class="form" id="form">
                                <div class="header header-primary text-center">
                                    <h4 class="title title-up" id="card_titolo_vendors">Piano cottura</h4>
                                    <p class="white subtitolo">
                                        Disponibile anche da:
                                    </p>
                                </div>
                                <div class="content">
                                    <div class="row text-center">
                                        <div class="content-modal-vendors" id="content-modal-vendors">

                                        </div>
                                    </div>
                                </div>
                                <div class="footer text-center">
                                    <div id="footer_vendors">

                                    </div>
                                    <div class="row" style="margin-top:10px" id="pagination_numbers_vendors">

                                    </div>
                                </div>
                            </span>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>