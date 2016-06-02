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
        //crossDomain: true, //localhost purposes
        url: "http://timhypermediaproject2016.altervista.org/php/getDescription.php", 
        success: function(response) {
			
        	console.log("Ajax call: success!");
            console.log(JSON.parse(response));
            //var parsed_data = JSON.parse(response); DOESN'T WORK!??!?!
            
            //var html="<table border=1 style='border-collapse:collapse'>";
            //response.forEach(function(obj,index){html+="<tr><td>"+index+"<td>"+obj.row1+"</td><td>"+obj.row2+"</td><td>"+obj.row3+"</td></tr>";});
			//	html+="</table>";

			//jQuery(html).appendTo("#result");
            
            //console.log(JSON.parse(response));
            //console.log("Response: " +  response);
            
            $("#result").html(" "+response); // WORKS
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
    

}
