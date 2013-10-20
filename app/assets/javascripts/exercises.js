$(document).ready(function(){

	$("#absbtn").on("click", function(){
		$("#absmove").fadeIn();
		});

	$("#armsbtn").on("click", function(){
		$("#armsmove").fadeIn();
		});

	$("#backbtn").on("click", function(){
		$("#backmove").fadeIn();
		});

	$("#cardiobtn").on("click", function(){
		$("#cardiomove").fadeIn();
		});

	$("#chestbtn").on("click", function(){
		$("#chestmove").fadeIn();
		});

	$("#legsbtn").on("click", function(){
		$("#legsmove").fadeIn();
		});

	$("#shouldersbtn").on("click", function(){
		$("#shouldersmove").fadeIn();
		});

	$(".buttonexerciseshide").on("click", function(){
		$(this).closest(".move").fadeOut();
		});


});