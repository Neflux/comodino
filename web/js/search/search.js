var i_quanti = 10;
var stelle = 0;

$( document ).ready(function() {
    $("#ex16b").slider({ min: 0, max: 10, value: [0, 10], focus: true });
});

function filterVendor(elem)
{
    var url = window.location.href;
    var uri = "&vendor=" + encodeURI(elem.name);
    if (elem.checked == false)
        window.location.href = url + uri;
    else
    {
        window.location.href = url.replace(uri,"");
    }
}

function filterGeo(elem)
{
    var url = window.location.href;
    var uri = "&geo=" + encodeURI(elem.name);
    if (elem.checked == false)
        window.location.href = url + uri;
    else
    {
        window.location.href = url.replace(uri,"");
    }
}

function openModal(titolo)
{
    $("#content-modal-vendors").empty();
    $("#card_titolo_vendors").text(titolo);


    var post = {nome_prodotto:titolo,quanti:i_quanti,offset:0,getQuantity:"0"};
    $.post( "/getVendorServlet", post)
        .done(function( data ) {
            $("#content-modal-vendors").html(data);

            $('#vendorsModal').modal('show');
        });

    $.post( "/getVendorServlet", {nome_prodotto:titolo,getQuantity:"1"})
        .done(function( quantity ) {
            if (quantity < i_quanti)
                i_quanti = quantity;

            $("#pagination_numbers_vendors").html("<h6 style=\"color:#ffffff\">Mostrando i risultati 1-" + i_quanti + " su " + quantity + "</h6>");
            $("#footer_vendors").html("<div class=\"row\">" +
                "<div class=\"col-md-6\">" +

                "</div>" +
                "<div class=\"col-md-6\">" +
                "<a href=\"#\" onclick=\"addOffset('" + titolo + "'," + 0 + ",'" + quantity + "')\">Mostra ancora&nbsp&nbsp<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i></a>" +
                "</div>" +
                "</div>");
        });
}

function addOffset(titolo,offset,tot)
{
    offset += i_quanti;
    if ( (offset + i_quanti) <= tot)
    {
        $("#footer_vendors").html("<div class=\"row\">" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"lessOffset('" + titolo + "'," + offset + ",'" + tot + "')\"><i class=\"fa fa-caret-left\" aria-hidden=\"true\"></i>&nbsp&nbspMostra meno\n</a>" +
            "</div>" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"addOffset('" + titolo + "'," + offset + ",'" + tot + "')\">Mostra ancora&nbsp&nbsp<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i></a>" +
            "</div>" +
            "</div>");
    }
    else
    {
        $("#footer_vendors").html("<div class=\"row\">" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"lessOffset('" + titolo + "'," + offset + ",'" + tot + "')\"><i class=\"fa fa-caret-left\" aria-hidden=\"true\"></i>&nbsp&nbspMostra meno\n</a>" +
            "</div>" +
            "<div class=\"col-md-6\">" +
            "</div>" +
            "</div>");
    }

    var post = {nome_prodotto:titolo,quanti:i_quanti,offset:offset,getQuantity:"0"};
    $.post( "/getVendorServlet", post)
        .done(function( data ) {
            $("#content-modal-vendors").html(data);
            var fine_offset = (offset+i_quanti) > tot ? tot : (offset+i_quanti);
            $("#pagination_numbers_vendors").html("<h6 style=\"color:#ffffff\">Mostrando i risultati " + (offset+1) + "-" + fine_offset + " su " + tot + "</h6>");
        });
}

function lessOffset(titolo,offset,tot)
{
    offset -= i_quanti;

    if (offset == 0) {
        $("#footer_vendors").html("<div class=\"row\">" +
            "<div class=\"col-md-6\">" +
            "</div>" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"addOffset('" + titolo + "'," + offset + ",'" + tot + "')\">Mostra ancora&nbsp&nbsp<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i></a>" +
            "</div>" +
            "</div>");
    }
    else
    {
        $("#footer_vendors").html("<div class=\"row\">" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"lessOffset('" + titolo + "'," + offset + ",'" + tot + "')\"><i class=\"fa fa-caret-left\" aria-hidden=\"true\"></i>&nbsp&nbspMostra meno\n</a>" +
            "</div>" +
            "<div class=\"col-md-6\">" +
            "<a href=\"#\" onclick=\"addOffset('" + titolo + "'," + offset + ",'" + tot + "')\">Mostra ancora&nbsp&nbsp<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i></a>" +
            "</div>" +
            "</div>");
    }

    var post = {nome_prodotto:titolo,quanti:i_quanti,offset:offset,getQuantity:"0"};
    $.post( "/getVendorServlet", post)
        .done(function( data ) {
            $("#content-modal-vendors").html(data);
            $("#pagination_numbers_vendors").html("<h6 style=\"color:#ffffff\">Mostrando i risultati " + (offset+1) + "-" + (offset+i_quanti) + " su " + tot + "</h6>");
        });

}

function resetStar()
{
    stelle = 0;
    for (i = 0; i <= 5; i++)
        $("#stella_" + i).attr("class","fa fa-star-o rating_star");
}

function setStar(id)
{
    stelle_hover = id.id.substr(7,id.id.lenght);

    for (i = 0; i <= stelle_hover; i++)
        $("#stella_" + i).attr("class","fa fa-star rating_star");

    for (i = parseInt(stelle_hover)+1; i <= 5; i++)
        $("#stella_" + i).attr("class","fa fa-star-o rating_star");

    stelle = stelle_hover;
}

function setStarFilter()
{
    var url = window.location.href;
    window.location.href = updateURLParameter(url,"minrat",(parseInt(stelle)+1));

}

function updateURLParameter(url, param, paramVal)
{
    var TheAnchor = null;
    var newAdditionalURL = "";
    var tempArray = url.split("?");
    var baseURL = tempArray[0];
    var additionalURL = tempArray[1];
    var temp = "";

    if (additionalURL)
    {
        var tmpAnchor = additionalURL.split("#");
        var TheParams = tmpAnchor[0];
        TheAnchor = tmpAnchor[1];
        if(TheAnchor)
            additionalURL = TheParams;

        tempArray = additionalURL.split("&");

        for (var i=0; i<tempArray.length; i++)
        {
            if(tempArray[i].split('=')[0] != param)
            {
                newAdditionalURL += temp + tempArray[i];
                temp = "&";
            }
        }
    }
    else
    {
        var tmpAnchor = baseURL.split("#");
        var TheParams = tmpAnchor[0];
        TheAnchor  = tmpAnchor[1];

        if(TheParams)
            baseURL = TheParams;
    }

    if(TheAnchor)
        paramVal += "#" + TheAnchor;

    var rows_txt = temp + "" + param + "=" + paramVal;
    return baseURL + "?" + newAdditionalURL + rows_txt;
}