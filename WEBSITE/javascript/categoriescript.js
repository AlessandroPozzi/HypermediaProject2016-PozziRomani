$(document).ready(documentReady);

/*
This script is used for 2 pages that are dynamically created from "categories.html".
*/
function documentReady(){
    console.log("I'm ready");

    //present only in pages that display the list of categories available
    $(".cat").click(function(event) {
    var catX = $(event.target).text();
	loadCatPage(catX);
	
    });
    
    //used only by pages that display the list of products (devices, assistances, smart life) available
     $(".name_elem").click(function(event) {
    var elem = $(event.target).text();
    var catX = $("#title").text();
	loadElemPage(elem, catX);
	
	
	
    });

}


/**
* Set the url of this page to be the url of a PHP page that returns an HTML
* page dynamically created. This function is used to load the content of a category.
*/
function loadCatPage(catX){
	
	var url="../php/getElementOfCategory.php?catX=" + catX;
    window.location.href = url;

}

/**
* Set the url of this page to be the url of a PHP page that returns an HTML
* page dynamically created. This function is used to load a specific selected product
* (smart life, assistance or device)
*/
function loadElemPage(elem, catX){
	var orientation = $("#orientation").text();
	var url="../php/getMultiTopic.php?name=" + elem + "&cat=" + catX+"&orientation=" + orientation;
    window.location.href = url;

}