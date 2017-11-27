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
<div class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Brand</span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active">
                    <a href="#">Home</a>
                </li>
                <li>
                    <a href="#">Contacts</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container main">
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
                                    <div class="col-md-6">
                                        <h1 class="itemtitle">${item.getKey().getProductName()}</h1>
                                        <p class="itemseller">Venduto da:
                                            <a href="">${item.getKey().getShopName()}</a>
                                        </p>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-10" style="padding: 0">
                                            <h2 class="text-right" style="margin-top: 10px">Ritiro in negozio</h2>
                                        </div>
                                        <div class="col-md-2">
                                            <input type="checkbox" style="margin-top: 25px">
                                        </div>
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
                <div class="col-md-6">
                    <h1>I tuoi indirizzi di consegna</h1>
                </div>
                <div class="col-md-6 text-right">
                    <a class="btn btn-primary" style="margin-top: 25px; border-radius: 8px"><i
                            class="fa fa-fw fa-lg fa-plus"></i>Aggiungi nuovo indirizzo</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="margin: 0">
        <div class="row">
            <div class="col-md-12">
                <c:choose>
                    <c:when test="${not empty addressList}">
                        <c:forEach items="${addressList}" var="item" varStatus="status">
                            <div class="radio">&nbsp;
                                <label>
                                    <input ${status.first ? 'checked' : ''}
                                            type="radio"
                                            name="optradio">${item.firstName} ${item.lastName}, ${item.address}, ${item.city}${item.zip}
                                </label>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <a class="btn btn-primary"
               style="height: 50px; background-color: grey; float: right; font-size: 20px; border-radius: 8px">Indietro</a>
        </div>
        <div class="col-md-6">
            <a class="btn btn-primary"
               style="height: 50px; background-color: #99CC33; font-size: 20px; border-radius: 8px">Prosegui</a>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js
                                " integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN
                                " crossorigin="anonymous "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js
                                " integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4
                                " crossorigin="anonymous "></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js
                                " integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1
                                " crossorigin="anonymous "></script>
</body>
</html>