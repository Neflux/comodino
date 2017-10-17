<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp" flush="true" />

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
    <div class="row ">
        <div class="col-sm-2 col-xs-4">
            <div id="tile1" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/twitter1.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/twitter2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div id="tile10" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-child fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Customize your tiles</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Text, Icons, Images</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Combine them and create your metro style</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile4" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/facebook3.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/facebook2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile5" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/neews.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/neews2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile6" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/skype.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/skype2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-xs-8">
            <div id="tile7" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/gallery.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery2.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery3.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile8" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/music.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/music2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile9" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/calendar.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/calendar2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div id="tile10" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <h3 class="tilecaption"><i class="fa fa-child fa-4x"></i></h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Customize your tiles</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Text, Icons, Images</h3>
                        </div>
                        <div class="item">
                            <h3 class="tilecaption">Combine them and create your metro style</h3>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-2 col-xs-4">
            <div id="tile4" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/facebook3.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/facebook2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-4 col-xs-8">
            <div id="tile11" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/gallery.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery2.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/gallery3.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile13" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/calendar.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/calendar2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile4" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/facebook3.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/facebook2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-2 col-xs-4">
            <div id="tile5" class="tile">

                <div class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://handsontek.net/demoimages/tiles/neews.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="http://handsontek.net/demoimages/tiles/neews2.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>
