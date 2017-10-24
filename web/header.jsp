<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="main.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.Product" %>
<%@ page import="javafx.util.Pair" %>

<html><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="./css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="./css/custom.min.css">
    <script src="https://use.fontawesome.com/f98c8dd683.js"></script>
    <link rel="stylesheet" href="./css/my.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<%
    User usr = (User) session.getAttribute("user");
%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="./css/logo.svg"/>
                <%
                    if (usr == null || usr.getEmail().isEmpty()) {
                %>
                <span id="headertitle">Comodino.it</span>
                <%
                    }
                %>
            </a>
        </div>
        <div class="navbar-collapse collapse">
            <%
                if ((usr != null) && !usr.getEmail().isEmpty()) {
            %>
            <ul class="nav navbar-nav navbar-left">
                <%
                    if (usr.hasShop()){
                %>
                <li><a href="#">65&nbsp;&nbsp;<i class="fa fa-truck" aria-hidden="true"></i></a></li>
                <%
                    }
                %>
                <li><a href="#">23&nbsp;&nbsp;<i class="fa fa-hand-o-up" aria-hidden="true"></i></a></li>

            </ul>
            <%
                }
            %>
            <ul class="nav navbar-nav navbar-center">
                <li>
                    <form class="navbar-form" type="GET" action="${pageContext.request.contextPath}/search">
                        <div class="btn btn-default btn-left dropdown">
                            <a href="#" class="dropdown-toggle navbar-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categorie&nbsp;&nbsp;<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                            </ul>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control no-border" name="q" placeholder="Cerca" required>
                        </div>
                        <button type="submit" class="btn btn-default btn-right"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%
                    if (usr == null || usr.getEmail() == null) {
                %>
                <li>
                    <a href="#" role="button" data-toggle="modal" data-target="#LoginSignup">
                        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp;Login | Sign Up
                    </a>
                </li>
                <%
                }else {
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp; <%=usr.getFirstName()%> <%=usr.getLastName()%> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu centered">
                        <li class="dropdown-header">Il mio profilo</li>
                        <li><a href="profile.jsp">Il mio account</a></li>
                        <li><a href="orderhistory.jsp">I miei ordini</a></li>
                        <%
                            if(usr.hasShop()){
                        %>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Negozio</li>
                        <li><a href="#">Inventario</a></li>
                        <li><a href="#">Riepilogo vendite</a></li>
                        <%
                            }
                        %>
                        <li role="separator" class="divider"></li>
                        <li><a href="logout">Esci</a></li>
                    </ul>
                </li>
                <%
                    ArrayList<Pair<Product, Integer>> cart = usr.getCart();
                %>
                <li class="dropdown">
                    <a id="cartdrop" onclick="openCart();" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="badge">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i> <%=cart.size()%>
                        </span>
                        &nbsp;&nbsp;Carrello <span class="caret"></span>
                    </a>
                    <ul id="cartheader" class="dropdown-menu right">
                        <!-- ORA L'INTERNO DEL CARRELLO è GESTITO CON AJAX-->
                        <%
                            if (cart.size() == 0){
                                %>
                        <li class="text-center"><a>Carrello vuoto...</a></li>
                        <%
                            }
                            for (Pair<Product, Integer> cartItem:cart) {
                        %>
                        <li><a href="#"><%=cartItem.getKey().getProductName()%> N: <%=cartItem.getValue()%></a></li>
                        <%
                            }
                        %>
                        <li class="divider"></li>
                        <li class="text-center"><a href="${pageContext.request.contextPath}/cart.jsp">Vedi carrello >></a></li>
                    </ul>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="LoginSignup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="row">
        <div class="card card-signup centerize" data-background-color="orange" id="signup_login_card">
            <form class="form" method="POST" action="${pageContext.request.contextPath}/login" id="form">
                <div class="header header-primary text-center">
                    <h4 class="title title-up" id="card_titolo" style="margin-bottom: -40px; margin-top: 20px;">Login</h4>
                </div>
                <div class="content">
                    <div class="input-group form-group-no-border nologin" style="opacity: 0;margin-top: -50px;">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="FirstName" placeholder="Nome...">
                    </div>
                    <div class="input-group form-group-no-border nologin" style="opacity: 0; ">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="LastName" placeholder="Cognome...">
                    </div>
                    <div class="input-group form-group-no-border login">
                          <span class="input-group-addon">
                              <i class="fa fa-envelope-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="email" placeholder="Email...">
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-key green" aria-hidden="true"></i>
                          </span>
                        <input type="password" placeholder="Password..." name="password" class="form-control" />
                    </div>
                    <div class="row text-center" style="margin-top: 15px">
                        <span class="white" id="card_change_button">Non hai ancora un account? <a onclick="show_signup();">Registrati</a></span>
                    </div>
                    <!-- If you want to add a checkbox to this form, uncomment this code -->
                    <!-- <div class="checkbox">
                        <input id="checkboxSignup" type="checkbox">
                          <label for="checkboxSignup">
                          Unchecked
                          </label>
                          </div> -->
                </div>
                <div class="footer text-center" style="margin-top: 15px;">
                    <a class="btn btn-default" style="padding-left: 29px; padding-right: 29px;" onclick="$('#form').submit();">Entra</a><a class="btn btn-default" style="margin-left: 20px; padding-left: 25px; padding-right: 25px;" onclick="$(function(){$('#LoginSignup').modal('toggle');});">Chiudi</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/custom.js"></script>
<script src="./js/now-ui-kit.js"></script>
<script src="./js/signup_login/signup_login_actions.js"></script>
<script src="js/header.js"></script>
</body></html>
