var stelle = 0;

function openDisputeModal(orderID, productID, shopID) {
    //alert("Order: " + orderID + " Product: " + productID + " Shop: " + shopID);
    $('#orderIdDisputeModal').val(orderID);
    $('#productIdDisputeModal').val(productID);
    $('#shopIdDisputeModal').val(shopID);
    $(function(){$('#opendisputemodal').modal('toggle');});
}

function openReviewModal(orderID, productID, shopID) {
    //alert("Order: " + orderID + " Product: " + productID + " Shop: " + shopID);
    $('#orderIdReviewModal').val(orderID);
    $('#productIdReviewModal').val(productID);
    $('#shopIdReviewModal').val(shopID);
    $(function(){$('#openreviewmodal').modal('toggle');});

}

function setStar(id)
{
    stelle_hover = id.id.substr(7,id.id.lenght);

    for (i = 0; i <= stelle_hover; i++)
        $("#stella_" + i).attr("class","fa fa-star rating_star");

    for (i = parseInt(stelle_hover)+1; i <= 5; i++)
        $("#stella_" + i).attr("class","fa fa-star-o rating_star");

    stelle = stelle_hover;
}

function setStarRating()
{
    $('#openreviewmodal input[name="rating"]').val(stelle);
    console.log(stelle);

}
$(document).ready(function() {
    var ordini = $("#OrdiniInCorso ul.list-group");
    ordini.each( function () {
        if (!$.trim( $(this).html() ).length){
            $(this).html("<h4 class='text-center'>Tutti i prodotti di quest'ordine sono già stati ritirati</h4>");
        }
    });
    ordini = $("#OrdiniCompletati ul.list-group");
    ordini.each( function () {
        if (!$.trim( $(this).html() ).length){
            $(this).html("<h4 class='text-center'>Tutti i prodotti di quest'ordine sono ancora da ritirare</h4>");
        }
    });
});
