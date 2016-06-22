$(document).ready(documentReady);

function documentReady(){
    
    //Set the event listeners:
	
    $("#section1").on("click",loadDescription);
    
    $("#section2").on("click",loadForInvestors);
    
    console.log("I'm ready");

}

//loads the "Descrizione" section
function loadDescription(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getGovernanceContent.php",
        data: {name:"Descrizione"},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $('#sect1').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            $("#governance_title").empty();
            
            //Update with new content
            var p = document.createElement("p");
            p.setAttribute("id","description");
            p.innerHTML = response_parsed[0].content;
            $("#main_content").append(p);
            $("#governance_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; 
}

//loads the "Per gli investitori" section
function loadForInvestors(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getGovernanceContent.php",
        data: {name:"Governance"},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $('#sect2').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            $("#governance_title").empty();
            
            //Update with new content
            $("#main_content").append(response_parsed[0].content);
            $("#governance_title").append(response_parsed[0].title);

        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false;
}

