$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $(".cat").click(function(event) {
    var catX = $(event.target).text();
	console.log("sono catx sul client: "+catX);
	loadCatPage(catX);
	
	
	
    });
    
    
     $(".name_elem").click(function(event) {
    var elem = $(event.target).text();
	console.log("sono elem sul client: "+elem);
    var catX = $("#title").text();
	loadElemPage(elem, catX);
	
	
	
    });

}





function loadCatPage(catX){
	
	var url="../php/getElementOfCategory.php?catX=" + catX;
    window.location.href = url;

}

function loadElemPage(elem, catX){
	var orientation = $("#orientation").text();
	var url="../php/getMultiTopic.php?name=" + elem + "&cat=" + catX+"&orientation=" + orientation;
    window.location.href = url;

}