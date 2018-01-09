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
    $(".nologin").css("visibility","hidden");
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
        v.animate({opacity: 0}, vel, function () {
            $(".nologin").css("visibility","hidden");
        });
    });

    $(".yeslogin").animate({opacity:1},vel);
    $('.login').animate({marginTop:'-100px'}, vel);
    $('#card_titolo').animate({opacity: 0}, vel, function () {
        $('#card_titolo').text("Login");
        $('#card_titolo').animate({opacity: 1}, vel);
    });
    $('#card_change_button').html('Non hai ancora un account? <a href="#" onclick="show_signup(500);">Registrati</a>');
    $('#card_forgot_button').css("display","initial");
    $('#card_forgot_button').animate({opacity:1},vel);
    $('#form').attr('action','/login');
    $("#doButton").text("Entra");
}

function show_signup(vel)
{
    $(".nologin").css("visibility","initial");
    $('.noforgot').each(function () {
        var v = $(this);
        v.css("display","table");
        v.animate({opacity: 1}, vel);
    });
    $('.nologin').each(function () {
        var v = $(this);
        v.animate({opacity: 1}, vel);
    });
    $('.login').animate({marginTop:'0px'}, vel);
    $('#card_titolo').animate({marginBottom:'50px'}, vel);
    $('#card_titolo').animate({opacity: 0}, vel, function () {
        $('#card_titolo').text("Registrati");
        $('#card_titolo').animate({opacity: 1}, vel);
        //$('#card_titolo').animate({marginBottom:'50px'}, 500);
    });
    $('#card_change_button').html('Hai già un account? <a href="#" onclick="show_login(500);">Loggati</a>');
    $('#card_forgot_button').animate({opacity:0},vel, function () {
        $('#card_forgot_button').css("display","none");
    });
    $('#form').attr('action','/register');
    $("#doButton").text("Registrati");
}

function show_forgot(vel)
{
    $(".nologin").css("visibility","hidden");
    $(".yeslogin").animate({opacity:0,marginTop:"-40px"},vel, function () {
        $(".noforgot").css("margin-right","10000px");
    });

    $('#card_titolo').animate({opacity: 0}, 500, function () {
        $('#card_titolo').text("Inserisci la mail");
        $('#card_titolo').animate({opacity: 1}, 500);
    });

    $('#card_change_button').html('Hai già un account? <a href="#" onclick="show_login_from_forgot(500);">Loggati</a>');
    $('#card_forgot_button').animate({opacity:0},vel, function () {
        $('#card_forgot_button').css("display","none");
    });

    $('#form').attr('action','/passwordRequest');
    $("#doButton").text("Invia");
}

function show_login_from_forgot(vel)
{
    $(".nologin").css("pointer-events","none");
    $(".noforgot").css("margin-right","0px");
    $(".yeslogin").animate({marginTop:"0px",opacity:1},vel);
    $('#card_titolo').animate({opacity: 0}, vel/2, function () {
        $('#card_titolo').text("Login");
        $('#card_titolo').animate({opacity: 1}, vel/2);
    });
    $('#card_change_button').html('Non hai ancora un account? <a href="#" onclick="show_signup(500);">Registrati</a>');
    $('#card_forgot_button').css("display","initial");
    $('#card_forgot_button').animate({opacity:1},vel);
    $('#form').attr('action','/login');
    $("#doButton").text("Entra");
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

function doSearchMobile() {
    window.location.href = "/search?q=" + ($("#searchMobile").val());
}

function createNotificationURL(reviewType, contextPath, shopID){
    var URL="#";

    if (reviewType == 'NotificationProductReview'){
        URL = contextPath + "/restricted/vendor/reviews.jsp";
    } else if (reviewType == 'NotificationShopReview'){
        URL = contextPath + "/shop.jsp?id=" + shopID;
    } else if (reviewType == 'NotificationDispute'){
        URL = contextPath + "/restricted/vendor/dispute_list.jsp";
    }

    return URL;
}
