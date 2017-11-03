function openDisputeModal(orderID, productID, shopID) {
    //alert("Order: " + orderID + " Product: " + productID + " Shop: " + shopID);
    $('#orderIdDisputeModal').val(orderID);
    $('#productIdDisputeModal').val(productID);
    $('#shopIdDisputeModal').val(shopID);
    $(function(){$('#opendisputemodal').modal('toggle');});
    
}