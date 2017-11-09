<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>


<jsp:include page="header.jsp" flush="true"/>

<jsp:useBean id="user" class="main.User" scope="session"/>
<jsp:useBean id="disputeDao" class="daos.impl.DisputeDaoImpl"/>
<c:set var="disputes" value="${disputeDao.allDisputes()}" scope="page"/>

<html lang="it">
<head>
    <title>Pannello Amministratore</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/admin_panel.js"></script>
    <link href="../css/admin_panel.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- general error, see passed parameter -->
<c:if test="${not empty param.success}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${param.success}
    </div>
</c:if>
<c:if test="${not empty param.warning}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Attenzione: ${param.warning}
    </div>
</c:if>
<c:if test="${not empty param.error}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Errore: ${param.error}
    </div>
</c:if>



<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#Dispute">Dispute</a></li>
                <li><a data-toggle="tab" href="#Negozi">Negozi</a></li>
                <li><a data-toggle="tab" href="#Prodotti">Prodotti</a></li>
            </ul>
            <div class="tab-content">
                <div id="Dispute" class="tab-pane fade in active">

                    <h3 style="margin-top: 0; text-align:center">Dispute</h3>
                    <table id="disputeList" class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>
                                Title
                            </th>
                            <th class="hidden-xs hidden-sm">
                                Descrizione
                            </th>
                            <th>
                                Data Creazione
                            </th>
                            <th style="text-align: center">
                                Ord-Prod-Neg
                            </th>
                            <th style="text-align: center">
                                Status
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${disputes}" var="dispute">
                            <tr>
                                <td>
                                    <b>${dispute.title}</b>
                                </td>
                                <td class="hidden-xs hidden-sm">
                                        ${dispute.description}
                                </td>
                                <td>
                                    <c:set var="dateParts" value="${fn:split(dispute.creationDate, ' ')}" scope="page"/>
                                    <c:set var="date" value="${fn:split(dateParts[0], '-')}" scope="page"/>
                                    <c:set var="time" value="${fn:split(dateParts[1], ':')}" scope="page"/>
                                        ${date[2]}/${date[1]} &nbsp;<span style="font-size: small">h: ${time[0]}:${time[1]}</span>
                                </td>
                                <td style="text-align: center">
                                        ${dispute.orderID} - ${dispute.productID} - ${dispute.shopID}
                                </td>
                                <td style="text-align: center">
                                    <c:choose>
                                        <c:when test="${dispute.status == 1}">
                                            Prodotto Rimborsato
                                        </c:when>
                                        <c:when test="${dispute.status == 2}">
                                            Disputa Declinata
                                        </c:when>
                                        <c:otherwise>
                                            <div class="btn-group">

                                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                    Seleziona azione &nbsp;&nbsp;<span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a href="#">Rimborso al cliente</a>
                                                    </li>
                                                    <li class="divider">
                                                    <li>
                                                        <a href="#">Declina disputa</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="Negozi" class="tab-pane fade in">
                </div>
                <div id="Prodotti" class="tab-pane fade in">
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <button type="button" class="btn btn-block btn-primary">
                Dispute
            </button>
            <button type="button" class="btn btn-block btn-success">
                Negozi
            </button>
            <button type="button" class="btn btn-block btn-warning">
                Prodotti
            </button>
        </div>
        <div class="col-md-9">
            <h3 style="margin-top: 0">Dispute</h3>
            <table id="disputeList" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>
                        Title
                    </th>
                    <th class="hidden-xs hidden-sm">
                        Descrizione
                    </th>
                    <th>
                        Data Creazione
                    </th>
                    <th style="text-align: center">
                        Ord-Prod-Neg
                    </th>
                    <th style="text-align: center">
                        Status
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${disputes}" var="dispute">
                    <tr>
                        <td>
                            <b>${dispute.title}</b>
                        </td>
                        <td class="hidden-xs hidden-sm">
                                ${dispute.description}
                        </td>
                        <td>
                            <c:set var="dateParts" value="${fn:split(dispute.creationDate, ' ')}" scope="page"/>
                            <c:set var="date" value="${fn:split(dateParts[0], '-')}" scope="page"/>
                            <c:set var="time" value="${fn:split(dateParts[1], ':')}" scope="page"/>
                                ${date[2]}/${date[1]} &nbsp;<span style="font-size: small">h: ${time[0]}:${time[1]}</span>
                        </td>
                        <td style="text-align: center">
                                ${dispute.orderID} - ${dispute.productID} - ${dispute.shopID}
                        </td>
                        <td style="text-align: center">
                            <c:choose>
                                <c:when test="${dispute.status == 1}">
                                    Prodotto Rimborsato
                                </c:when>
                                <c:when test="${dispute.status == 2}">
                                    Disputa Declinata
                                </c:when>
                                <c:otherwise>
                                    <div class="btn-group">

                                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                            Seleziona azione &nbsp;&nbsp;<span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">Rimborso al cliente</a>
                                            </li>
                                            <li class="divider">
                                            <li>
                                                <a href="#">Declina disputa</a>
                                            </li>
                                        </ul>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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