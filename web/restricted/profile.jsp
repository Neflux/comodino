<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="user" class="main.User" scope="session"/>

<t:genericpage>
    <jsp:attribute name="pagetitle">
        ${user.firstName} ${user.lastName}
    </jsp:attribute>
    <jsp:attribute name="pagecss">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css" >
    </jsp:attribute>

    <jsp:attribute name="pagejavascript">
        <script src="${pageContext.request.contextPath}/js/profile.js"></script>
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="row" style="margin: 0 0 10px 0;">
                <div class="col-md-12 text-center">
                    <img id="profile_pic" src="http://icons.iconarchive.com/icons/paomedia/small-n-flat/512/user-male-icon.png" class="center-block img-circle img-responsive">
                    <h1 class="text-center text-uppercase">
                            ${user.firstName} ${user.lastName}<br>
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
                        <a class="btn btn-block btn-warning text-capitalize" data-toggle="modal" data-target="#showPrivacy"><i class="fa fa-fw fa-lock pull-left"></i>Accetta privacy</a>
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
                    <a class="btn btn-block btn-primary text-capitalize" href="addresses.jsp"><i class="fa fa-fw fa-map-marker pull-left"></i>Modifica Indirizzi Spedizione</a>
                </div>
            </div>
            <div class="row" style="margin: 0 0 15px 0;">
                <div class="col-md-6 pull-left">
                    <a class="btn btn-block btn-success text-capitalize" href="${pageContext.request.contextPath}/restricted/orderhistory.jsp"><i class="fa fa-fw pull-left fa-shopping-cart"></i>I miei ordini</a>
                </div>
                <div class="col-md-6 pull-right">
                    <c:choose>
                        <c:when test="${user.shopID > 0}">
                            <a class="btn btn-block btn-success text-capitalize" href="vendor/shop_panel.jsp"><i class="fa fa-fw pull-left fa-home"></i>Negozio</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-block btn-success text-capitalize" href="${pageContext.request.contextPath}/restricted/createshop.jsp"><i class="fa fa-fw pull-left fa-home"></i>Apri negozio</a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>


        <%-- changePwd --%>
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

        <%-- editInfo --%>
        <div class="modal fade" id="editInfo" tabindex="-1" role="dialog" aria-labelledby="editInfoLabel">
            <div class="row">
                <div class="card card-signup centerize" data-background-color="orange">
                    <%--TODO:Auto-populate previous values--%>
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

        <div class="modal fade" id="showPrivacy" tabindex="-1" role="dialog" aria-labelledby="editInfoLabel">
            <div class="row">
                <div class="card card-signup centerize" data-background-color="orange">
                        <%--TODO:Auto-populate previous values--%>
                    <form id="editInfoForm" class="form" method="POST" action="${pageContext.request.contextPath}/restricted/editinfo">
                        <div class="header header-primary text-center">
                            <h4 class="title title-up">Dichiarazione sulla Privacy</h4>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border nologin" style="color:#ffffff">
                                La disciplina relativa all’uso dei c.d. “<b>cookie</b>” e di altri strumenti analoghi nei terminali (personal computer, notebook, tablet pc, smartphone, ecc.) utilizzati dagli utenti, è stata <b>modificata</b> a seguito dell’attuazione della Direttiva CEE 2009/136/CE che ha modificato la Direttiva “e-Privacy” 2002/58/CE.
                                <br>
                                <br>
                                Il <b>recepimento</b> della nuova Direttiva è avvenuto in Italia con il Decreto legislativo 28 maggio 2012, n. 69 che ha apportato modifiche al decreto legislativo 30 giugno 2003, n. 196 “Codice in materia di protezione dei dati personali”.
                                <br>
                                <b>Salviamo</b> anche i dati che il tuo <b>browser</b> ogni volta che fa una richiesta (ad esempio: indirizzi IP, headers) da usare a fini statistici.
                            </div>
                        </div>
                        <div class="footer text-center">
                            <a class="btn btn-default" href="${pageContext.request.contextPath}/restricted/acceptprivacy">Accetta</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>