$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $(".group").on("click",loadPage);

}

function loadPage(){
	var high_cat=$(".group").attr("id");
	
	$.ajax({
        method: "POST",
        //dataType: "json", //type of data
       // crossDomain: true, //localhost purposes
        url: "http://timhypermediaproject2016.altervista.org/php/getCategories.php", //Relative or absolute path to file.php file
        data: {high_cat:high_cat},
        success: function(response) {
            $(document).html(response);
        },
        error: function(request,error) 
        {
            console.log("Error");
        }
    });
}