$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $("#section2").on("click",loadSpecification);

}

function loadSpecification(){

    console.log("You clicked Specification");
    
    var device_name = $('#device_name').html();  //dovremmo prendere il nome passandolo con php o in un modo non così facilmente manipolabile 
    
    console.log(""+name);
    
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getSpecification.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            //var currentSelection = $( "li" ).attr( "class" );
            //currentSelection.removeAttr("active");
            
            //remove or clear useless tags:
            $("#main_content").html("");
            $("#price").remove();
            
            // update with new content
            
            $("#main_content").html(" "+ response_parsed[0].content);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
   

}
