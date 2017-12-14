<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="utils.Utils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Inventario - ${shop.name}
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventory.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div id="inventory" class="container">
            <h1>Inventario:</h1>
            <ul class="list-group">
                <c:forEach items="${shop.products}" var="product">

                    <!-- inizio prodotto -->
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-lg-2 col-md-2">
                                <img class="img-rounded img-responsive" src="${product.imgBase64[0]}" alt="product image">
                            </div>
                            <div class="col-lg-5 col-md-3 col-xs-12">
                                <h3 class="list-group-item-heading"><a class="resetcolor" href="${pageContext.request.contextPath}/product.jsp?product=${product.productID}&shop=${product.shopID}">${product.productName}</a></h3>
                                <ul class="list-unstyled list-group-item-text">
                                        <c:choose>
                                            <c:when test="${product.price == product.actualPrice}">
                                            <li><h4>Prezzo: ${Utils.getNDecPrice(product.price,2)}&euro;</h4></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li><h4>Prezzo: <del>${Utils.getNDecPrice(product.price, 2)}&euro;</del> ${Utils.getNDecPrice(product.actualPrice,2)}&euro;</h4></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li>Diponibilità: <b>${product.quantity} pezzi &nbsp;</b>
                                    <c:if test="${product.quantity < 20}">
                                        <span class="badge badge-discount">In esaurimento!</span>
                                    </c:if>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-2 col-md-3 col-xs-12 text-center">
                                <div class="buttons">
                                    <div class="row">
                                        <button type="button" class="btn btn-default btn-block margin-btn" onclick=""><i class="fa fa-pencil-square-o fa-fw fa-lg pull-left"></i>Modifica Info</button>
                                    </div>
                                    <div class="row">
                                        <button type="button" class="btn btn-default btn-block margin-btn" onclick=""><i class="fa fa-eur fa-fw fa-lg pull-left"></i>Modifica Prezzo</button>
                                    </div>
                                    <div class="row">
                                        <button type="button" class="btn btn-default btn-block margin-btn" onclick=""><i class="fa fa-hashtag fa-fw fa-lg pull-left"></i>Modifica Disponibilità</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-xs-12 col-md-offset-1 col-lg-offset-1 text-center">
                                <div class="buttons">
                                    <div class="row">
                                        <button type="button" class="btn btn-primary btn-block margin-btn" onclick=""><i class="fa fa-comments-o fa-fw fa-lg pull-left"></i>Recensioni</button>
                                    </div>
                                    <div class="row">
                                        <button type="button" class="btn btn-danger btn-block margin-btn" onclick=""><i class="fa fa-trash fa-fw fa-lg pull-left"></i>Rimuovi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- fine prodotto -->
                </c:forEach>
            </ul>
        </div>
    </jsp:body>
</t:genericpage>

