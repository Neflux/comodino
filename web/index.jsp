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

<!-- general error, see passed parameter -->
<c:if test="${not empty param.success}">
    <div id="popup" class="alert alert-success alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            ${param.success}
    </div>
</c:if>
<c:if test="${not empty param.warning}">
    <div id="popup" class="alert alert-warning alert-dismissable fade in">
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
<div class="container-fluid dynamicTile">
    <div class="row">
        <div class="col-sm-2 col-xs-4">
            <div id="tile1" class="tile kitchen">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-cutlery myiconresize"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Cucina</h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile kitchen">

                <img src="img/cucina1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="bagno" class="tile bagno">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Bagno</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-bath myiconresize"></i></h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile bagno">

                <img src="img/bagno1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="garden" class="tile garden">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-leaf myiconresize"></i></h3>
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
            <div class="tile bedroom">

                <img src="img/bedroom1.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="bedroom" class="tile bedroom">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Camera da<br>letto</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-bed myiconresize"></i></h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="illumination" class="tile illumination">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-lightbulb-o myiconresize"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Illuminazione</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile garden">

                <img src="img/garden1.jpg" class="img-responsive"/>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2 col-xs-4">
            <div id="livingroom" class="tile livingroom">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption">Soggiorno</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption"><i class="fa fa-television myiconresize"></i></h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div class="tile livingroom">

                <img src="img/salotto2.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile illumination">

                <img src="img/illumination2.jpg" class="img-responsive"/>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="studio" class="tile studio">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-book myiconresize"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Studio</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile studio">

                <img src="img/studio2.jpg" class="img-responsive"/>

            </div>
        </div>

    </div>
</div>
</body>
</html>
