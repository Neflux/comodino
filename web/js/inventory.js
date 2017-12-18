function editQuantityModal(productID) {
    $('#productIdQuantityModal').val(productID);
    $(function(){$('#editquantitymodal').modal('toggle');});

}

function editPriceModal(productID) {
    $('#productIdPriceModal').val(productID);
    $(function(){$('#editpricemodal').modal('toggle');});

}

function removeProductModal(productID) {
    $('#productIDRemoveModal').val(productID);
    $(function(){$('#removeproductmodal').modal('toggle');});
}