<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" flush="true" />

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/vendor.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:useBean id="shop" class="main.Shop" scope="session"/>
<div style="margin-top:60px !important;" class="container">
    <div class="row">
        <div class="col-md-4" id="navbar">
            <div class="col-md-12">
                <div class="carousel slide article-slide" id="article-photo-carousel" style="margin: 20px auto 10px auto;">
                    <%-- Wrapper for slides --%>
                    <div class="carousel-inner cont-slider">

                    </div>
                    <%-- Indicators --%>
                    <ol class="carousel-indicators">
                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                            <li ${status.first ? 'class="active"' : 'class=""'} data-slide-to="${status.index}" data-target="#article-photo-carousel"></li>
                        </c:forEach>
                    </ol>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">

                        <c:forEach var="i" begin = "0" end = "${shop.shopphoto.size()-1}">
                            <li data-target="#myCarousel" data-slide-to="${i}" ${i == 0 ? 'class="active"' : ''}></li>
                        </c:forEach>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <c:forEach items="${shop.shopphoto}" var="image" varStatus="status">
                            <div class="item ${status.first ? 'active' : ''}">
                                <img alt="" title="" src="${image}">
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span><<</span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span>>></span>
                        <span class="sr-only">Next</span>
                    </a>
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
                    <p>Posizione: ${shop.latitude}, ${shop.longitude}</p>
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
                        <a href="#"><img src="http://via.placeholder.com/400x300" class="img-responsive"></a>
                        <a id="btnAddPhoto" class="btn btn-block btn-primary"><i class="fa fa-fw pull-left fa-camera"></i>Aggiungi foto</a>
                        <a id="btnShopSettings" class="btn btn-block btn-primary"><i class="fa fa-fw pull-left fa-book"></i>Modifica negozio</a>
                    </div>
                </div>
                <div class="col-md-1" id="mySpace2">
                </div>
                <div class="col-md-6" id="buttonPanel">
                    <div class="row">
                        <div class="col-md-6">
                            <a id="btnInventario" class="btn-lg btn-block btn-success btnUpper"><i class="fa fa-cube fa-fw fa-lg pull-left"></i>Inventario</a>
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

                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/vendor.js"></script>
</body>
</html>