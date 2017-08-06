<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="./css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="./css/custom.min.css">
    <script src="https://use.fontawesome.com/f98c8dd683.js"></script>
    <link rel="stylesheet" href="./css/my.css">
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

                <a class="navbar-brand" href="#"><img src="./css/passero.svg"/></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#" class="notification">65&nbsp;&nbsp;<i class="fa fa-truck" aria-hidden="true"></i></a></li>
                    <li><a href="#" class="notification">23&nbsp;&nbsp;<i class="fa fa-hand-o-up" aria-hidden="true"></i></a></li>

                </ul>
                <ul class="nav navbar-nav navbar-center">
                    <li>
                        <form class="navbar-form" type="GET" action="/search">
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
                                <input type="text" class="form-control no-border" name="q" placeholder="Cerca">
                            </div>
                            <button type="submit" class="btn btn-default btn-right"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" role="button" data-toggle="modal" data-target="#myModal">
                            <i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp;Login | Sign Up
                        </a>


                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="row">
            <div class="card card-signup centerize" data-background-color="orange" id="signup_login_card">
                <form class="form" method="POST" action="/login" id="form">
                    <div class="header header-primary text-center">
                        <h4 class="title title-up" id="card_titolo">Sign Up</h4>
                    </div>
                    <div class="content">
                        <div class="input-group form-group-no-border nologin">
                          <span class="input-group-addon">
                              <i class="fa fa-user-o green" aria-hidden="true"></i>
                          </span>
                            <input type="text" class="form-control" name="FirstName" placeholder="First Name...">
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
                        <div class="row text-center">
                            <span class="white" id="card_change_button">Want to <a href="#" onclick="show_login();">login?</a></span>
                        </div>
                        <!-- If you want to add a checkbox to this form, uncomment this code -->
                        <!-- <div class="checkbox">
                            <input id="checkboxSignup" type="checkbox">
                              <label for="checkboxSignup">
                              Unchecked
                              </label>
                              </div> -->
                    </div>
                    <div class="footer text-center">
                        <a href="#" class="btn btn-default" onclick="$('#form').submit();"(>Get Started</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/custom.js"></script>
    <script src="./js/now-ui-kit.js"></script>
    <script src="./js/signup_login/signup_login_actions.js"></script>
</body>
