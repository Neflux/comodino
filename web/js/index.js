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
    if (url.indexOf("?passwordResetToken=") >= 0)
    {
        $('#resetpasswordmodal').modal('show');
    }

});
