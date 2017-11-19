function removeAddress(addressID) {
    $.ajax({
        type: "POST",
        url: "/restricted/removeaddress",
        data: {
            'addressID': addressID
        },
        success: function(result){
            $("#"+addressID).fadeOut(300);
        }
    });
}