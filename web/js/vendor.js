var right = 0;
var fixNavbar = function() {
	
	var height = $(window).height() - 61;

	console.log("Document " + height);

	if(right > height){
		height = right + 30;
	}
	$('#navbarFix').remove();
	$('body').append("<style id='navbarFix' type='text/css'>@media screen and (min-width: 992px) { #navbar { height: " + height +"px !important; } }</style>");
	console.log("Navbar height set to " + height);

};

$(document).ready(function() {

	right = $('#panelContainer').height() + 30 + $('#productsLeftContainer').height() + 35;
	console.log("Right " + right);

	fixNavbar();
	$( window ).resize(fixNavbar);

});

document.getElementById('upload').onchange = uploadOnChange;

function uploadOnChange() {
    var filename = this.value;
    var lastIndex = filename.lastIndexOf("\\");
    if (lastIndex >= 0) {
        filename = filename.substring(lastIndex + 1);
    }
    document.getElementById('filename').value = filename;
}