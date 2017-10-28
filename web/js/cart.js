jQuery('').insertAfter('.quantity input');
jQuery(".quantity").each(function() {
    var spinner = jQuery(this),
        input = spinner.find('input[type="number"]'),
        btnUp = spinner.find('.quantity-up'),
        btnDown = spinner.find('.quantity-down'),
        min = input.attr('min'),
        max = input.attr('max');

    btnUp.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue >= max) {
            var newVal = oldValue;
        } else {
            var newVal = oldValue + 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
    });

    btnDown.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue <= min) {
            var newVal = oldValue;
        } else {
            var newVal = oldValue - 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
    });

});

function removeItem(prodID, shopID){

    $.post("/removecartitem", {"productID": prodID, "shopID": shopID})
        .done(function(data) {
            location.reload();
        });
}

function updatePrice(prodID,tipo, shopID)
{
    var prezzo = $("#price_" + prodID).text().slice(0, -1).replace(",",".");
    var quantita = $("#quantity_" + prodID).val();
    var aggiungere = parseFloat(prezzo);
    var attuale = $("#total").text().replace("Totale: ","").replace(",",".").slice(0, -1);
    var aggiunto = attuale;
    if (tipo == "+")
        aggiunto = (parseFloat(attuale) + parseFloat(aggiungere)).toFixed(2);
    else if (tipo == "-" && quantita > 1)
        aggiunto = (parseFloat(attuale) - parseFloat(aggiungere)).toFixed(2);

    $("#total").text("Totale: " + aggiunto + "€");

    var post = {productID: prodID, shopID: shopID};
    $.post("/addcartitem", post);
    $.post("/getcart", {type:"drop"})
        .done(function(data) {
            $("#cartdrop").html(data);
        });
    $.post("/getcart", {type:"header"})
        .done(function(data) {
            $("#cartheader").html(data);
        });
}