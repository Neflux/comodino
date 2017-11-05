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
            <c:choose>
                <c:when test="${product.price != product.actualPrice}">
                    <h2><span class="strikethrough">${product.price} €</span>&nbsp<span class="text-right">${product.actualPrice} €</></h2>
                </c:when>
                <c:otherwise>
                    <h2>${product.price} €</h2>
                </c:otherwise>
            </c:choose>
            <h2><%
                //int rc = (int)product.getReviewCount();
                //String review = ((rc>0)?((rc>1)?rc+" recensioni":"1 recensione"):"Nessuna recensione");
                int i = 0;
                for(; i < product.getRating();i++){
            %>
                <i class="fa fa-star rating_star" aria-hidden="true"></i>
                <%
                    }
                    for(; i < 5 ;i++){
                %>
                <i class="fa fa-star-o rating_star" aria-hidden="true"></i>
                <%
                    }
                %>&nbsp&nbsp<span class="text-right"><%=product.getRating()%></>

            </h2>

            <h2>Venduto da <a href="#">${product.shopName}</a></h2>
            <a class="btn btn-primary"><i class="fa fa-fw fa-home pull-left"></i>Visualizza venditori nelle
                vicinanze</a>
            <p><br>${product.description}</p>
            <c:choose>
                <c:when test="${product.quantity > 0}">
                    <h2>Disponibilità: <span>${product.quantity}</span></h2>
                </c:when>
                <c:otherwise>
                    <h2>Il prodotto non è al momento disponibile.</h2>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="javascript:void(0);" class="btn btn-primary" onclick="addToCart('<%=product.getProductID()%>','<%=product.getShopID()%>');"><i class="fa fa-fw pull-left fa-shopping-cart"></i>Aggiungi al carrello</a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-primary" href="#"><i class="fa fa-fw pull-left fa-shopping-cart"></i>Aggiungi al carrello</a>
                </c:otherwise>
            </c:choose>
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
<script type="text/javascript" src="js/search/product.js"></script>

</html>