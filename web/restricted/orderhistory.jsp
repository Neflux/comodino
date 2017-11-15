<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="utils.Utils" %>

<jsp:include page="header.jsp" flush="true"/>


<!DOCTYPE html>
<html>
<head>
    <title>Ordini</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/orderhistory.css" rel="stylesheet" type="text/css">
</head>
<body>


<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="orderDao" class="daos.impl.OrderDaoImpl"/>
<c:set var="orders" value="${orderDao.getAllOrders(user)}" scope="page"/>

<!-- general error, see passed parameter -->
<c:if test="${not empty param.success}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${param.success}
    </div>
</c:if>
<c:if test="${not empty param.warning}">
    <div id="popup" class="alert alert-warning alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Attenzione: ${param.warning}
    </div>
</c:if>
<c:if test="${not empty param.error}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Errore: ${param.error}
    </div>
</c:if>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 id="title" class="text-uppercase">Lista ordini:</h1>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#TuttiGliOrdini">Tutti gli ordini</a></li>
                <li><a data-toggle="tab" href="#OrdiniInCorso">Ordini in corso</a></li>
                <li><a data-toggle="tab" href="#OrdiniCompletati">Ordini completati</a></li>
            </ul>
            <div class="tab-content">
                <div id="TuttiGliOrdini" class="tab-pane fade in active">

                    <c:choose>
                        <c:when test="${not empty orders}">
                            <c:forEach items="${orders}" var="order">
                                <!-- inizio ordine -->
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row text-left">
                                                <div class="col-md-4 col-xs-4 text-left">
                                                    <h5> Ordine n: ${order.getOrderID()}</h5>
                                                </div>
                                                <div class="col-md-4 col-xs-4 text-center">
                                                    <h5> Totale: ${Utils.getNDecPrice(order.getTotal(),2)}&euro;</h5>
                                                </div>
                                                <div class="col-md-4 col-xs-4 text-right">
                                                    <h5> Effettuato il: ${order.getDate().toString()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-collapse">
                                            <ul class="list-group">
                                                <c:forEach items="${order.getProductList()}" var="po">
                                                    <!-- inizio prodotto -->
                                                    <li class="list-group-item">
                                                        <a class="list-group-item">
                                                            <div class="media col-md-2">
                                                                <figure class="pull-left">
                                                                    <img class="media-object img-rounded img-responsive" src="${po.getProduct().getImgBase64()}" alt="product image" height="" width="200px"> </figure>
                                                            </div>
                                                            <div class="col-md-5 col-xs-6">
                                                                <h1 class="list-group-item-heading">${po.getProduct().getProductName()}</h1>
                                                                <ul class="list-unstyled list-group-item-text">
                                                                    <li>Venditore: <b>${po.getProduct().getShopName()}</b></li>
                                                                    <li>Prezzo: ${Utils.getNDecPrice(po.getFinalPrice(),2)}&euro;</li>
                                                                    <li>Quantità: ${po.getQuantity()} pz</li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-md-3 col-xs-6 text-right">
                                                                <h4 class="list-group-item-heading">Spedito a:</h4>
                                                                <ul class="list-unstyled list-group-item-text">
                                                                    <li><b>${po.getAddress().getFirstName()} ${po.getAddress().getLastName()}</b></li>
                                                                    <li>${po.getAddress().getAddress()}</li>
                                                                    <li>${po.getAddress().getZip()}, ${po.getAddress().getCity()}</li>
                                                                    <li>+39 ${po.getAddress().getTelephoneNumber()}</li>
                                                                </ul>
                                                            </div>
                                                            <div class="col-md-2 text-center">
                                                                <c:choose>
                                                                    <c:when test="${po.getStatus() == 0}">
                                                                        <div class="row">
                                                                            <button type="button" class="btn btn-default btn-block margin-btn">Consegna avvenuta!</button>
                                                                        </div>
                                                                        <div class="row">
                                                                            <button type="button" class="btn btn-default btn-block margin-btn" onclick="openDisputeModal(${order.orderID},${po.product.productID},${po.product.shopID})">Apri disputa</button>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${po.getStatus() == 1}">

                                                                        <div class="row">
                                                                            <h3>Ordine<br>Completato</h3>
                                                                        </div>
                                                                        <div class="row">
                                                                            <button type="button" class="btn btn-default btn-block margin-btn" onclick="openReviewModal(${order.orderID},${po.product.productID},${po.product.shopID})">Lascia una recensione</button>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <h3>Errore status</h3>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <!-- fine prodotto -->
                                                </c:forEach>
                                            </ul>

                                        </div>

                                    </div>
                                </div>
                                <!-- fine ordine -->
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>&nbsp;&nbsp;&nbsp;Non hai ancora effettuato alcun ordine</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="OrdiniInCorso" class="tab-pane fade">
                    <c:choose>
                        <c:when test="${not empty orders}">
                            <c:forEach items="${orders}" var="order">
                                <!-- inizio ordine -->
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row text-left">
                                                <div class="col-md-4 text-left">
                                                    <h5> Ordine n: ${order.getOrderID()}</h5>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <h5> Totale: ${Utils.getNDecPrice(order.getTotal(),2)}&euro;</h5>
                                                </div>
                                                <div class="col-md-4 text-right">
                                                    <h5> Effettuato il: ${order.getDate().toString()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-collapse">
                                            <ul class="list-group">
                                                <c:forEach items="${order.getProductList()}" var="po">
                                                    <c:if test="${po.getStatus() == 0}">
                                                        <!-- inizio prodotto -->
                                                        <li class="list-group-item">
                                                            <a class="list-group-item">
                                                                <div class="media col-md-2">
                                                                    <figure class="pull-left">
                                                                        <img class="media-object img-rounded img-responsive" src="${po.getProduct().getImgBase64()}" alt="product image" height="" width="200px"> </figure>
                                                                </div>
                                                                <div class="col-md-5 col-xs-6">
                                                                    <h1 class="list-group-item-heading">${po.getProduct().getProductName()}</h1>
                                                                    <ul class="list-unstyled list-group-item-text">
                                                                        <li>Venditore: <b>${po.getProduct().getShopName()}</b></li>
                                                                        <li>Prezzo: ${Utils.getNDecPrice(po.getFinalPrice(),2)}&euro;</li>
                                                                        <li>Quantità: ${po.getQuantity()} pz</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-3 col-xs-6 text-right">
                                                                    <h4 class="list-group-item-heading">Spedito a:</h4>
                                                                    <ul class="list-unstyled list-group-item-text">
                                                                        <li><b>${po.getAddress().getFirstName()} ${po.getAddress().getLastName()}</b></li>
                                                                        <li>${po.getAddress().getAddress()}</li>
                                                                        <li>${po.getAddress().getZip()}, ${po.getAddress().getCity()}</li>
                                                                        <li>+39 ${po.getAddress().getTelephoneNumber()}</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-2 text-center">
                                                                    <div class="row">
                                                                        <button type="button" class="btn btn-default btn-block margin-btn">Consegna avvenuta!</button>
                                                                    </div>
                                                                    <div class="row">
                                                                        <button type="button" class="btn btn-default btn-block margin-btn" data-toggle="modal" data-target="#opendisputemodal">Apri disputa</button>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <!-- fine prodotto -->
                                                    </c:if>
                                                </c:forEach>
                                            </ul>

                                        </div>

                                    </div>
                                </div>
                                <!-- fine ordine -->
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>&nbsp;&nbsp;&nbsp;Non hai ancora effettuato alcun ordine</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="OrdiniCompletati" class="tab-pane fade">
                    <c:choose>
                        <c:when test="${not empty orders}">
                            <c:forEach items="${orders}" var="order">
                                <!-- inizio ordine -->
                                <div class="panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row text-left">
                                                <div class="col-md-4 text-left">
                                                    <h5>Ordine n: ${order.getOrderID()}</h5>
                                                </div>
                                                <div class="col-md-4 text-center">
                                                    <h5>Totale: ${Utils.getNDecPrice(order.getTotal(),2)}&euro;</h5>
                                                </div>
                                                <div class="col-md-4 text-right">
                                                    <h5>Effettuato il: ${order.getDate().toString()}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-collapse">
                                            <ul class="list-group">

                                                <c:forEach items="${order.getProductList()}" var="po">
                                                    <c:if test="${po.getStatus() == 1}">
                                                        <!-- inizio prodotto -->
                                                        <li class="list-group-item">
                                                            <a class="list-group-item">
                                                                <div class="media col-md-2">
                                                                    <figure class="pull-left">
                                                                        <img class="media-object img-rounded img-responsive" src="${po.getProduct().getImgBase64()}" alt="product image" height="" width="200px"> </figure>
                                                                </div>
                                                                <div class="col-md-5 col-xs-6">
                                                                    <h1 class="list-group-item-heading">${po.getProduct().getProductName()}</h1>
                                                                    <ul class="list-unstyled list-group-item-text">
                                                                        <li>Venditore: <b>${po.getProduct().getShopName()}</b></li>
                                                                        <li>Prezzo: ${Utils.getNDecPrice(po.getFinalPrice(),2)}&euro;</li>
                                                                        <li>Quantità: ${po.getQuantity()} pz</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-3 col-xs-6 text-right">
                                                                    <h4 class="list-group-item-heading">Spedito a:</h4>
                                                                    <ul class="list-unstyled list-group-item-text">
                                                                        <li><b>${po.getAddress().getFirstName()} ${po.getAddress().getLastName()}</b></li>
                                                                        <li>${po.getAddress().getAddress()}</li>
                                                                        <li>${po.getAddress().getZip()}, ${po.getAddress().getCity()}</li>
                                                                        <li>+39 ${po.getAddress().getTelephoneNumber()}</li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-2 text-center">
                                                                    <div class="row">
                                                                        <button type="button" class="btn btn-default btn-block margin-btn" onclick="openReviewModal(${order.orderID},${po.product.productID},${po.product.shopID})">Lascia una recensione</button>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <!-- fine prodotto -->
                                                    </c:if>
                                                </c:forEach>
                                            </ul>

                                        </div>

                                    </div>
                                </div>
                                <!-- fine ordine -->
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>&nbsp;&nbsp;&nbsp;Non hai ancora effettuato alcun ordine</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="opendisputemodal" tabindex="-1" role="dialog">
    <div class="row">
        <div id="opendisputecard" class="card card-signup centerize" data-background-color="orange">
            <form id="opendisputeform" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/opendispute">
                <div class="header header-primary text-center">
                    <h4 class="title title-up" >Apri Disputa</h4>
                </div>
                <div class="content">
                    <input id="orderIdDisputeModal" type="text" class="hidden" name="orderID" placeholder="">
                    <input id="productIdDisputeModal" type="text" class="hidden" name="productID" placeholder="">
                    <input id="shopIdDisputeModal" type="text" class="hidden" name="shopID" placeholder="">

                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="title" placeholder="Titolo...">
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="description" rows="5" placeholder="Descrivi anomalia...">
                    </div>
                </div>
                <div class="footer text-center" style="margin-top: 15px;">
                    <a class="btn btn-default" style="padding-left: 29px; padding-right: 29px;" onclick="$('#opendisputeform').submit();">Invia</a>
                    <a class="btn btn-default" style="margin-left: 20px; padding-left: 25px; padding-right: 25px;" onclick="$(function(){$('#opendisputemodal').modal('toggle');});">Chiudi</a>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="openreviewmodal" tabindex="-1" role="dialog">
    <div class="row">
        <div id="openreviewcard" class="card card-signup centerize" data-background-color="orange">
            <form id="openreviewform" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/openproductreview">
                <div class="header header-primary text-center">
                    <h4 class="title title-up" >Nuova Recensione</h4>
                </div>
                <div class="content">
                    <input id="orderIdReviewModal" type="text" class="hidden" name="orderID" placeholder="">
                    <input id="productIdReviewModal" type="text" class="hidden" name="productID" placeholder="">
                    <input id="shopIdReviewModal" type="text" class="hidden" name="shopID" placeholder="">

                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="title" placeholder="Titolo...">
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="description" rows="5" placeholder="Descrivi prodotto...">
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
<script src="../js/orderhistory.js"></script>

</body></html>
