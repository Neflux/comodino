<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${not empty sessionScope.user}">
    <jsp:include page="/restricted/header.jsp" flush="true" />
</c:if>
<c:if test="${empty sessionScope.user}">
    <jsp:include page="/header_anonimo.jsp" flush="true" />
</c:if>

<jsp:useBean id="shop" class="main.Shop" scope="session"/>

<html lang="en">
<head>
    <title>${shop.name}</title>
    <link href="css/vendor_public.css" rel="stylesheet" type="text/css">
    <link href="css/search.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4" id="navbar">
            <div class="col-md-12">
                <div class="carousel slide article-slide" id="article-photo-carousel" style="margin: 20px auto 10px auto;">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner cont-slider">
                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                            <div class="item${status.first ? 'active' : ''}">
                                <img alt="" title="" src="${image}">
                            </div>
                        </c:forEach>
                    </div>
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                            <li ${status.first ? 'class="active"' : 'class=""'} data-slide-to="${status.index}" data-target="#article-photo-carousel">
                                <img alt="" src="http://placehold.it/250x180">
                            </li>
                        </c:forEach>
                    </ol>
                </div>
                <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                <h4 id="shopEmailWebsite" class="text-center text-info"><a style="color:dodgerblue" href="${shop.website}">${shop.website.toLowerCase()}</a></h4>
                <p>${shop.description}</p>
                <div class="row text-center">
                    <fmt:formatNumber var="rat" groupingUsed = "false" maxFractionDigits = "0" value="${shop.rating}" />
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
                <div id="addShopDiv" class="row" style="margin-bottom: 15px">
                    <div class="col-md-10">
                        <h2 id="realShop">Negozio fisico</h2>
                    </div>
                </div>
                <p>Indirizzo: ${shop.address}</p>
                <p>City: ${shop.city}</p>
                <p>CAP: ${shop.zip}</p>
                <p>Orari: ${shop.openingHours}</p>
                <p>Posizione: ${shop.latitude} - ${shop.longitude}</p>
                <div id="map" style="margin: 15px auto; height:250px; width:100%"></div>
            </div>
        </div>
        <div class="col-md-1" id="mySpace"></div>
        <div class="col-md-7" id="mainContent">
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
                            <a href="javascript:void(0);" class="btn btn-default margins" onclick="addToCart('${prod.value.getList().get(0).getProductID()}','${shop.shopID}');">Aggiungi al carrello&nbsp&nbsp<i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/search/search.js"></script>
<script type="text/javascript" src="js/vendor.js"></script>
<script>
    var map, infoWindow;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 46.074, lng:  11.121},
            zoom: 7
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                infoWindow.setPosition(pos);
                infoWindow.setContent('Tu sei qui');
                infoWindow.open(map);
                map.setCenter(pos);
            }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }

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
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNMIz_QgiWP6ayg3icP3ZmLXt6OE_Qync&callback=initMap">
</script>
</body>
</html>