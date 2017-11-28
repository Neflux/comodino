
var cleaveCreditCard = new Cleave('.input-credit-card', {
    creditCard:              true,
    onCreditCardTypeChanged: function (type) {

        $(".mycard.active").removeClass('active');

        $("." + type).addClass('active');
    }
});
