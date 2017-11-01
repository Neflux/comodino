<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if(session != null && session.getAttribute("user") != null){
%>
<jsp:include page="/restricted/header.jsp" flush="true" />
<%
    }
    else{
%>
<jsp:include page="/header_anonimo.jsp" flush="true" />
<%
    }
%>

<!doctype html>
<html lang="it">
<head>
    <title>Comodino.it</title>
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body >
<%
    try {
        if (request.getParameter("action").equals("logout")){
%>
<div id="logoutPopup" class="alert alert-success alert-dismissable fade in" style="position:fixed; z-index: 999; right: 10px; opacity: 0;">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    Uscito con successo!
</div>
<%
        }
    }catch (Exception e){}
%>
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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/cucina1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/cucina2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/bagno1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/bagno2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/bedroom1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/bedroom2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/garden1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/garden2.jpg" class="img-responsive"/>
                        </div>

                    </div>
                </div>

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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/salotto1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/salotto2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/illumination1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/illumination2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

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

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="img/studio1.jpg" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="img/studio2.jpg" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>
