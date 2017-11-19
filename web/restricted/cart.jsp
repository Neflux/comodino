<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.Utils" %>
<%@ page contentType="text/html;charset=UTF-8"%>


<html><head>
    <title>Il mio carrello</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css/cart.css">

</head>
<body>
<jsp:include page="header.jsp" flush="true"/>


<jsp:useBean id="user" class="main.User" scope="session"/>
<c:set var="cart" value="${user.getCart(true)}" scope="page"/>
<c:set var="total" value="0" scope="page"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 class="display-1">Riepilogo Carrello</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <ul id="cartlist" class="list-group">
                <c:choose>
                <c:when test="${not empty cart}">
                    <c:forEach items="${cart}" var="item">
                        <c:set var="total" value="${total + item.getKey().getActualPrice() * item.getValue()}" scope="page"/>
                <li id="${item.getKey().getProductID()}_${item.getKey().getShopID()}" class="list-group-item">
                    <div class="cart-item">
                        <div id="c_row-4col" class="row pi-draggable" draggable="true">
                            <div class="col-md-2 itemimg" id="prodimg">
                                <img class="img-fluid d-block my-2" src="${item.getKey().getImgBase64()}">
                            </div>
                            <div class="col-md-8">
                                <h1 class="itemtitle">${item.getKey().getProductName()}</h1>
                                <p id="c_lead" class="lead pi-draggable itemseller" draggable="true">Venduto da:&nbsp;
                                    <a href="#" style="font-size: 18px">${item.getKey().getShopName()}</a>
                                </p>
                                <h2 class="itemprice" id="price_${item.getKey().getProductID()}">${Utils.getNDecPrice(item.getKey().getActualPrice(),2)}&euro;</h2>
                            </div>
                            <div class="col-md-1">
                                <div class="itemquantity">
                                    <p>Quantità:</p>
                                    <div class="quantity">
                                        <input type="number" min="1" step="1" value="${item.getValue()}" id="quantity_${item.getKey().getProductID()}">
                                        <div class="quantity-nav">
                                            <div class="quantity-button quantity-up" onclick="updatePrice(${item.getKey().getProductID()},'+',${item.getKey().getShopID()});">+</div>
                                            <div class="quantity-button quantity-down" onclick="updatePrice(${item.getKey().getProductID()},'-',${item.getKey().getShopID()});">-</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 text-center">
                                <div class="btn btn-danger btn-xs cestino" onclick="removeItem(${item.getKey().getProductID()}, ${item.getKey().getShopID()})">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
                </c:when>
                    <c:otherwise>
                <li class="list-group-item text-center nessunbordo"><h3>Il carrello è vuoto, aggiungi qualche prodotto!</h3></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="padding-right: 30px">
            <h1 class="total" id="total" style="text-align: right; margin: 5px 0">Totale: ${Utils.getNDecPrice(total,2)}&euro;</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 text-center">
                    <c:choose>
                        <c:when test="${total > 0}">
                            <a class="btn btn-primary btn-xs" href="#" id="nextbtn">Procedi all'acquisto <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-primary btn-xs" href="<c:url value="/index.jsp"/>">Vai alla homepage</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/cart.js"></script>
</body>
</html>