<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="utils.Utils" %>

<!DOCTYPE html>
<html>
<head>
    <title>Ordini</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
    <link href="../css/orderhistory.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="orderDao" class="daos.impl.OrderDaoImpl"/>
<c:set var="orders" value="${orderDao.getAllOrders(user)}" scope="page"/>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 id="title" class="text-uppercase">Lista ordini:</h1>
            <!--ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="#" class="nav-link active"><i class="fa fa-home"></i>&nbsp;Tutti gli ordini</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Ordini in corso</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ordini Completati</a>
                </li>
            </ul-->
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
                                                                            <button type="button" class="btn btn-default btn-block margin-btn">Apri disputa</button>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:when test="${po.getStatus() == 1}">

                                                                        <div class="row">
                                                                            <h3>Ordine<br>Completato</h3>
                                                                        </div>
                                                                        <div class="row">
                                                                            <button type="button" class="btn btn-default btn-block margin-btn">Lascia una recensione</button>
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
                                                                        <button type="button" class="btn btn-default btn-block margin-btn">Apri disputa</button>
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
                                                                        <button type="button" class="btn btn-default btn-block margin-btn">Lascia una recensione</button>
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
            <!--div class="list-group">
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> Lampada Grosa </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> List group heading </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> List group heading </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
          </div-->
        </div>
    </div>
</div>
</body></html>
