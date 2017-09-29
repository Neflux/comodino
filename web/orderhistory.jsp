<%@ page contentType="text/html;charset=UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="main.Order" %>
<%@ page import="daos.OrderDao" %>
<%@ page import="daos.impl.OrderDaoImpl" %>
<%@ page import="main.User" %>
<%@ page import="main.ProdOrder" %>
<%@ page import="utils.Utils" %>

<%
    User usr = (User) session.getAttribute("user");

    if ( usr == null || usr.getEmail() == null){
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ordini</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/custom.min.css" rel="stylesheet" type="text/css">
    <link href="css/my.css" rel="stylesheet" type="text/css">
    <link href="css/orderhistory.css" rel="stylesheet" type="text/css"> </head>
<body>
<jsp:include page="header.jsp" flush="true"/>
<%
    OrderDao orderDao = new OrderDaoImpl();
    ArrayList<Order> orders = orderDao.getAllOrders(usr);
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 id="title" class="text-uppercase">Lista ordini:</h1>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="#" class="nav-link active"><i class="fa fa-home"></i>&nbsp;Tutti gli ordini</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">Ordini in corso</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ordini Completati</a>
                </li>
            </ul>
            <%
                if (orders.size() > 0)
                    for (Order o:orders) {
            %>
            <!-- inizio ordine -->
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row text-left">
                            <div class="col-md-4 text-left">
                                <h5> Ordine n: <%=o.getOrderID()%></h5>
                            </div>
                            <div class="col-md-4 text-center">
                                <h5> Totale: <%=Utils.getNDecPrice(o.getTotal(),2)%>&euro;</h5>
                            </div>
                            <div class="col-md-4 text-right">
                                <h5> Effettuato il: <%=o.getDate().toString()%></h5>
                            </div>
                        </div>
                    </div>
                    <div class="panel-collapse">
                        <ul class="list-group">
                            <%
                                for (ProdOrder po:o.getProductList()) {
                            %>
                            <!-- inizio prodotto -->
                            <li class="list-group-item">
                                <a href="#" class="list-group-item">
                                    <div class="media col-md-2">
                                        <figure class="pull-left">
                                            <img class="media-object img-rounded img-responsive" src="<%=po.getProduct().getImgBase64()%>" alt="product image" height="" width="200px"> </figure>
                                    </div>
                                    <div class="col-md-6">
                                        <h1 class="list-group-item-heading"><%=po.getProduct().getProductName()%></h1>
                                        <ul class="list-unstyled list-group-item-text">
                                            <li>Venditore: <%=po.getProduct().getShopName()%></li>
                                            <%
                                                if (po.getProduct().getDiscount() == 0){
                                            %>
                                            <li>Prezzo: <%=Utils.getNDecPrice(po.getProduct().getActualPrice(),2)%>&euro;</li>
                                            <%
                                                }else{
                                            %>
                                            <li>Prezzo: <s><%=Utils.getNDecPrice(po.getProduct().getPrice(),2)%>&euro;</s>&nbsp;&nbsp;<b>Offerta: <%=Utils.getNDecPrice(po.getProduct().getActualPrice(),2)%> (<%=Utils.getNDecPrice(100*po.getProduct().getDiscount(),0)%>% di sconto)</b> </li>
                                            <%
                                                }
                                            %>
                                            <li>Quantità: <%=po.getQuantity()%> pz</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-2 text-right">
                                        <h4 class="list-group-item-heading">Spedito a:</h4>
                                        <ul class="list-unstyled list-group-item-text">
                                            <li>Andrea &nbsp;Porcospino</li>
                                            <li>Via delle Ghiaie 5</li>
                                            <li>35122, Trento (TN)</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <div class="row">
                                            <button type="button" class="btn btn-default btn-block">Consegna avvenuta!</button>
                                        </div>
                                        <div class="row">
                                            <button type="button" class="btn btn-default btn-block">Apri disputa</button>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <!-- fine prodotto -->
                            <%
                                }
                            %>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- fine ordine -->
            <%
                }
                else{
            %>
            <h3>&nbsp;&nbsp;&nbsp;Non hai ancora effettuato alcun ordine</h3>
            <%
                }
            %>
            <!--div class="list-group">
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> Lampada Grosa </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> List group heading </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
              <a href="#" class="list-group-item">
                <div class="media col-md-3">
                  <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive" src="250x250.png" alt="placehold.it/350x250"> </figure>
                </div>
                <div class="col-md-6">
                  <h4 class="list-group-item-heading"> List group heading </h4>
                  <p class="list-group-item-text"> Qui diam libris ei, vidisse incorrupte at mel. His euismod salutandi dissentiunt eu. Habeo offendit ea mea. Nostro blandit sea ea, viris timeam molestiae an has. At nisl platonem eum. Vel et nonumy gubergren, ad has tota facilis probatus.
                    Ea legere legimus tibique cum, sale tantas vim ea, eu vivendo expetendis vim. Voluptua vituperatoribus et mel, ius no elitr deserunt mediocrem. Mea facilisi torquatos ad. </p>
                </div>
                <div class="col-md-3 text-center">
                  <h2> 14240 <small> votes </small></h2>
                  <button type="button" class="btn btn-block btn-default"> Vote Now! </button>
                  <div class="stars"> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star"></span> <span class="fa fa-star-o"></span> </div>
                  <p> Average 4.5 <small> / </small> 5 </p>
                </div>
              </a>
          </div-->
        </div>
    </div>
</div>
</body></html>
