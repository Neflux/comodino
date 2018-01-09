$( document ).ready(function() {
    $(".tile").height($("#tile1").width());
    $(".carousel").height($("#tile1").width());
    $(".item").height($("#tile1").width());

    $(window).resize(function() {
        if(this.resizeTO) clearTimeout(this.resizeTO);
        this.resizeTO = setTimeout(function() {
            $(this).trigger('resizeEnd');
        }, 10);
    });

    $(window).bind('resizeEnd', function() {
        $(".tile").height($("#tile1").width());
        $(".carousel").height($("#tile1").width());
        $(".item").height($("#tile1").width());
    });

    $('.tile.bagno').click(function () {
        window.location.href = "/search?cat=Bagno&q=";
    });
    $('.tile.garden').click(function () {
        window.location.href = "/search?cat=Balcone+e+Giardino&q=";
    });
    $('.tile.kitchen').click(function () {
        window.location.href = "/search?cat=Cucina&q=";
    });
    $('.tile.studio').click(function () {
        window.location.href = "/search?cat=Studio+e+Ufficio&q=";
    });
    $('.tile.livingroom').click(function () {
        window.location.href = "/search?cat=Soggiorno&q=";
    });
    $('.tile.illumination').click(function () {
        window.location.href = "/search?cat=Illuminazione&q=";
    });
    $('.tile.bedroom').click(function () {
        window.location.href = "/search?cat=Camera+da+Letto&q=";
    });

    var url = window.location.href;
    if (url.indexOf("?token=") >= 0)
    {
        $('#resetpasswordmodal').modal('show');
    }
});

function check_pws() {
    var pwa = $("#pwda").val();
    var pwb = $("#pwdb").val();

    if ( pwa !== "" && pwb !== "" && pwa !== pwb )
    {
        $("#error_message").css("display","initial");
        $("#error_message").animate({opacity:1},500);
    }
    else if ( pwa !== "" && pwb !== "" && pwa === pwb )
    {
        $("#error_message").animate({opacity:0},500, function () {
            $("#error_message").css("display","none");
        });
    }

}

/*
$("#resetpasswordform").validate({
    rules: {
        pwda: "required",
        pwdb: {
            equalTo: "#password"
        }
    }
});
jQuery.validator.setDefaults({
    debug: true,
    success: "valid"
});

jQuery.extend(jQuery.validator.messages, {
    equalTo: jQuery.validator.format("Le password non combaciano")
});
*/

