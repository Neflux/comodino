<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.Utils" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="shop" class="main.Shop" scope="request"/>

<jsp:useBean id="reviewDao" class="daos.impl.ReviewDaoImpl"/>
<c:set var="reviewList" value="${reviewDao.getVendorProductReview(shop.shopID)}" scope="page"/>




<t:genericpage>
    <jsp:attribute name="pagetitle">
        Recensioni
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reviews.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/orderhistory.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 id="title" class="text-uppercase">Recensioni</h1>
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#RecensioniProdotti">Recensioni Prodotti</a></li>
                        <li><a data-toggle="tab" href="#RecensioniNegozio">Recensioni negozio</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="RecensioniProdotti" class="tab-pane fade in active">

                            <!-- inizio review -->
                            <c:choose>
                            <c:when test="${not empty reviewList}">
                            <c:forEach items="${reviewList}" var="review">
                                <div class="review">
                                    <h3>${review.title}</h3>
                                    <p>
                                        <c:set var="author" value="${reviewDao.getReviewAuthor(review.userID)}" scope="page"/>

                                        <c:set var="dateParts" value="${fn:split(review.creationDate, ' ')}" scope="page"/>
                                        <c:set var="date" value="${fn:split(dateParts[0], '-')}" scope="page"/>
                                        <c:set var="time" value="${fn:split(dateParts[1], ':')}" scope="page"/>

                                        <b>${author.firstName} ${author.lastName}</b> - <span style="font-size: small;">${date[2]}/${date[1]} &nbsp;h: ${time[0]}:${time[1]}</span>
                                        <!-- TODO fai funzione che restituisce array di autori-->
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
                        <!-- fine review -->

                        </c:when>
                        <c:otherwise>
                            <h3>&nbsp;&nbsp;&nbsp;Non ci sono recensioni</h3>
                        </c:otherwise>
                        </c:choose>
                        </div>
                        <div id="RecensioniNegozio" class="tab-pane fade">

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
    </jsp:body>
</t:genericpage>