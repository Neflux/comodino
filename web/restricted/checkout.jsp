<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp" flush="true"/>

<jsp:useBean id="user" class="main.User" scope="session"/>
<c:set var="cart" value="${user.getCart(true)}" scope="page"/>
<jsp:useBean id="AddressDao" class="daos.impl.AddressDaoImpl"/>
<c:set var="addressList" value="${AddressDao.getAllAddresses(user)}" scope="page"/>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/checkout.css">
</head>
<body>
<div class="container">
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
                        <c:forEach items="${cart}" var="item">
                            <li class="list-group-item">
                                <div class="row pi-draggable" id="c_row-4col" draggable="true">
                                    <div class="col-md-9">
                                        <h1 class="itemtitle">${item.getKey().getProductName()}</h1>
                                        <p class="itemseller">Venduto da:
                                            <a href="">${item.getKey().getShopName()}</a>
                                        </p>
                                    </div>
                                        <%--<c:if test="${getShop(item.getKey().getShopID()).getClass().simpleName == 'PhysicalShop'}"/>--%>
                                    <div class="col-md-3 text-right">
                                        <h3 style="margin-top: 15px">Ritiro in negozio <input type="checkbox"></h3>
                                    </div>
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
                    <c:forEach items="${addressList}" var="item" varStatus="status">
                        <div class="radio">&nbsp;
                            <label>
                                <input ${status.first ? 'checked' : ''}
                                        type="radio"
                                        name="optradio">${item.firstName} ${item.lastName}, ${item.address}, ${item.zip} ${item.city}
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
            <a href="<c:url value="/restricted/payment.jsp"/>" class="btn btn-primary">Prosegui <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
        </div>
    </div>
</div>
</body>
</html>