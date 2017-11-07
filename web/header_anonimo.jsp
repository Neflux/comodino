<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="categoryDao" class="daos.impl.CategoryDaoImpl"/>
<c:set var="categories" value="${categoryDao.getCategories()}" scope="page"/>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/custom.min.css">
    <script src="https://use.fontawesome.com/f98c8dd683.js"></script>
    <link rel="stylesheet" href="css/my.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="./css/logo.svg"/>
                <span id="headertitle">Comodino.it</span>
            </a>
        </div>
        <div class="navbar-collapse collapse">
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
                <li>
                    <a href="#" role="button" data-toggle="modal" data-target="#LoginSignup">
                        <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp;Login | Sign Up
                    </a>
                </li>
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
                        <input type="text" class="form-control" name="firstname" placeholder="Nome...">
                    </div>
                    <div class="input-group form-group-no-border nologin" style="opacity: 0; ">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="lastname" placeholder="Cognome...">
                    </div>
                    <div class="input-group form-group-no-border login">
                          <span class="input-group-addon">
                              <i class="fa fa-envelope-o green" aria-hidden="true"></i>
                          </span>
                        <input type="text" class="form-control" name="email" placeholder="Email..." autofocus>
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-key green" aria-hidden="true"></i>
                          </span>
                        <input type="password" placeholder="Password..." name="password" class="form-control">
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
                    <a class="btn btn-default" style="padding-left: 29px; padding-right: 29px;" onclick="$('#form').submit();">Entra</a>
                    <a class="btn btn-default" style="margin-left: 20px; padding-left: 25px; padding-right: 25px;" onclick="$(function(){$('#LoginSignup').modal('toggle');});">Chiudi</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/custom.js"></script>
<script src="./js/now-ui-kit.js"></script>
<script src="js/header.js"></script>
</body></html>
