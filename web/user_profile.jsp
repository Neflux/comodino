<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html lang="it">
<head>
    <title>Profilo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="css/my.css" rel="stylesheet" type="text/css">
    <link href="css/user_profile.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header_anonimo.jsp" flush="true"/>
<div class="container">
    <div class="row" style="margin: 0 0 10px 0;">
        <div class="col-md-12 text-center">
            <jsp:useBean id="user" class="main.UserBean" scope="session">
            </jsp:useBean>

            <img id="profile_pic" src="http://icons.iconarchive.com/icons/paomedia/small-n-flat/512/user-male-icon.png" class="center-block img-circle img-responsive">
            <h1 class="text-center text-uppercase"><jsp:getProperty name="user" property="firstName"/> <jsp:getProperty name="user" property="lastName"/></h1>
        </div>
    </div>
    <div class="row" style="margin: 0 0 15px 0;">
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" href="#"><i class="fa fa-fw fa-lock pull-left"></i>Modifica Password</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" href=" #"><i class="fa fa-fw fa-user pull-left"></i>Modifica Dati</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-primary text-capitalize" href="#"><i class="fa fa-fw fa-map-marker pull-left"></i>Modifica Indirizzo Spedizione</a>
        </div>
    </div>
    <div class="row" style="margin: 0 0 15px 0;">
        <div class="col-md-4">
            <a class="btn btn-block btn-success text-capitalize" href="#"><i class="fa fa-fw pull-left fa-shopping-cart"></i>I miei ordini</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-success text-capitalize" href=" #"><i class="fa fa-fw pull-left fa-warning"></i>Dispute</a>
        </div>
        <div class="col-md-4">
            <a class="btn btn-block btn-success text-capitalize" href="#"><i class="fa fa-fw pull-left fa-home"></i>Apri negozio/negozio</a>
        </div>
    </div>
</div>


</body></html>