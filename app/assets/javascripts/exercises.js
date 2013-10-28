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
		$("#cardiomove").fadeIn(function(){

					$(".moreless").each(function(){

			        var theContainer = $(this);

			        var contentHeight = theContainer.find(".addDescriptionContent").height();
			        var more = theContainer.find(".addMore").hide();

			        theContainer.css({ "height" : 125 });
			        theContainer.find(".imagespace").css({ "height" : 125 });
			        theContainer.find(".addDescriptionContent").css({  "height" : "70px",
			                                                        "overflow" : "hidden" });
			        theContainer.find(".less").hide();


			        if(contentHeight > 70) {
			            more.show()
			            more.click(function(){ 

			                theContainer.css({ "height" : "100%" });
			                theContainer.find(".imagespace").css({ "height" : "100%",
			                                                        "margin-bottom" : "20px;"
			                                                         });
			                theContainer.find(".addDescriptionContent").css({  "height" : "100%",
			                                                                "overflow" : "visible",
			                                                                 });
			                theContainer.find(".less").show();  
			                more.hide();

			                $(".less").click(function(){
			                    theContainer.css({ "height" : 125 });
			                    theContainer.find(".imagespace").css({ "height" : 125 });
			                    theContainer.find(".addDescriptionContent").css({  "height" : "70px",
			                                                                    "overflow" : "hidden" });
			                    theContainer.find(".less").hide()
			                    more.show()
			                });
			            });

			        };
			    });

		}
		);
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

		$(this).closest(".move").find(".moreless").each(function(){
			$(this).find(".addDescriptionContent").css({ "height" : "100%" });
		})

		$(this).closest(".move").fadeOut();
	});




	$(".showexercise").each(function(){

		var theContainer = $(this).closest(".showexercise")

		var contentHeight = $(this).find(".descriptionContent").height();
		var more = $(this).find(".more").hide();

		theContainer.css({ "height" : 125 });
		theContainer.find(".imagespace").css({ "height" : 125 });
		theContainer.find(".descriptionContent").css({ 	"height" : "75px",
														"overflow" : "hidden" });
		theContainer.find(".less").hide();


		if(contentHeight > 75) {
			more.show()
			more.click(function(){ 

				theContainer.css({ "height" : "100%" });
				theContainer.find(".imagespace").css({ "height" : "100%",
														"margin-bottom" : "20px;"
														 });
				theContainer.find(".descriptionContent").css({ 	"height" : "100%",
																"overflow" : "visible",
																 });
				theContainer.find(".less").show();	
				more.hide();

				$(".less").click(function(){
					theContainer.css({ "height" : 125 });
					theContainer.find(".imagespace").css({ "height" : 125 });
					theContainer.find(".descriptionContent").css({ 	"height" : "75px",
																	"overflow" : "hidden" });
					theContainer.find(".less").hide()
					more.show()
				});
			});
		};
	});

	




});