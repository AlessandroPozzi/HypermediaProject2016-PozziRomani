$(document).ready(documentReady);

function documentReady(){
    console.log("I'm ready");

    $("#butt1").on("click",loadMoreClicked);

}


function loadMoreClicked(){

    console.log("You clicked");
    
    var id="sl";
    
    $.ajax({
        method: "POST",
        dataType: "json", //type of data
        crossDomain: true, //localhost purposes
        url: "tim/getDescription.php", //Relative or absolute path to file.php file
        data: {pt:id},
        success: function(response) {
            $(".result").html(" "+response);
        },
        error: function(request,error) 
        {
            console.log("Error");
        }
    });
}








