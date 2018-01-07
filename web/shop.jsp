<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Math" %>
<%@ page import="utils.Utils" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>
<jsp:useBean id="reviewDao" class="daos.impl.ReviewDaoImpl"/>
<c:set var="reviewList" value="${reviewDao.getShopReviews(shop.shopID)}" scope="page"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        ${shop.name}
    </jsp:attribute>

    <jsp:attribute name="pagecss">
        <link href="${pageContext.request.contextPath}/css/vendor_public.css" rel="stylesheet" type="text/css">
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/addtocart.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/shop.js"></script>
        <c:if test="${shop.getClass().simpleName == 'PhysicalShop'}">
            <script>
                var map, infoWindow;
                function initMap() {
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: ${shop.latitude}, lng:  ${shop.longitude}},
                        zoom: 7
                    });

                    var mark = {lat: ${shop.latitude}, lng: ${shop.longitude}};
                    var marker = new google.maps.Marker({
                        position: mark,
                        map: map,
                        animation: google.maps.Animation.DROP,
                        title: '${shop.name}'
                    });
                }

                function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                    infoWindow.setPosition(pos);
                    infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
                    infoWindow.open(map);
                }
            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNMIz_QgiWP6ayg3icP3ZmLXt6OE_Qync&callback=initMap"></script>
        </c:if>
    </jsp:attribute>
    <jsp:body>
        <div class="container container-transparent">
            <div class="row">
                <div id="shopInfo" class="col-md-4 col-xs-12">
                    <c:choose>
                        <c:when test="${not empty shop.shopphoto}">
                            <section class="section-white">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                                            <div class="item <c:if test='${status.first}'>active</c:if>">
                                                <img src='${shop.shopphoto[0]}' alt='images Here' width="300" height="400"/>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <!-- Controls -->
                                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </section>
                        </c:when>
                        <c:otherwise>
                            <img src='http://via.placeholder.com/300x400' alt='Shop Photo Placeholder' width="300" height="400"/>
                        </c:otherwise>
                    </c:choose>
                    <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                    <h4 id="shopEmailWebsite" class="text-center text-info"><a style="color:dodgerblue" href="${shop.website}">${shop.website.toLowerCase()}</a></h4>
                    <p class="text-center">${shop.description}</p>
                    <div class="row text-center">
                        <c:choose>
                            <c:when test="${shop.rating == -1}">
                                Nessuna recensione
                            </c:when>
                            <c:otherwise>
                                <%-- TODO: cambiare rating con nuovo sistema (copiare rating prodotti search)--%>
                                <c:if test="${shop.rating > 0}">
                                    <c:forEach begin="0" end="${shop.rating - 1}" varStatus="loop">
                                        <i class="fa fa-star myiconresize" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${shop.rating < 5}">
                                    <c:forEach begin="0" end="${4 - shop.rating}" varStatus="loop">
                                        <i class="fa fa-star-o myiconresize" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:if>
                                &nbsp;&nbsp;<as class="collapsed" data-toggle="collapse" data-target="#shopReviews">Vedi Tutte<span class="caret"></span></as>
                                <ul id="shopReviews" class="list-group collapse" aria-expanded="false">
                                    <c:forEach items="${reviewList}" var="review">
                                        <li class="list-group-item">
                                            <p><b>${review.title}</b></p>
                                            <p
                                            <c:if test="${review.rating > 0}">
                                                <c:forEach begin="0" end="${review.rating - 1}" varStatus="loop">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:forEach>
                                            </c:if>
                                                <c:if test="${review.rating < 5}">
                                                    <c:forEach begin="0" end="${4 - review.rating}" varStatus="loop">
                                                        <i class="fa fa-star-o" aria-hidden="true"></i>
                                                    </c:forEach>
                                                </c:if>
                                            </p>
                                            <p>${review.description}</p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <c:if test="${not empty user && !user.hasReviewedShop(shop.shopID)}">
                        <div class="row text-center">
                            <button class="btn btn-primary" style="margin-top: 15px" data-toggle="modal" data-target="#openreviewmodal">Lascia una recensione</button>
                        </div>
                    </c:if>
                    <c:if test="${shop.getClass().simpleName == 'PhysicalShop'}">
                            <div id="addShopDiv" class="row" style="margin-bottom: 15px">
                                <div class="col-md-10">
                                    <h2 id="realShop">Negozio fisico</h2>
                                </div>
                            </div>
                            <p>Indirizzo: ${shop.address}</p>
                            <p>Città: ${shop.city}</p>
                            <p>ZIP: ${shop.zip}</p>
                            <p>Orari: ${shop.openinghours}</p>
                            <div id="map" style="margin: 15px auto; height:250px; width:100%"></div>
                        </c:if>
                </div>
                <div class="col-md-8 col-xs-12">
                    <c:choose>
                        <c:when test="${not empty shopproducts}">
                            <ul class="list-group search">
                                <c:forEach var="prod" items="${shopproducts}" varStatus="status">
                                    <li class="list-group-item product">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-xs-12">
                                                <a href="${pageContext.request.contextPath}/product.jsp?product=${prod.value.getList().get(0).getProductID()}&shop=${prod.value.getList().get(0).getShopID()}">
                                                    <img class="img-rounded img-responsive" src="${prod.value.getImageData()}" alt="product image">
                                                </a>
                                            </div>
                                            <div class="col-lg-7 col-md-5 col-xs-6">
                                                <h2 class="list-group-item-heading"><a class="resetcolor" href="${pageContext.request.contextPath}/product.jsp?product=${prod.value.getList().get(0).getProductID()}&shop=${prod.value.getList().get(0).getShopID()}">${prod.value.getList().get(0).getProductName()}</a></h2>
                                                <ul class="list-unstyled list-group-item-text">
                                                    <li class="price">
                                                            ${Utils.getNDecPrice(prod.value.getList().get(0).getActualPrice(),2)}&euro;
                                                        <c:if test="${prod.value.getList().get(0).getActualPrice() != prod.value.getList().get(0).getPrice()}">
                                                            <span class="badge badge-discount">In offerta!</span>
                                                        </c:if>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-lg-3 col-md-5 col-xs-6 text-center">
                                                <div class="row rating-field">
                                                    <c:set var="rating" value="${prod.value.getList().get(0).getRating()}" scope="page"/>
                                                    <c:choose>
                                                        <c:when test="${Math.round(rating) == -1}">
                                                            Nessuna recensione
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${Math.round(rating) > 0}">
                                                                <c:forEach begin="0" end="${Math.round(rating) - 1}" varStatus="loop">
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${Math.round(rating) < 5}">
                                                                <c:forEach begin="0" end="${4 - Math.round(rating)}" varStatus="loop">
                                                                    <i class="fa fa-star-o" aria-hidden="true"></i>
                                                                </c:forEach>
                                                            </c:if>
                                                            <fmt:formatNumber var="rc" groupingUsed = "false" maxFractionDigits = "0" value="${prod.value.getReviewCount()}"/>
                                                            <!-- da testare i due primi when -->
                                                            <c:choose>
                                                                <c:when test="${rc == 0}">
                                                                </c:when>
                                                                <c:when test="${rc == 1}">
                                                                    &nbsp&nbsp<span class="text-right">1 recensione</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    &nbsp&nbsp<span class="text-right">${rc} recensioni</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="row">
                                                    <button class="btn btn-default" onclick="addToCart('${prod.value.getList().get(0).getProductID()}','${prod.value.getList().get(0).getShopID()}');">
                                                        Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <div class="container" >
                                <div class="jumbotron" style="margin-top:10%; background-color: transparent">
                                    <h2>Nessun prodotto nell'inventario del negozio</h2>
                                    <p>Il proprietario deve ancora caricare i primi articoli</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="modal fade" id="openreviewmodal" tabindex="-1" role="dialog">
            <div class="row">
                <div id="openreviewcard" class="card card-signup centerize" data-background-color="orange">
                    <form id="openreviewform" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/openshopreview">
                        <div class="header header-primary text-center">
                            <h4 class="title title-up" style="margin-bottom: 30px">Nuova Recensione</h4>
                        </div>
                        <div class="content">
                            <input id="shopIdReviewModal" type="text" class="hidden" name="shopID" placeholder="" value="${shop.shopID}">

                            <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-star-o green" aria-hidden="true"></i>
                          </span>
                                <input id="titleReviewModal" type="text" class="form-control" name="title" placeholder="Titolo...">
                            </div>
                            <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-bars green" aria-hidden="true"></i>
                          </span>
                                <input id="descriptionReviewModal" type="text" class="form-control" name="description" placeholder="Descrivi prodotto...">
                            </div>
                            <div class="col-md-12 text-center stelle">
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_1" onmouseover="setStar(this)"
                                   onclick="setStarRating()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_2" onmouseover="setStar(this)"
                                   onclick="setStarRating()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_3" onmouseover="setStar(this)"
                                   onclick="setStarRating()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_4" onmouseover="setStar(this)"
                                   onclick="setStarRating()" style="cursor:pointer"></i>&nbsp;
                                <i class="fa fa-star-o rating_star" aria-hidden="true" id="stella_5" onmouseover="setStar(this)"
                                   onclick="setStarRating()" style="cursor:pointer"></i>&nbsp;
                                <input type="text" name="rating" hidden>
                            </div>
                        </div>
                        <div class="footer text-center" style="margin-top: 15px;">
                            <a class="btn btn-default" style="padding-left: 29px; padding-right: 29px;" onclick="$('#openreviewform').submit();">Invia</a>
                            <a class="btn btn-default" style="margin-left: 20px; padding-left: 25px; padding-right: 25px;" onclick="$(function(){$('#openreviewmodal').modal('toggle');});">Chiudi</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>