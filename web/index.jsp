<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:if test="${sessionScope.user != null}">
    <jsp:include page="/restricted/header.jsp" flush="true" />
</c:if>
<c:if test="${sessionScope.user == null}">
    <jsp:include page="/header_anonimo.jsp" flush="true" />
</c:if>


<!doctype html>
<html lang="it">
<head>
    <title>Comodino.it</title>
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<c:if test="${param.action == 'logout'}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Uscito con successo!
    </div>
</c:if>
<c:if test="${param.action == 'login_error'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Username o password errati!
    </div>
</c:if>
<c:if test="${param.action == 'register_error'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
        Campi mancanti!
    </div>
</c:if>
<c:if test="${param.action == 'email_already_in_use_error'}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        La mail inserita è già in uso!
    </div>
</c:if>

<!-- general error, see passed parameter -->
<c:if test="${not empty param.error}">
    <div id="popup" class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        ERRORE: ${param.error}
    </div>
</c:if>
<div class="container-fluid dynamicTile">
    <div class="row">
        <div class="col-sm-2 col-xs-4">
            <div id="tile1" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-cutlery fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Cucina</h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile">

                <img src="img/cucina1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="bagno" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Bagno</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-bath fa-4x"></i></h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile">

                <img src="img/bagno1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="garden" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-leaf fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Giardino</h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-xs-8">
            <div class="tile">

                <img src="img/bedroom1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="bedroom" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Camera da<br>letto</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-bed fa-4x"></i></h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="illumination" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-lightbulb-o fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Illuminazione</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile">

                <img src="img/garden1.jpg" class="img-responsive"/>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2 col-xs-4">
            <div id="livingroom" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Salotto</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-television fa-4x"></i></h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile">

                <img src="img/salotto2.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile">

                <img src="img/illumination2.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="studio" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-book fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Studio</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile">

                <img src="img/studio2.jpg" class="img-responsive"/>

            </div>
        </div>

    </div>
</div>
</body>
</html>
