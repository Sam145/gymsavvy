$(document).ready(function(){

	$(function() {
    $( "#sortable" ).sortable({
    	stop: function(){
    		var listItems = $( "#sortable li" )
    		listItems.each(function( index ){
    			$(this).find(".numberspan").text( index + 1 );
    			$(this).find(".seq").val( index + 1 );
    		});
    	}
    });

    $( "#sortable" ).disableSelection();

      });


});

    	