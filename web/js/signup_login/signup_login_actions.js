function show_login()
{
	$('.nologin').animate({opacity: 0}, 500);
	$('.login').animate({marginTop:'-50px'}, 500);
	$('#card_titolo').animate({opacity: 0}, 250, function () {
		$('#card_titolo').text("Login");
		$('#card_titolo').animate({opacity: 1}, 250);
	});
	$('#card_change_button').html('Want to <a href="#" onclick="show_signup();">signup?</a>');
}

function show_signup()
{
	$('.nologin').animate({opacity: 1}, 500);
	$('.login').animate({marginTop:'0px'}, 500);
	$('#card_titolo').animate({opacity: 0}, 250, function () {
		$('#card_titolo').text("Signup");
		$('#card_titolo').animate({opacity: 1}, 250);
	});
	$('#card_change_button').html('Want to <a href="#" onclick="show_login();">login?</a>');
}