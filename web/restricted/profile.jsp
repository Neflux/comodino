<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<jsp:useBean id="user" class="main.User" scope="session"/>



<jsp:include page="header.jsp" flush="true"/>


<html lang="it">
<head>
    <title>Profilo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/profile.js"></script>
    <link href="../css/user_profile.css" rel="stylesheet" type="text/css">
</head>
<body>

<c:if test="${param.action == 'password_changed'}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Password modificata con successo!
    </div>
</c:if>
<c:if test="${param.action == 'wrong_password'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Password attuale errata o mancante!
    </div>
</c:if>
<c:if test="${param.action == 'password_not_match'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Le password non corrispondono!
    </div>
</c:if>

<c:if test="${param.action == 'info_updated'}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Info modificate con successo!
    </div>
</c:if>
<c:if test="${param.action == 'info_error'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Info non modificate!
    </div>
</c:if>
<c:if test="${param.action == 'privacy_accepted'}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Privacy accettata!
    </div>
</c:if>
<c:if test="${param.action == 'privacy_not_accepted'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        È necessario accettare la privacy!
    </div>
</c:if>
<!-- general error, see passed parameter -->
<c:if test="${not empty param.error}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ERRORE: ${param.error}
    </div>
</c:if>
<div class="container">
    <div class="row" style="margin: 0 0 10px 0;">
        <div class="col-md-12 text-center">
            <img id="profile_pic" src="http://icons.iconarchive.com/icons/paomedia/small-n-flat/512/user-male-icon.png" class="center-block img-circle img-responsive">
            <h1 class="text-center text-uppercase">
                <jsp:getProperty name="user" property="firstName"/> <jsp:getProperty name="user" property="lastName"/><br>
                <small class="text-capitalize">
                    <c:choose>
                        <c:when test = "${user.type == 1}">
                            Amministratore
                        </c:when>
                        <c:when test = "${user.hasShop()}">
                            Venditore
                        </c:when>
                    </c:choose>
                </small>
            </h1>
        </div>
    </div>
    <c:if test="${user.privacy == 0}">
    <div class="row" style="margin: 0 0 15px 0;">
        <div class="col-md-4 col-md-offset-4">
            <a class="btn btn-block btn-warning text-capitalize" href="${pageContext.request.contextPath}/restricted/acceptprivacy"><i class="fa fa-fw fa-lock pull-left"></i>Accetta privacy</a>
        </div>
    </div>
    </c:if>
    <div class="row" style="margin: 0 0 15px 0;">
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" data-toggle="modal" data-target="#changePwd"><i class="fa fa-fw fa-lock pull-left"></i>Modifica Password</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" data-toggle="modal" data-target="#editInfo"><i class="fa fa-fw fa-user pull-left"></i>Modifica Dati</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" href="#"><i class="fa fa-fw fa-map-marker pull-left"></i>Modifica Indirizzo Spedizione</a>
        </div>
    </div>
    <div class="row" style="margin: 0 0 15px 0;">
        <div class="col-md-4">
            <a class="btn btn-block btn-success text-capitalize" href="${pageContext.request.contextPath}/restricted/orderhistory.jsp"><i class="fa fa-fw pull-left fa-shopping-cart"></i>I miei ordini</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-success text-capitalize" href=" #"><i class="fa fa-fw pull-left fa-warning"></i>Dispute</a>
        </div>
        <div class="col-md-4">
            <c:choose>
                <c:when test="${user.shopID > 0}">
                    <a class="btn btn-block btn-success text-capitalize" href="shop_panel.jsp"><i class="fa fa-fw pull-left fa-home"></i>Negozio</a>
                </c:when>
                <c:otherwise>
                    <a class="btn btn-block btn-success text-capitalize" href="profile.jsp?error=Ancora da fare"><i class="fa fa-fw pull-left fa-home"></i>Apri negozio</a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>


<!-- changePwd -->
<div class="modal fade" id="changePwd" tabindex="-1" role="dialog" aria-labelledby="changePwdLabel">
    <div class="row">
        <div class="card card-signup centerize" data-background-color="orange">
            <form id="changePwdForm" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/changepassword">
                <div class="header header-primary text-center">
                    <h4 class="title title-up">Cambia la password</h4>
                </div>
                <div class="content">
                    <div class="input-group form-group-no-border nologin">
                          <span class="input-group-addon">
                              <i class="fa fa-lock green" aria-hidden="true"></i>
                          </span>
                        <input id="CurrentPassword" name="CurrentPassword" type="password" class="form-control"  placeholder="Password attuale...">
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-key green" aria-hidden="true"></i>
                          </span>
                        <input id="NewPassword" name="NewPassword" type="password" onkeyup="checkPass();return false;" class="form-control" placeholder="Nuova password..."/>
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i id="PwdCheck" class="fa fa-repeat green" aria-hidden="true"></i>
                          </span>
                        <input id="RepeatPassword" name="RepeatPassword" type="password" onkeyup="checkPass();return false;" class="form-control" placeholder="Ripeti password..."/>
                    </div>
                </div>
                <div class="footer text-center">
                    <a id="submitPwd" class="btn btn-default" onclick="$('#changePwdForm').submit();">Cambia</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- editInfo -->
<div class="modal fade" id="editInfo" tabindex="-1" role="dialog" aria-labelledby="editInfoLabel">
    <div class="row">
        <div class="card card-signup centerize" data-background-color="orange">
            <form id="editInfoForm" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/editinfo">
                <div class="header header-primary text-center">
                    <h4 class="title title-up">Modifica dati</h4>
                </div>
                <div class="content">
                    <div class="input-group form-group-no-border nologin">
                          <span class="input-group-addon">
                              <i class="fa fa-lock green" aria-hidden="true"></i>
                          </span>
                        <input name="FirstName" type="text" class="form-control"  placeholder="Nome...">
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-key green" aria-hidden="true"></i>
                          </span>
                        <input name="LastName" type="text" class="form-control" placeholder="Cognome..."/>
                    </div>
                    <div class="input-group form-group-no-border">
                          <span class="input-group-addon">
                              <i class="fa fa-repeat green" aria-hidden="true"></i>
                          </span>
                        <input name="Email" type="email" class="form-control" placeholder="Email..."/>
                    </div>
                </div>
                <div class="footer text-center">
                    <a class="btn btn-default" onclick="$('#editInfoForm').submit();">Salva</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>