function scrollToAnchor(aid){
    var aTag = $("#"+ aid);
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
}

$("#tomap").click(function() {
    scrollToAnchor('map');
});