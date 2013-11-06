$(document).ready(function(){
	
	$('#signup').on("click", function(){
		$('.signlog').css({ "display" : "block" })
	});

	$('#login').on("click", function(){

		var leftSide = $('#formsleftside');
		var rightSide = $('#formsrightside');
		var signInForm = $('.signupformouter');
		var logInForm = $('.loginwhichcnt');

		$('.signupright').show();
		$('.loginbelow').hide();

		signInForm.appendTo(rightSide);
		logInForm.appendTo(leftSide);

		$('.signlog').css({ "display" : "block" })

		
	});
	
});