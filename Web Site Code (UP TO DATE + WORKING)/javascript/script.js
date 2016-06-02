$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $("#butt1").on("click",loadMoreClicked);

}

function loadMoreClicked(){

    console.log("You clicked");
    
    var id="sl";
    
    /* WITH HTML, WORKING 
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getDescription.php", //Relative or absolute path to file.php file
       
        success: function(response) {
        	console.log("Ajax call: success!");
            console.log("Response: " +  response);
            $("#result").html(" "+response);
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
    */
    
    /* WITH JSON, WORKING */
    $.ajax({
        method: "POST",
        //dataType: "json", //type of data
        url: "http://timhypermediaproject2016.altervista.org/php/getDescription.php", 
        success: function(response) {
			
        	console.log("Ajax call: success!");
            console.log(JSON.parse(response));

            
            $("#result").html(" "+response);
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
    

}
