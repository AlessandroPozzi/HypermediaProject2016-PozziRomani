$(document).ready(documentReady);

function documentReady(){
    
    //Set the event listeners:
	
    $("#section1").on("click",loadTestimonials);
    
    $("#section2").on("click",loadInnovations);
    
    $("#section3").on("click",loadProjects);
    
    console.log("I'm ready");

}

/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Testimonials" 
* section of the page. The Ajax Call sends to the php file the name of the required sub-single topic
* (that is "Testimonials"); expects as a response a JSON object cointaining the single topic's
* "Testimonials".
*/
function loadTestimonials(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getWhoweareContent.php",
        data: {name:"Testimonials"},
        success: function(response) {
			
            console.log("testimonials");
            
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $('#sect1').attr('class', 'active');
            $("#sect3").removeAttr("class");
            
            //remove and clear useless tags:
            $("#main_content").empty();
            $("#whoweare_title").empty();
            
            //Update with new content
            $("#main_content").append(response_parsed[0].content);
            $("#whoweare_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; 
}

/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "innovazione" 
* section of the page. The Ajax Call sends to the php file the name of the required sub-single topic
* (that is "innovazione"); expects as a response a JSON object cointaining the single topic's
* "innovazione".
*/
function loadInnovations(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getWhoweareContent.php",
        data: {name:"Innovazioni"},
        success: function(response) {
			
            console.log("innovations");
            
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect3").removeAttr("class");
            $('#sect2').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            $("#whoweare_title").empty();
            
            //Update with new content
            $("#main_content").append(response_parsed[0].content);
            $("#whoweare_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false;
}


/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "progetti" 
* section of the page. The Ajax Call sends to the php file the name of the required sub-single topic
* (that is "progetti"); expects as a response a JSON object cointaining the single topic's
* "progetti".
*/
function loadProjects(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getWhoweareContent.php",
        data: {name:"Progetti"},
        success: function(response) {
			
            console.log("progetti");
            
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $('#sect3').attr('class', 'active');
            $("#sect1").removeAttr("class");
            
            //remove and clear useless tags:
            $("#main_content").empty();
            $("#whoweare_title").empty();
            
            //Update with new content
            $("#main_content").append(response_parsed[0].content);
            $("#whoweare_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false;
}
