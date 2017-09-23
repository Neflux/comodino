function openModal(titolo,venditori,prezzi)
{
    $('#vendorsModal').modal('show');
    $("#content-modal-vendors").empty();
    $("#card_titolo_vendors").text(titolo);

    for (var i = 0; i < (venditori.length)-1; i++) {
        $("#content-modal-vendors").append("<div class=\"col-md-8 mod\"><a href=\"\">" + venditori[i] + "</a></div>\n" +
        "                                    <div class=\"col-md-4 mod text-left\">\n" +
        "                                        <span class=\"white valign\">da " + prezzi[i] + " €</span>\n" +
        "                                        <span class=\"float-right\"><i class=\"fa fa-angle-double-right white valign\" aria-hidden=\"true\"></i></span>\n" +
        "                                    </div>");
    }
}