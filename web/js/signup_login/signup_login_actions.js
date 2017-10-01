function show_login()
{
    $('.nologin').each(function () {
        var v = $(this);
        v.animate({opacity: 0}, 500);
    });
    $('.login').animate({marginTop:'-100px'}, 500);
    $('#card_titolo').animate({opacity: 0}, 250, function () {
        $('#card_titolo').text("Login");
        $('#card_titolo').animate({opacity: 1}, 250);
    });
    $('#card_change_button').html('Non hai ancora un account? <a href="#" onclick="show_signup();">Registrati</a>');
}

function show_signup()
{
    $('.nologin').each(function () {
        var v = $(this);
        v.animate({opacity: 1}, 500);
    });
    $('.login').animate({marginTop:'0px'}, 500);
    $('#card_titolo').animate({marginBottom:'50px'}, 500);
    $('#card_titolo').animate({opacity: 0}, 250, function () {
        $('#card_titolo').text("Registrati");
        $('#card_titolo').animate({opacity: 1}, 250);
        //$('#card_titolo').animate({marginBottom:'50px'}, 500);
    });
    $('#card_change_button').html('Hai già un account? <a href="#" onclick="show_login();">Loggati</a>');
}

$(document).ready(function() {
    $("#logoutPopup").animate({opacity: 1}, 800);
    setTimeout(function() {
        $("#logoutPopup").fadeOut();
    }, 6000);
});
