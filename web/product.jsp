<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${sessionScope.user != null}">
    <jsp:include page="/restricted/header.jsp" flush="true"/>
</c:if>
<c:if test="${sessionScope.user == null}">
    <jsp:include page="/header_anonimo.jsp" flush="true"/>
</c:if>

<html lang="it">
<head>
    <link href="css/product.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:useBean id="product" class="main.Product" scope="request"/>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="carousel slide article-slide" id="article-photo-carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner cont-slider">
                    <div class="item active">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                    <div class="item">
                        <img alt="" title="" src="http://placehold.it/600x400">
                    </div>
                </div>
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li class="active" data-slide-to="0" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="1" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="2" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                    <li class="" data-slide-to="3" data-target="#article-photo-carousel">
                        <img alt="" src="http://placehold.it/250x180">
                    </li>
                </ol>
            </div>
        </div>
        <div class="col-md-6">
            <h1>${product.productName}</h1>
            <h2>${product.price}</h2>
            <h2>Rating</h2>
            <h2>Venduto da
                <a href="#">venditore</a>
            </h2>
            <a class="btn btn-primary"><i class="fa fa-fw fa-home pull-left"></i>Visualizza venditori nelle
                vicinanze</a>
            <p>descrizione akshalnscxaljhconalknc aonxkan xlkn</p>
            <h2>Disponibilità:
                <span>42</span>
            </h2>
            <a class="btn btn-primary"><i class="fa fa-fw pull-left fa-shopping-cart"></i>Aggiungi al carrello</a>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 30px">
    <div class="row">
        <div class="col-md-12">
            <h1>Recensioni</h1>
            <h2>Rating</h2>
        </div>
    </div>
    <div class="review" style="box-shadow: 0 2px 35px rgba(0,0,0,.15);">
        <h3>Data - Titolo</h3>
        <p>
            <b>Autore</b>
        </p>
        <p>
            <b>Rating</b>
        </p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
            magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
            commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
            nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
            anim id est laborum</p>
    </div>
</div>


</body>
</html>