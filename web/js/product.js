function addToCart(productID,shopID)
{
    var post = {productID:productID, shopID:shopID};
    $.post( "/restricted/addcartitem", post);
    $.post("/restricted/getcart", {type:"drop"})
        .done(function(data) {
            $("#cartdrop").html(data);
        });
    $.post("/restricted/getcart", {type:"header"})
        .done(function(data) {
            $("#cartheader").html(data);
        });

    //var valore = $("#cart-size").text();
    //$("#cart-size").text( parseInt(valore)+1 );
}