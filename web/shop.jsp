<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.Math" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>

<%-- TODO: pagina non del tutto responsive (pannelli laterali) --%>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        ${shop.name}
    </jsp:attribute>

    <jsp:attribute name="pagecss">
        <link href="${pageContext.request.contextPath}/css/vendor_public.css" rel="stylesheet" type="text/css">
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/addtocart.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/vendor.js"></script>
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
        <div class="container">
            <div class="row">
                <div class="col-md-4" id="navbar">
                    <div class="col-md-12">
                        <c:choose>
                            <c:when test="${not empty shop.shopphoto}">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                                            <div class="item <c:if test='${status.first}'>active</c:if>">
                                                <img src='${shop.shopphoto[0]}' alt='images Here' width="100" height="100"/>
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
                            </c:when>
                            <c:otherwise>
                                <img src='http://via.placeholder.com/500x500' alt='Shop Photo Placeholder' width="300" height="300"/>
                            </c:otherwise>
                        </c:choose>

                        <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                        <h4 id="shopEmailWebsite" class="text-center text-info"><a style="color:dodgerblue" href="${shop.website}">${shop.website.toLowerCase()}</a></h4>
                        <p>${shop.description}</p>
                        <div class="row text-center">
                            <c:choose>
                                <c:when test="${shop.rating == -1}">
                                    Nessuna recensione
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${shop.rating > 0}">
                                        <c:forEach begin="0" end="${shop.rating - 1}" varStatus="loop">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${shop.rating < 5}">
                                        <c:forEach begin="0" end="${4 - shop.rating}" varStatus="loop">
                                            <i class="fa fa-star-o" aria-hidden="true"></i>
                                        </c:forEach>
                                    </c:if>
                                    &nbsp;&nbsp;<a href="#">Vedi Tutte</a>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <c:if test="${shop.getClass().simpleName == 'PhysicalShop'}">
                            <div id="addShopDiv" class="row" style="margin-bottom: 15px">
                                <div class="col-md-10">
                                    <h2 id="realShop">Negozio fisico</h2>
                                </div>
                            </div>
                            <p>Indirizzo: ${shop.address}</p>
                            <p>City: ${shop.city}</p>
                            <p>CAP: ${shop.zip}</p>
                            <p>Orari: ${shop.openingHours}</p>
                            <div id="map" style="margin: 15px auto; height:250px; width:100%"></div>
                        </c:if>
                    </div>
                </div>
                <div class="col-md-1" id="mySpace"></div>
                <div class="col-md-7" id="mainContent">
                    <c:choose>
                        <c:when test="${not empty shopproducts}">
                            <c:forEach var="prod" items="${shopproducts}">
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
                                        <h2> <a style="color:#2c3e50" href="${pageContext.request.contextPath}/product.jsp?product=${prod.value.getList().get(0).getProductID()}&shop=${prod.value.getList().get(0).getShopID()}">${prod.value.getList().get(0).getProductName()}</a></h2>
                                        <h1 class="prezzo">${prod.value.getList().get(0).getActualPrice()} €</h1>
                                    </div>
                                    <div class="col-md-3 ratAdd">
                                        <c:set var="rating" value="${prod.value.getList().get(0).rating}" scope="page"/>
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
                                            </c:otherwise>
                                        </c:choose>
                                        <a href="javascript:void(0);" class="btn btn-default margins" onclick="addToCart('${prod.value.getList().get(0).getProductID()}','${shop.shopID}');">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </c:forEach>
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
    </jsp:body>
</t:genericpage>