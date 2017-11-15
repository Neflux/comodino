<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="user" class="main.User" scope="session"/>


<c:if test="${not user.hasShop()}">
    <c:redirect url="profile.jsp?error=L'utente non possiede negozi"/>
</c:if>

<jsp:include page="header.jsp" flush="true" />

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/vendor.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:useBean id="shop" class="main.Shop" scope="session"/>
<div style="margin-top:+35px !important;" class="container">
    <div class="row">
        <div class="col-md-4" id="navbar">
            <div class="col-md-12">
                <a id="shopPhoto" href="#"><img src="http://via.placeholder.com/1000x1000" class="img-responsive"></a>
                <h1 id="shopTitle" class="text-center">${shop.name}</h1>
                <h4 id="shopEmailWebsite" class="text-center text-info"><a href="${shop.website}"></a></h4>
                <p>${shop.description}</p>
                <div class="row text-center">

                    <%
                        int i = 0;
                        for(; i < shop.getRating();i++){
                    %>
                    <i class="fa fa-lg fa-star" aria-hidden="true"></i>
                    <%
                        }
                        for(; i < 5 ;i++){
                    %>
                    <i class="fa fa-lg fa-star-o" aria-hidden="true"></i>
                    <%
                        }
                    %>
                    <a href="#">Vedi tutte</a>
                </div>
                <div id="addShopDiv" class="row">
                    <div class="col-md-10">
                        <h2 id="realShop">Negozio fisico</h2>
                    </div>
                    <div class="col-md-7">
                        <a id="btnAddShopLocation" class="btn btn-default">Aggiungi negozio fisico</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1" id="mySpace">
        </div>
        <div class="col-md-7" id="mainContent">
            <div class="row" id="panelContainer">
                <div class="col-md-4" id="photoPanel">
                    <div class="col-md-12">
                        <a href="#"><img src="http://via.placeholder.com/400x300" class="img-responsive"></a>
                        <a id="btnAddPhoto" class="btn btn-block btn-primary"><i class="fa fa-fw pull-left fa-camera"></i>Aggiungi foto</a>
                        <a id="btnShopSettings" class="btn btn-block btn-primary"><i class="fa fa-fw pull-left fa-book"></i>Modifica negozio</a>
                    </div>
                </div>
                <div class="col-md-1" id="mySpace2">
                </div>
                <div class="col-md-6" id="buttonPanel">
                    <div class="row">
                        <div class="col-md-6">
                            <a id="btnInventario" class="btn-lg btn-block btn-success btnUpper"><i class="fa fa-cube fa-fw fa-lg pull-left"></i>Inventario</a>
                        </div>
                        <div class="col-md-6">
                            <a id="btnOrderList" class="btn-lg btn-block btn-success btnUpper"><i class="fa fa-fw fa-lg fa-list-ul pull-left"></i>Ordini</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <a id="btnReviews" class="btn-lg btn-block btn-success btnLower"><i class="fa fa-comments-o fa-fw fa-lg pull-left"></i>Recensioni</a>
                        </div>
                        <div class="col-md-6">
                            <a id="btnDispute" class="btn-lg btn-block btn-success btnLower"><i class="fa fa-fw fa-lg fa-warning pull-left"></i>Dispute</a></div>
                    </div>
                </div>
            </div>
            <div class="row" id="productsLeftContainer">
                <div class="col-md-12">
                    <div class="row">
                        <h1 id="productsLeftTitle">Prodotti in esaurimento</h1>
                    </div>
                    <div class="row" id="productsLeftRows">

                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>
                        <div class="row productRow">
                            <div class="col-md-10">
                                <div class="row">
                                    <div class="productNameDiv col-md-6">
                                        <h5 class="productName text-left">Sdraio di cartapesta</h5>
                                    </div>
                                    <div class="itemsLeftDiv col-md-6">
                                        <h5 class="itemsLeft text-right">Pezzi rimanenti: 4</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 text-center">
                                <a class="showProduct btn-sm btn-default">Vedi</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/vendor.js"></script>
</body>
</html>