$(document).ready(documentReady);

function documentReady(){
    
    //Set the event listeners:
	
    $("#section1").on("click",loadDescription);
    
    $("#section2").on("click",loadForInvestors);
    
    console.log("I'm ready");

}

//loads the "Aspetti di mercato" section
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

//loads the "Per gli investitori" section
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

