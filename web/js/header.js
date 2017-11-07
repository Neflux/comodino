$(function(){

    $(".input-group-btn .dropdown-menu li a").click(function(){

        var selText = $(this).html();
        console.log("#"+selText.split(' ').join('')+"-radio");
        var radio = $("#"+selText.split(' ').join('')+"-radio");
        if(selText === "Tutte le categorie"){
            $('input[name="cat"]').prop('checked', false);
        }
        else {
            radio.prop("checked", true);
        }
        selText += "&nbsp;&nbsp;<span class=\"caret\"></span>";
        //working version - for multiple buttons //
        $(this).parents('.input-group-btn').find('.btn-search').html(selText);

    });

});



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
    $('#form').attr('action','/login');
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
    $('#form').attr('action','/register');
}

function openCart() {

    $.post("/getcart", {type:"drop"})
        .done(function(data) {
            $("#cartdrop").html(data);
        });
    $.post("/getcart", {type:"header"})
        .done(function(data) {
            $("#cartheader").html(data);
        });
}

$(document).ready(function() {
    $("#popup").animate({opacity: 1}, 800);
    setTimeout(function() {
        $("#popup").fadeOut();
    }, 6000);

    $('#signup_login_card').keypress(function (e) {
        var key = e.which;
        if(key === 13)  // invio
            $('#form').submit();
    });
});
