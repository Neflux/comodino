function addToCart(productID,shopID)
{
    var post = {productID:productID, shopID:shopID};
    $.post( "/addcartitem", post);
    $.post("/getcart", {type:"drop"})
        .done(function(data) {
            $("#cartdrop").html(data);
        });
    $.post("/getcart", {type:"header"})
        .done(function(data) {
            $("#cartheader").html(data);
        });

    //var valore = $("#cart-size").text();
    //$("#cart-size").text( parseInt(valore)+1 );
}