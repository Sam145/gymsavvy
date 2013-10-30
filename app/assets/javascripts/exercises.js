$(document).ready(function(){

// Onclick events for exercise buttons

	$("#absbtn").on("click", function(){
		$("#absmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#armsbtn").on("click", function(){
		$("#armsmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#backbtn").on("click", function(){
		$("#backmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#cardiobtn").on("click", function(){
		$("#cardiomove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#chestbtn").on("click", function(){
		$("#chestmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#legsbtn").on("click", function(){
		$("#legsmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$("#shouldersbtn").on("click", function(){
		$("#shouldersmove").fadeIn();
		moreAndLess(".editExercisebox", 70);
		});

	$(".buttonexerciseshide").on("click", function(){
		$(".move").find(".moreless").each(function(){
			$(".move").find(".addDescriptionContent").css({ "height" : "100%" });
		})
		$(this).closest(".move").fadeOut();
	});


// Creates more and less functionality for exercises list page

function moreAndLess(mainContainer, descriptionHeight) {

	$(mainContainer).each(function(){

		var theContainer = $(this);

		var contentHeight = $(this).find("#descriptionContent").height();
		var more = $(this).find("#more").hide();

		theContainer.css({ "height" : 125 });
		theContainer.find("#imageSpace").css({ "height" : 125 });
		theContainer.find("#descriptionContent").css({ 	"height" : descriptionHeight,
														"overflow" : "hidden" });
		theContainer.find(".less").hide();


		if(contentHeight > descriptionHeight) {

			more.show()
			more.click(function(){ 

				theContainer.css({ "height" : "auto" });
				theContainer.find("#imageSpace").css({ "height" : "100%",
														"margin-bottom" : "20px"
														 });
				theContainer.find("#descriptionContent").css({ 	"height" : "100%",
																	"overflow" : "visible",
																 });
				theContainer.find(".less").show();	
				more.hide();

				$(".less").click(function(){
					theContainer.css({ "height" : 125 });
					theContainer.find("#imageSpace").css({ "height" : 125 });
					theContainer.find("#descriptionContent").css({ 	"height" : descriptionHeight,
																	"overflow" : "hidden" });
					theContainer.find(".less").hide()
					more.show()
				});
			});
		};


	});

}

// Creates more and less functionality for exercises list page
moreAndLess(".exercisebox", 53);

// Creates more and less functionality for show page
moreAndLess(".showexercise", 75);




});