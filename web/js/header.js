var first = true;

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

function openLoginModal()
{
    $('#LoginSignup').modal('show');
    if (first === false)
        show_login(0);
}

function openSignupModal()
{
    $('#LoginSignup').modal('show');
    show_signup(0);
    first = false;
}



function show_login(vel)
{
    $('.nologin').each(function () {
        var v = $(this);
        v.animate({opacity: 0}, vel);
    });
    $('.login').animate({marginTop:'-100px'}, vel);
    $('#card_titolo').animate({opacity: 0}, vel/2, function () {
        $('#card_titolo').text("Login");
        $('#card_titolo').animate({opacity: 1}, vel/2);
    });
    $('#card_change_button').html('Non hai ancora un account? <a href="#" onclick="show_signup(500);">Registrati</a>');
    $('#form').attr('action','/login');
}

function show_signup(vel)
{
    $('.nologin').each(function () {
        var v = $(this);
        v.animate({opacity: 1}, vel);
    });
    $('.login').animate({marginTop:'0px'}, vel);
    $('#card_titolo').animate({marginBottom:'50px'}, vel);
    $('#card_titolo').animate({opacity: 0}, vel/2, function () {
        $('#card_titolo').text("Registrati");
        $('#card_titolo').animate({opacity: 1}, vel/2);
        //$('#card_titolo').animate({marginBottom:'50px'}, 500);
    });
    $('#card_change_button').html('Hai già un account? <a href="#" onclick="show_login(500);">Loggati</a>');
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

function readNotifications() {

    $.post("/restricted/readnotifications")
        .done(function(data) {
        });
}

$("#search").autocomplete({
    source: function (request, response) {
        $.ajax({
            url: "/searchautocomplete",
            dataType: "json",
            data: {
                term: request.term
            },
            success: function (data) {
                response(data);
            }
        });
    },
    minLength: 3,
    select: function (event, ui) {
    }
});

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


