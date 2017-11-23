<%@ page import="main.Review" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${not empty sessionScope.user}">
    <jsp:include page="/restricted/header.jsp" flush="true"/>
</c:if>
<c:if test="${empty sessionScope.user}">
    <jsp:include page="/header_anonimo.jsp" flush="true"/>
</c:if>

<jsp:useBean id="product" class="main.Product" scope="request"/>
<jsp:useBean id="reviewDao" class="daos.impl.ReviewDaoImpl" scope="page"/>
<c:set var="reviewList" value="${reviewDao.getProductReview(product.productID)}" scope="page"/>


<html lang="it">
<head>
    <link href="css/product.css" rel="stylesheet" type="text/css">
    <style>
        #map {
            width: 100%;
            height: 400px;
            background-color: grey;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="carousel slide article-slide" id="article-photo-carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner cont-slider">
                    <div class="item active">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                </div>
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                </ol>
            </div>
        </div>
        <div class="col-md-6">
            <h1>${product.productName}</h1>
            <c:choose>
                <c:when test="${product.price != product.actualPrice}">
                    <h2><span class="strikethrough">${product.price} €</span>&nbsp<span
                            class="text-right">${product.actualPrice} €</></h2>
                </c:when>
                <c:otherwise>
                    <h2>${product.price} €</h2>
                </c:otherwise>
            </c:choose>

            <fmt:formatNumber var="rat" groupingUsed="false" maxFractionDigits="0" value="${product.rating} "/>

            <c:choose>
                <c:when test="${rat ge 0}">
                    <c:forEach begin="0" end="${rat - 1}" varStatus="loop">
                        <i class="fa fa-star rating_star" aria-hidden="true"></i>
                    </c:forEach>
                    <c:forEach begin="0" end="${4 - rat}" varStatus="loop">
                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach begin="0" end="4" varStatus="loop">
                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${fn:length(reviewList) == 0}">
                    &nbsp&nbsp<span class="text-right">Nessuna recensione</span>
                </c:when>
                <c:when test="${fn:length(reviewList) == 1}">
                    &nbsp&nbsp<span class="text-right">1 recensione</span>
                </c:when>
                <c:otherwise>
                    &nbsp&nbsp<span class="text-right">${fn:length(reviewList)} recensioni</span>
                </c:otherwise>
            </c:choose>

            <h2>Venduto da <a href="#">${product.shopName}</a></h2>
            <a class="btn btn-primary"><i class="fa fa-fw fa-home pull-left"></i>Visualizza venditori nelle
                vicinanze</a>
            <p><br>${product.description}</p>
            <c:choose>
                <c:when test="${product.quantity > 0}">
                    <h2>Disponibilità: <span>${product.quantity}</span></h2>
                </c:when>
                <c:otherwise>
                    <h2>Il prodotto non è al momento disponibile.</h2>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${user != null}">
                    <a href="javascript:void(0);" class="btn btn-primary"
                       onclick="addToCart('${product.productID}','${product.shopID}');"><i
                            class="fa fa-fw pull-left fa-shopping-cart"></i>Aggiungi al carrello</a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-primary" href="#"><i class="fa fa-fw pull-left fa-shopping-cart"></i>Aggiungi al
                        carrello</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-md-12">
            <h1>Recensioni</h1>
            <c:choose>
                <c:when test="${rat ge 0}">
                    <c:forEach begin="0" end="${rat - 1}" varStatus="loop">
                        <i class="fa fa-star rating_star" aria-hidden="true"></i>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${rat lt 5}">
                            <c:forEach begin="0" end="${4 - rat}" varStatus="loop">
                                <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:forEach begin="0" end="4" varStatus="loop">
                        <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${fn:length(reviewList) == 0}">
                    &nbsp&nbsp<span class="text-right">Nessuna recensione</span>
                </c:when>
                <c:when test="${fn:length(reviewList) == 1}">
                    &nbsp&nbsp<span class="text-right">1 recensione</span>
                </c:when>
                <c:otherwise>
                    &nbsp&nbsp<span class="text-right">${fn:length(reviewList)} recensioni</span>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <!-- inizio review -->
    <c:choose>
    <c:when test="${not empty reviewList}">
    <c:forEach items="${reviewList}" var="review">
        <div class="review" style="box-shadow: 0 2px 35px rgba(0,0,0,.15); margin-top: 20px !important;">
            <h3>${review.getCreationdate()} - ${review.title}</h3>
            <p>
                <c:set var="author" value="${reviewDao.getReviewAuthor(review.userID)}" scope="page"/>
                <b>${author.firstName} ${author.lastName}</b> <!-- TODO fai funzione che restituisce array di autori-->
            </p>
            <p>
                <fmt:formatNumber var="rat2" groupingUsed="false" maxFractionDigits="0" value="${review.rating} "/>

                <c:forEach begin="0" end="${rat2 - 1}" varStatus="loop">
                    <i class="fa fa-star rating_star" aria-hidden="true"></i>
                </c:forEach>
                <c:choose>
                    <c:when test="${rat2 lt 5}">
                        <c:forEach begin="0" end="${4 - rat2}" varStatus="loop">
                            <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </p>
            <p> ${review.description}</p>
        </div>
    </c:forEach>
</div>
<!-- fine ordine -->

</c:when>
<c:otherwise>
    <h3>&nbsp;&nbsp;&nbsp;Non ci sono recensioni</h3>
</c:otherwise>
</c:choose>


<div id="map"></div>

<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNMIz_QgiWP6ayg3icP3ZmLXt6OE_Qync&callback=myMap">
</script>

</body>
<script type="text/javascript" src="js/product.js"></script>
<script type="text/javascript" src="js/map.js"></script>

</html>