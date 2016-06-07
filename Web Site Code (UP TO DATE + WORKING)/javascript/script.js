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
    
    /* WITH JSON, WORKING  */
    $.ajax({
        method: "POST",
        //dataType: "json", //type of data
        url: "http://timhypermediaproject2016.altervista.org/php/getDescription.php",
        data: {name:"Apple iPhone 6s 16GB"},
        success: function(response) {
			
        	console.log("Ajax call: success!");
            var json = JSON.parse(response);
            
            console.log(JSON.parse(response));
            //console.log("JAVASCRIPT REPORTING: JSON IS HERE: " + JSON.parse(response));
            //console.log( unescape(json[0].descrizione.replace(/\+/g, '%20')));//----
            
             //$("#result").html(response);
            $("#result").html(" "+ json[7].name);
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
   

}
