<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="css/my.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css\cart.css">
</head><body class="">
<jsp:include page="header.jsp" flush="true"/>
<div class="cartlist">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="display-1">Riepilogo Carrello</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="list-group">
                    <li class="list-group-item">
                        <div class="cart-item">
                            <div id="c_row-4col" class="row pi-draggable" draggable="true">
                                <div class="col-md-2 itemimg" id="prodimg">
                                    <img class="img-fluid d-block my-2" src="https://pingendo.com/assets/photos/wireframe/photo-1.jpg">
                                </div>
                                <div class="col-md-7">
                                    <h1 class="itemtitle">Titolo oggetto 1</h1>
                                    <p id="c_lead" class="lead pi-draggable itemseller" draggable="true">Venduto da:
                                        <a href="www.pietrobolcato.it">PBPH</a>
                                    </p>
                                    <h2 class="itemprice">777€</h2>
                                </div>
                                <div class="col-md-2">
                                    <div class="itemquantity">
                                        <p>Quantità</p>
                                        <i class="fa fa-minus" aria-hidden="true" style="margin: 2px"></i>1
                                        <i class="fa fa-plus" aria-hidden="true" style="margin: 2px"></i>
                                    </div>
                                </div>
                                <div class="col-md-1 text-center">
                                    <i class="fa fa-trash" aria-hidden="true" style="font-size: 24px; margin-top:40px"></i>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="cart-item">Oggetto 2</div>
                    </li>
                    <li class="list-group-item">
                        <div class="cart-item">Oggetto 3</div>
                    </li>
                    <li class="list-group-item">
                        <div class="cart-item">Oggetto 4</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="padding-right: 30px">
                <h1 class="total" style="text-align: right; margin: 5px 0">Totale: €420</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <a class="btn btn-primary btn-xs text-center center-block" href="" style="border-radius: 8px; max-width:200px"><i class="fa fa-fw fa-lg fa-money"></i> Procedi all'acquisto</a>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body></html>