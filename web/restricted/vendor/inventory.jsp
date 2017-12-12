<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="shop" class="main.Shop" scope="request"/>
<jsp:useBean id="shopproducts" class="java.util.HashMap" scope="request"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        Inventario del negozio
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inventory.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/vendor.js"></script>
    </jsp:attribute>

    <jsp:body>
    <div class="container">
        <div class="col-md-12">
            <div id="headingFilters" class="row">
                <div class="col-md-2 text-center">
                    <a id="btnAddProduct" class="btn btn-sm btn-block btn-success"><i class="fa fa-plus-circle fa-fw fa-lg pull-left"></i>Aggiungi Prodotto</a>
                </div>
            </div>
            <div id="stockRows" class="row">
                <c:forEach items="${shop.products}" var="product">
                    <div class="row stock">
                        <div class="col-md-3 stockPhoto">
                            <a href="#"><img src="http://via.placeholder.com/400x300" class="img-responsive"></a>
                        </div>
                        <div class="col-xs-6 col-md-7 stockInfo">
                            <h2 class="stockTitle">${product.productName}</h2>
                            <h5 class="stockQuantity">${product.quantity}</h5>
                            <h2 class="stockPrice">${product.price}</h2>
                        </div>
                        <div class="col-xs-6 text-right col-md-2 stockSettings">
                            <a class="btnEditInfo btn btn-sm btn-block btn-primary"><i class="fa fa-pencil-square-o fa-fw fa-lg pull-left"></i>Modifica Info</a>
                            <a class="btnEditPrice btn btn-sm btn-block btn-primary"><i class="fa fa-eur fa-fw fa-lg pull-left"></i>Modifica Prezzo</a>
                            <a class="btnEditQuantity btn btn-sm btn-block btn-primary"><i class="fa fa-hashtag fa-fw fa-lg pull-left"></i>Modifica Quantità</a>
                            <a class="btnReviews btn btn-lg btn-block btn-success"><i class="fa fa-comments-o fa-fw fa-lg pull-left"></i>Recensioni</a>
                            <a class="btnRemove btn btn-lg btn-block btn-danger"><i class="fa fa-times fa-fw fa-lg pull-left"></i>Rimuovi</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    </jsp:body>
</t:genericpage>

