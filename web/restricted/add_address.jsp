<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/profile.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="../css/my.css" rel="stylesheet" type="text/css">
    <link href="css\add_address.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<div class="addresslist">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="display-1">Lista Indirizzi</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="cart-item">
                            <div class="row pi-draggable" id="c_row-4col" draggable="true">
                                <div class="col-md-10">
                                    <p><b>Luca De Fassi</b></p>
                                    <p>Via Perini 127</p>
                                    <p>Trento</p>
                                    <p>45687</p>
                                    <p>Numero di telefono: 6886546890</p>
                                </div>
                                <div class="col-md-2" style="text-align: center; padding-top: 30px; font-size: 40px">
                                    <i class="fa fa-pencil" aria-hidden="true" style="font-size: 40px; margin-top: 30px; padding-right: 30px"></i>
                                    <i class="fa fa-trash" aria-hidden="true" style="font-size: 40px; margin-top:30px"></i>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-2">
                        <a class="btn btn-block btn-primary text-capitalize" data-toggle="modal" data-target="#addAddress" contenteditable="true"><i class="fa fa-fw pull-left fa-map-marker"></i>Aggiungi Indirizzo</a>
                    </div>
                    <div class="col-md-5"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addAddress" tabindex="-1" role="dialog" aria-labelledby="addAddressLabel">
    <div class="row">
        <div class="card card-signup centerize" data-background-color="orange">
            <form id="addAddressForm" class="form" method="POST" action="${pageContext.request.contextPath}/addaddress">
                <div class="header header-primary text-center">
                    <h4 class="title title-up">Aggiungi Indirizzo</h4>
                </div>
                <div class="content">
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-id-card green" aria-hidden="true"></i>
                    </span>
                        <input id="FirstName" name="FirstName" type="text" class="form-control" placeholder="Nome">
                    </div>
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-id-card green" aria-hidden="true"></i>
                    </span>
                        <input id="LastName" name="LastName" type="text" class="form-control" placeholder="Cognome">
                    </div>
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-map-marker green" aria-hidden="true"></i>
                    </span>
                        <input id="Address" name="Address" type="text" class="form-control" placeholder="Indirizzo">
                    </div>
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-home green" aria-hidden="true"></i>
                    </span>
                        <input id="City" name="City" type="text" class="form-control" placeholder="Città">
                    </div>
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-hashtag green" aria-hidden="true"></i>
                    </span>
                        <input id="ZIP" name="ZIP" type="text" class="form-control" placeholder="CAP">
                    </div>
                    <div class="input-group form-group-no-border nologin">
                    <span class="input-group-addon">
                      <i class="fa fa-phone green" aria-hidden="true"></i>
                    </span>
                        <input id="Phone" name="Phone" type="number" class="form-control" placeholder="Telefono">
                    </div>
                    <div class="footer text-center">
                        <a id="addAdr" class="btn btn-default" onclick="$('#addAddressForm').submit();">Aggiungi</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body></html>
