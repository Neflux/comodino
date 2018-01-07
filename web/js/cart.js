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
    var prezzo = $("#price_" + prodID + "_" + shopID).text().slice(0, -1).replace(",",".");
    var quantita = $("#quantity_" + prodID + "_" + shopID).val();
    var aggiungere = parseFloat(prezzo) * parseFloat(quantita);
    var attuale = $("#total").text().replace("Totale: ","").replace(",",".").slice(0, -1);
    var aggiunto = (parseFloat(attuale) - parseFloat(aggiungere)).toFixed(2);
    $("#total").text("Totale: " + aggiunto + "€");
    $("#" + prodID + "_" + shopID).fadeOut("700");

    if (aggiunto === 0)
    {
        $("#nextbtn").text("Vai alla homepage");
        $("#nextbtn").attr("href", "/index.jsp");
    }

    $.post("/removecartitem", {"productID": prodID, "shopID": shopID});
    updateCart();
}

function updatePrice(prodID, tipo, shopID)
{
    var quantita = $("#quantity_" + prodID + "_" + shopID).val();
    // var prezzo = $("#price_" + prodID + "_" + shopID).text().slice(0, -1).replace(",",".");
    //var aggiungere = parseFloat(prezzo);
    //var attuale = $("#total").text().replace("Totale: ","").replace(",",".").slice(0, -1);
    //var aggiunto = attuale;
    var post = {productID: prodID, shopID: shopID};
    if (tipo === "+")
    {
        //aggiunto = (parseFloat(attuale) + parseFloat(aggiungere)).toFixed(2);
        $.post("/addcartitem", post).done(function () {
            updateTotal();
            updateCart();
        });
    }
    else if (tipo === "-" && quantita > 1)
    {
        //aggiunto = (parseFloat(attuale) - parseFloat(aggiungere)).toFixed(2);
        $.post("/decreasecartitem", post).done(function () {
            updateTotal();
            updateCart();
        });
    }
}

function setQuantity(prodID, shopID, value){
    console.log(prodID, shopID, value);
    var post = {productID: prodID, shopID: shopID, quantity: value};
    if(value !== null && value > 0){
        $.post("/restricted/setcartitem", post).done(function () {
            updateCart();
            updateTotal();
        });
    }

}
function updateTotal(){
    var items = $(".cart-item");
    var totale = 0.0;
    $(items).each(function (index, item) {
        var prezzo_item = parseFloat($(item).find(".itemprice").text().slice(0, -1).replace(",",".")).toFixed(2);
        var quantita_item = parseInt($(item).find(".quantity>input").val());
        if (quantita_item <= 0){
            quantita_item = parseInt($(item).find(".quantity>input").attr("value"));
        }
        if ($(item).is(":visible")){
            console.log(prezzo_item, quantita_item);
            totale += prezzo_item * quantita_item;
        }
        else{
            console.log("Nascosto: ", item);
        }
    });
    totale = totale.toFixed(2);
    $("#total").text("Totale: " + totale + "€");
}

function updateCart() {
    $.post("/getcart", {type:"header"})
        .done(function(data) {
            $("#cartheader").html(data);
        });
    $.post("/getcart", {type:"drop"})
        .done(function(data) {
            $("#cartdrop").html(data);
        });
}

$(document).ready(function() {
    var allQuantityBoxes = $("input[type=\"number\"]");
    $(allQuantityBoxes).each(function (index, value) {
        $(value).focusout(function () {
            setQuantity($(value).attr("data-prod"), $(value).attr("data-shop"), $(value).val());
        });
    });
    //updateTotal();
});
