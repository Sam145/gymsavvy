$(document).ready(function(){


	$('#login').on("click", function(){

		var leftSide = $('#formsleftside');
		var rightSide = $('#formsrightside');

		var signInForm = $('.signupformouter');
		var logInForm = $('.loginwhichcnt');

		$('.loginbelow').hide();
		$('.signupright').show();

		signInForm.appendTo(rightSide);
		logInForm.appendTo(leftSide);

		$('.signlog').css({ "display" : "block" })		
	});

	$('#signup').on("click", function(){

		var leftSide = $('#formsleftside');
		var rightSide = $('#formsrightside');

		var signInForm = $('.signupformouter');
		var logInForm = $('.loginwhichcnt');

		$('.loginbelow').show();
		$('.signupright').hide();

		signInForm.appendTo(leftSide);
		logInForm.appendTo(rightSide);

		$('.signlog').css({ "display" : "block" })

		
	});
	
});