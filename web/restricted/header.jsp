<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="categoryDao" class="daos.impl.CategoryDaoImpl"/>
<c:set var="categories" value="${categoryDao.getCategories()}" scope="page"/>

<html><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="../css/bootstrap.css" media="screen">
    <script src="https://use.fontawesome.com/f98c8dd683.js"></script>
    <link rel="stylesheet" href="../css/custom.min.css">
    <link rel="stylesheet" href="../css/my.css">
    <link rel="stylesheet" href="../css/header.css">
</head>
<body>

<jsp:useBean id="user" class="main.User" scope="session"/>
<!--jsp:useBean id="notifications" class="java.util.ArrayList"/-->
<jsp:useBean id="notificationdao" class="daos.impl.NotificationDaoImpl"/>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="../css/logo.svg"/>
                <c:if test="${!user.hasShop() && user.type == 0}">
                    <span id="headertitle">Comodino.it</span>
                </c:if>
            </a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <c:if test="${user.hasShop()}">
                    <c:set var="vendor_notifications" value="${notificationdao.getVendorNotifications(user)}" scope="page"/>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                ${fn:length(vendor_notifications)}&nbsp;&nbsp;<i class="fa fa-truck" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Notifiche Venditore</li>
                            <c:choose>
                                <c:when test="${fn:length(vendor_notifications) == 0}">
                                    <li><a>Nessuna nuova notifica</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${vendor_notifications}" var="n">
                                        <li>
                                            <a>Notifica:<br>Data: ${n.creationDate}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Vedi tutte</a></li><!-- TODO: inserire link pagina/sistemare formattazione notifiche -->
                        </ul>
                    </li>
                </c:if>
                <c:if test="${user.type == 1}">
                    <c:set var="admin_notifications" value="${notificationdao.getAdminNotifications()}" scope="page"/>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                ${fn:length(admin_notifications)}&nbsp;&nbsp;<i class="fa fa-hand-o-up" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">Notifiche Admin</li>
                            <c:choose>
                                <c:when test="${fn:length(admin_notifications) == 0}">
                                    <li><a>Nessuna nuova notifica</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${admin_notifications}" var="n">
                                        <li>
                                            <a>Disputa:<br>Order: ${n.orderId} Product: ${n.productId} Shop: ${n.shopId}<br>Data: ${n.creationDate}</a>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Vedi tutte</a></li><!-- TODO: inserire link pagina/sistemare formattazione notifiche -->
                        </ul>
                    </li>
                </c:if>
            </ul>
            <div class="nav navbar-nav navbar-center">
                <form class="navbar-form navbar-search" role="search" type="GET" action="${pageContext.request.contextPath}/search">
                    <div class="input-group">

                        <div class="input-group-btn">
                            <button type="button" class="btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="label-icon">Categoria</span>
                                &nbsp;&nbsp;<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu pull-left" role="menu">
                                <li><a href="#">Tutte le categorie</a></li>
                                <c:forEach items="${categories}" var="cat">
                                    <li><a  href="#">${cat.categoryName}</a></li>
                                    <input id="${fn:replace(cat.categoryName,' ', '')}-radio" name="cat" value="${cat.categoryName}" type="radio" hidden>
                                </c:forEach>
                            </ul>

                        </div>

                        <input name="q" class="form-control" type="text" placeholder="Cerca" autofocus>

                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-search btn-default">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <!--form class="navbar-form" type="GET" action="${pageContext.request.contextPath}/search">
                        <div class="btn btn-default btn-left dropdown">
                            <a href="#" class="dropdown-toggle navbar-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categorie&nbsp;&nbsp;<span class="caret"></span></a>

                            <ul class="dropdown-menu">
                                <li><a href="#">Tutte le Categorie</a></li>
                                <c:forEach items="${categories}" var="cat">
                                    <li><a href="#">${cat.categoryName}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control no-border" name="q" placeholder="Cerca" required>
                        </div>
                        <button type="submit" class="btn btn-default btn-right"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form-->

            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp; ${user.firstName} ${user.lastName}  <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu centered">
                        <li class="dropdown-header">Il mio profilo</li>
                        <li><a href="${pageContext.request.contextPath}/restricted/profile.jsp">Il mio account</a></li>
                        <li><a href="${pageContext.request.contextPath}/restricted/orderhistory.jsp">I miei ordini</a></li>
                        <c:if test="${user.hasShop()}">
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Negozio</li>
                            <li><a href="#">Pannello inventario</a></li>
                            <li><a href="#">Riepilogo vendite</a></li>
                        </c:if>
                        <c:if test="${user.type == 1}">
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Admin</li>
                            <li><a href="${pageContext.request.contextPath}/restricted/admin_panel.jsp">Pannello principale</a></li>
                            <li><a href="#">Gestione dispute</a></li>
                        </c:if>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/restricted/logout">Esci</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="cartdrop" onclick="openCart();" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="badge">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i> ${user.getCart(false).size()}
                        </span>
                        &nbsp;&nbsp;Carrello <span class="caret"></span>
                    </a>
                    <ul id="cartheader" class="dropdown-menu right">
                        <!-- ORA L'INTERNO DEL CARRELLO è GESTITO CON AJAX-->
                        <c:if test="${user.getCart(false).size() == 0}">
                            <li class="text-center"><a>Carrello vuoto...</a></li>
                        </c:if>
                        <c:forEach var="cartItem" items="${user.getCart(false)}">
                            <li><a href="#">${cartItem.getKey().getProductName()} N: ${cartItem.getValue()}</a></li>
                        </c:forEach>
                        <li class="divider"></li>
                        <li class="text-center"><a href="${pageContext.request.contextPath}/restricted/cart.jsp">Vedi carrello <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/custom.js"></script>
<script src="../js/now-ui-kit.js"></script>
<script src="../js/header.js"></script>
</body></html>
