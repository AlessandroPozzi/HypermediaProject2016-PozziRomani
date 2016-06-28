$(document).ready(documentReady);

function documentReady(){
    
    //Set the event listeners:
	
    $("#section1").on("click",loadDescription);
    
    $("#section2").on("click",loadForInvestors);
    
    console.log("I'm ready");

}

/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Aspetti di mercato" 
* section of the page. The Ajax Call sends to the php file the name of the required sub-single topic
* (that is, Aspetti di mercato); expects as a response a JSON object cointaining the single topic's
* "Aspetti di mercato".
*/
function loadDescription(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getBusinessContent.php",
        data: {name:"Aspetti di mercato"},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $('#sect1').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#description").empty();
            $("#business_title").empty();
            
            //Update with new content
            $("#description").append(response_parsed[0].content);
            $("#business_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}

/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Per gli investitori" 
* section of the page. The Ajax Call sends to the php file the name of the required sub-single topic
* (that is, Per gli investitori); expects as a response a JSON object cointaining the single topic's
* "Per gli investitori".
*/
function loadForInvestors(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getBusinessContent.php",
        data: {name:"Per gli investitori"},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $('#sect2').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#description").empty();
            $("#business_title").empty();
            
            //Update with new content
            $("#description").append(response_parsed[0].content);
            $("#business_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}

