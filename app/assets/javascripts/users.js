$(document).ready(function(){
	

	$('#login').on("click", function(){
		$('.signlog').css({ "display" : "block" })
	});

	$('#signup').on("click", function(){

		var leftSide = $('#formsleftside');
		var rightSide = $('#formsrightside');

		var signInForm = $('.signupformouter');
		var logInForm = $('.loginwhichcnt');

		$('.signupright').hide();
		$('.loginbelow').show();

		signInForm.appendTo(leftSide);
		logInForm.appendTo(rightSide);

		$('.signlog').css({ "display" : "block" })

		
	});
	
});