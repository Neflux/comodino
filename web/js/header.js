function openCart()
{
    $.post( "/getcart")
        .done(function(data) {
            $("#cart").html(data);
        });
}