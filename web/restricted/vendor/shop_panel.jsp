<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Pannello di controllo del negozio
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/vendor.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
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
        <div style="margin-top:60px !important;" class="container">
            <div class="row">
                <div class="col-md-4" id="navbar">
                    <div class="col-md-12">
                        <img style="margin-top: 20px" src='${shop.shopphoto[0]}' alt='images Here' width="400" height="300"/>
                        <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                        <h4 id="shopEmailWebsite" class="text-center text-info"><a style="color:dodgerblue" href="${shop.website}">${shop.website.toLowerCase()}</a></h4>
                        <p>${shop.description}</p>
                        <div class="row text-center">
                            <fmt:formatNumber var="rat" groupingUsed = "false" maxFractionDigits = "0" value="${shop.rating}" />
                            <c:choose>
                                <c:when test="${rat ge 0}">
                                    <c:forEach begin="0" end="${rat}" varStatus="loop">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </c:forEach>
                                    <c:forEach begin="0" end="${4-rat}" varStatus="loop">
                                        <i class="fa fa-star-o" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach begin="0" end="4" varStatus="loop">
                                        <i class="fa fa-star-o" aria-hidden="true"></i>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <a href="#"> vedi tutte</a>
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
                <div class="col-md-1" id="mySpace">
                </div>
                <div class="col-md-7" id="mainContent">
                    <div class="row" id="panelContainer">
                        <div class="col-md-4" id="photoPanel">
                            <div class="col-md-12">
                                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                                            <div class="item <c:if test='${status.first}'>active</c:if>">
                                                <img src='${image}' alt='images Here' width="400" height="300"/>
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
                                <a id="btnAddPhoto" class="btn btn-block btn-primary"><i class="fa fa-fw pull-left fa-camera"></i>Aggiungi foto</a>
                                <a class="btn btn-block btn-primary" data-toggle="modal" data-target="#editShopInfo"><i class="fa fa-fw pull-left fa-book"></i>Modifica negozio</a>
                            </div>
                        </div>
                        <div class="col-md-1" id="mySpace2">
                        </div>
                        <div class="col-md-6" id="buttonPanel">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href="inventory.jsp" id="btnInventario" class="btn-lg btn-block btn-success btnUpper"><i class="fa fa-cube fa-fw fa-lg pull-left"></i>Inventario</a>
                                </div>
                                <div class="col-md-6">
                                    <a id="btnOrderList" class="btn-lg btn-block btn-success btnUpper"><i class="fa fa-fw fa-lg fa-list-ul pull-left"></i>Ordini</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <a id="btnReviews" class="btn-lg btn-block btn-success btnLower"><i class="fa fa-comments-o fa-fw fa-lg pull-left"></i>Recensioni</a>
                                </div>
                                <div class="col-md-6">
                                    <a id="btnDispute" class="btn-lg btn-block btn-success btnLower"><i class="fa fa-fw fa-lg fa-warning pull-left"></i>Dispute</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="productsLeftContainer">
                        <div class="col-md-12">
                            <div class="row">
                                <h1 id="productsLeftTitle">Prodotti in esaurimento</h1>
                            </div>
                            <div class="row" id="productsLeftRows">
                                <c:choose>
                                    <c:when test="${shop.expiringProducts.isEmpty()}">
                                        <h3>Nessun prodotto in esaurimento</h3>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${shop.expiringProducts}" var="product">
                                            <div class="row productRow">
                                                <div class="col-md-10">
                                                    <div class="row">
                                                        <div class="productNameDiv col-md-6">
                                                            <h5 class="productName text-left">${product.productName}</h5>
                                                        </div>
                                                        <div class="itemsLeftDiv col-md-6">
                                                            <h5 class="itemsLeft text-right">Prodotti rimanenti: ${product.quantity}</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <a href="${pageContext.request.contextPath}/product.jsp?product=${product.productID}&shop=${shop.shopID}" class="showProduct btn-sm btn-default">Vedi</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editShopInfo" tabindex="-1" role="dialog" aria-labelledby="editShopInfoLabel">
            <div class="row">
                <div class="card card-signup centerize" data-background-color="orange">
                        <%--TODO:Auto-populate previous values--%>
                    <form id="editShopInfoForm" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/vendor/editshopinfo">
                        <div class="header header-primary text-center">
                            <h4 class="title title-up">Modifica dati</h4>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border nologin">
                          <span class="input-group-addon">
                              <i class="fa fa-user green" aria-hidden="true"></i>
                          </span>
                                <input name="ShopName" type="text" class="form-control"  placeholder=${shop.name}>
                            </div>
                            <div class="input-group form-group-no-border">
                                <span class="input-group-addon">
                                    <i class="fa fa-book green" aria-hidden="true"></i>
                                </span>
                                <input name="ShopDescription" type="text" class="form-control" placeholder=${shop.description}/>
                            </div>
                            <div class="input-group form-group-no-border">
                                <span class="input-group-addon">
                                    <i class="fa fa-book green" aria-hidden="true"></i>
                                </span>
                                <input name="ShopWebsite" type="text" class="form-control" placeholder=${shop.website}/>
                            </div>
                            <div class="input-group form-group-no-border nologin">
                              <span class="input-group-addon">
                                  <i class="fa fa-map-marker green" aria-hidden="true"></i>
                              </span>
                                <input name="ShopAddress" type="text" class="form-control" placeholder="Indirizzo..."/>
                            </div>
                            <div class="input-group form-group-no-border nologin">
                                <span class="input-group-addon">
                                    <i class="fa fa-building green" aria-hidden="true"></i>
                                </span>
                                <input name="ShopCity" type="text" class="form-control" placeholder="City..."/>
                            </div>
                        <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-envelope green" aria-hidden="true"></i>
                          </span>
                            <input name="ShopCAP" type="text" class="form-control" placeholder="CAP..."/>
                        </div>
                        <div class="footer text-center">
                            <a class="btn btn-default" onclick="$('#editShopInfoForm').submit();">Salva</a>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>