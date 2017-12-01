<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" flush="true"/>

<jsp:useBean id="user" class="main.User" scope="session"/>
<c:set var="cart" value="${user.getCart(true)}" scope="page"/>
<jsp:useBean id="AddressDao" class="daos.impl.AddressDaoImpl"/>
<c:set var="addressList" value="${AddressDao.getAllAddresses(user)}" scope="page"/>
<jsp:useBean id="shopDao" class="daos.impl.ShopDaoImpl" scope="page"/>

<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="../css/checkout.css">
</head>
<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/restricted/setorderaddresses" method="post">
        <div class="row">
            <div class="col-md-12">
                <h1 class="display-1">Modalità di consegna</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="list-group">
                    <c:choose>
                        <c:when test="${not empty cart}">
                            <c:forEach items="${cart}" var="cartItem">
                                <li class="list-group-item">
                                    <div class="row pi-draggable" id="c_row-4col" draggable="true">
                                        <div class="col-md-9">
                                            <h1 class="itemtitle">${cartItem.key.productName} <small>x${cartItem.value}</small></h1>
                                            <p class="itemseller">Venduto da:
                                                <a href="${pageContext.request.contextPath}/shop.jsp?id=${cartItem.key.shopID}">${cartItem.key.shopName}</a>
                                            </p>
                                        </div>
                                        <c:if test="${shopDao.getShop(cartItem.key.shopID).getClass().simpleName == 'PhysicalShop'}">
                                            <div class="col-md-3 text-right">
                                                <%-- Ogni entry se checkata restituisce productID_shopID nel campo 'ritiro' del form--%>
                                                <h3 style="margin-top: 15px">Ritiro in negozio <input type="checkbox" name="ritironegozio" value="${cartItem.key.productID}_${cartItem.key.shopID}"></h3>
                                            </div>
                                        </c:if>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </div>
        <div class="row ">
            <div class="col-md-12 ">
                <div class="row ">
                    <div class="col-md-9">
                        <h2 style="margin-top: 0">I tuoi indirizzi di consegna</h2>
                    </div>
                    <div class="col-md-3 text-right">
                        <a href="<c:url value="/restricted/add_address.jsp"/>" class="btn btn-primary"><i
                                class="fa fa-fw fa-plus"></i> Aggiungi Nuovo Indirizzo</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <c:choose>
                    <c:when test="${not empty addressList}">
                        <c:forEach items="${addressList}" var="address" varStatus="status">
                            <div class="radio">&nbsp;
                                <label>
                                    <input ${status.first ? 'checked' : ''}
                                            type="radio"
                                            name="address" value="${address.addressID}">${address.firstName} ${address.lastName}, ${address.address}, ${address.zip} ${address.city}
                                </label>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 text-center">
                <a href="<c:url value="/restricted/cart.jsp"/>" class="btn btn-default">Indietro</a>
                <button type="submit" class="btn btn-primary">Prosegui <i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
            </div>
        </div>
    </form>
</div>
</body>
</html>