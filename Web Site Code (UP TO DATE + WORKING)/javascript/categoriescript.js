$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $(".high_cat").click(function(event) {
    var catX = $(event.target).text();
	var url="../php/getElementOfCategory.php?catX=" + catX;
	loadPage(catX);
	
	
	
    });

}





function loadPage(catX){
	
	var url="../php/getElementOfCategory.php?catX=" + catX;
	$.get( url, function( response ) {
       $( document ).html( response );
       alert( "Load was performed." );
});
}