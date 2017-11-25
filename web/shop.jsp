<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="shop" class="main.Shop" scope="session"/>

<html>
    <head>
        <title>Negozio</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/custom.min.css" rel="stylesheet" type="text/css">
        <link href="css/my.css" rel="stylesheet" type="text/css">
        <link href="css/public.shop.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <c:if test="${not empty sessionScope.user}">
            <jsp:include page="/restricted/header.jsp" flush="true" />
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <jsp:include page="/header_anonimo.jsp" flush="true" />
        </c:if>
        <div style="margin-top:+35px !important;" class="container">
            <div class="row">
                <div class="col-md-4" id="navbar">
                    <div class="col-md-12">
                        <a id="shopPhoto" href="#"><img src="http://via.placeholder.com/400x300" class="img-responsive"></a>
                        <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                        <h4 id="shopEmailWebsite" class="text-center text-info"><a href="${shop.website}"></a></h4>
                        <p>${shop.description}</p>
                        <div class="row text-center">
                            <fmt:formatNumber var="rat" groupingUsed = "false" maxFractionDigits = "0" value="${shop.rating}" />
                            <script type="text/javascript"> alert("var:"+${rat});</script>
                            <c:choose>
                                <c:when test="${rat ge 0}">
                                    <c:forEach begin="0" end="${rat}" varStatus="loop">
                                        <i class="fa fa-star rating_star" aria-hidden="true"></i>
                                    </c:forEach>
                                    <c:forEach begin="0" end="${4-rat}" varStatus="loop">
                                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach begin="0" end="4" varStatus="loop">
                                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <a href="#"> vedi tutte</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-1" id="mySpace">
                </div>
                <div class="col-md-7" id="mainContent">
                    <!-- magari rimuovere sta row extra -->
                    <div class="row">
                        <c:if test="${not empty requestScope.products}">
                            <c:forEach var="prod" items="${requestScope.products}">
                                <div class="search_row row vcenter separated">
                                    <div class="col-md-2">
                                        <c:choose>
                                            <c:when test="${not empty prod.value.getImageData()}">
                                                <img src='${prod.value.getImageData()}' alt='images Here' width="100" height="100"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src='http://via.placeholder.com/1000x1000' alt='images Here' width="100" height="100"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-7 text-left">
                                        <h2>${prod.value.getList().get(0).getProductName()}</h2>
                                        <h1 class="prezzo">${prod.value.getList().get(0).getActualPrice()} €</h1>
                                    </div>
                                    <div class="col-md-3 ratAdd">
                                        Valutazione:
                                        <fmt:formatNumber var="prat" groupingUsed = "false" maxFractionDigits = "0" value="${prod.value.getList().get(0).getRating()}" />
                                        <c:choose>
                                            <c:when test="${prat ge 0}">
                                                <c:forEach begin="0" end="${prat-1}" varStatus="loop">
                                                    <i class="fa fa-star rating_star" aria-hidden="true"></i>
                                                </c:forEach>
                                                <c:forEach begin="0" end="${4-prat}" varStatus="loop">
                                                    <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach begin="0" end="4" varStatus="loop">
                                                    <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        <a href="javascript:void(0);" class="btn btn-default margins" onclick="addToCart('${prod.value.getList().get(0).getProductID()}','${prod.value.getList().get(0).getShopID()}');">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
