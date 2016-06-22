$(document).ready(documentReady);

var assistance_name = null;

var category = null;

var device_info = ""; //used only if the user come in this page from a Device association

function documentReady(){
    
    //Update the global variables:
    
    assistance_name = $('#assistance_name').html();
    
    category = $("#category_info").attr("content");
    
    device_info = $("#device_info").attr("content");
    
    //Set the event listeners:
	
    $("#section1").on("click",loadCharacteristics);
    
    $("#section2").on("click",loadFAQs);
    
    $("#next_in_group").on("click", {direction: "Next"}, move_in_group);
    
    $("#previous_in_group").on("click", {direction: "Previous"}, move_in_group);
    
    //Some modification to improve the aesthetic:
    $("#previous_in_group").mouseenter(function (e) {
       $("#previous_in_group").css("text-decoration","underline"); 
    });
    $("#next_in_group").mouseenter(function (e) {
       $("#next_in_group").css("text-decoration","underline"); 
    });
    
     $("#previous_in_group").mouseleave(function (e) {
       $("#previous_in_group").css("text-decoration","none"); 
    });
    $("#next_in_group").mouseleave(function (e) {
       $("#next_in_group").css("text-decoration","none"); 
    });
    
    console.log("I'm ready");

}

//loads the "Caratteristiche" section
function loadCharacteristics(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getAssistanceCharacteristics.php",
        data: {name:assistance_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $('#sect1').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            
            //Update with new content
            $("#main_content").append("<br><p>" + response_parsed[0].description + "</p>");
            
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}

//loads the "FAQs" section
function loadFAQs(){
  
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getAssistanceFAQs.php",
        data: {name:assistance_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $('#sect2').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            
            //Update with new content
            
            var table = document.createElement("table");
            table.setAttribute("class", "table table-condensed");
            var tbody = document.createElement("tbody");
            table.appendChild(tbody);
            
            for (var spec in response_parsed){
				var tr = document.createElement("tr");
                var th = document.createElement("th");
                var td = document.createElement("td");
                
                th.innerHTML= response_parsed[spec].question;
                tr.appendChild(th);
                td.innerHTML= response_parsed[spec].answer;
                tr.appendChild(td);
                
                tbody.appendChild(tr);
                
            }
            $("#main_content").append("<br><h4>Domande frequenti:</h4><br>");
            $("#main_content").append(table);
            
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}


//Update part of the page in order to display the next or previous product in the group
function move_in_group(event){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/get" + event.data.direction + "AssistanceInGroup.php",
        data: {name:assistance_name, category:category, device_info:device_info},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging
            var response_parsed = JSON.parse(response);
            
            lenght = 0;
            for (var elem in response_parsed){
                lenght ++;
            }
            if (lenght == 0){ 
                //extra safety measure: if the user has been able to click on "successivo" or "precedente" even if 
                //there are no more products, then do nothing:
                return false;
                
            }else{
                
                //update the lateral bar:
                $("#sect2").removeAttr("class");
                $('#sect1').attr('class', 'active');

                //remove and clear useless tags + reset image:
                $("#main_content").empty();
                $("#assistance_name").empty();
                $("#orientation2").empty();
                $("#sect2").remove();
                $(".spacing").remove();

                /* Update with new content and update the vars: */
                $("#assistance_name").append(response_parsed[0].name);
                assistance_name = response_parsed[0].name;
                check_FAQs(); //must be done after setting the new name and resetting the previous promotions
                updateForDevice2();
                $("#orientation2").append(assistance_name); //update orientation info
                disable_activate_group_links(event.data.direction); //update the red/blue aspect of the group links
                
                $("#main_content").append("<br><p>" + response_parsed[0].description + "</p>");
                
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
}

//select the red (deactivated) or blue (activated) aspect of the group links
function disable_activate_group_links(direction){
    
    $.ajax({ //check if there is a next/previous product
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/get" + direction + "AssistanceInGroup.php",
        data: {name:assistance_name, category:category, device_info:device_info},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response)); 
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            if (array_lenght == 0){ //disable link
                if (direction=="Previous"){ //if we are goind back...
                    $("#previous_in_group").css("color", "red");
                    $("#previous_in_group").css("text-decoration","none"); 
                    $("#next_in_group").css("color", "#337ab7");//reactivate next links
                }else{ //if we are going forward:
                    $("#next_in_group").css("color", "red");
                    $("#next_in_group").css("text-decoration","none"); 
                    $("#previous_in_group").css("color", "#337ab7");//reactivate previous links
                }
            }else{
                
                $("#previous_in_group").css("color", "#337ab7");
                $("#next_in_group").css("color", "#337ab7");
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}

//adds "FAQs" on the lateral bar only if there is at least one associated to the assistance 
function check_FAQs(){
    
     $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getAssistanceFAQs.php",
        data: {name:assistance_name},
        success: function(response) {
			
        	console.log("FAQs: ");  
            console.log(JSON.parse(response));  // debugging 
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            //Iff json response is empty, no FAQs are associated to this assistance.
            if (array_lenght > 0){
                //add the lateral bar:
                var li = document.createElement("li");
                var a = document.createElement("a");
                li.setAttribute("id","sect2");
                a.setAttribute("id","section2");
                a.setAttribute("href", "");
                a.innerHTML = "FAQs";
                li.appendChild(a);
                $("#assistance_box").append(li);
                $("#section2").on("click",loadFAQs); //add again the proper event
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call: no promo associated to this product?");
        }
        
    });
    
	return false; 
    
}


function updateForDevice2(){
    
        $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getForDevice2.php",
        data: {name:assistance_name},
        success: function(response) {
			
        	console.log("updateForDevice2:");  
            console.log(JSON.parse(response));  // debugging 
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            
            //Remove the old devices:
            $("#forDevice2_list").remove();
            $("#forDevice2_title").remove(); 
            
            if (array_lenght > 0){
                
                //Add the title and the the ul list tag
                var title = "<h4 id='forDevice2_title'>Dai un'occhiata ai prodotti associati:</h4>";
                var ul = "<ul class='nav nav-pills nav-stacked' id='forDevice2_list'>";
                $("#forDevice2_box").append(title + ul);
                
                //add the for_device2 button in the lateral bar:
                var li = document.createElement("li");
                var a = document.createElement("a");
                li.setAttribute("class","forDevice2");//MAY BE REMOVED
                var flag="";
                if(category == "device_relation"){
                    flag="&default=true";
                }
                var forDevice2_link = "http://timhypermediaproject2016.altervista.org/php/For_Device2.php?assX=" + 
                                    encodeURI(assistance_name) + "&catX=" + encodeURI(category) + 
                                    "&orientation=" + orientation + flag;
                a.setAttribute("href", forDevice2_link);
                a.innerHTML = "Prodotti";
                li.appendChild(a);
                $("#forDevice2_list").append(li);
                    
                $("#forDevice2_box").append("</ul>");
                $("#forDevice2_box").after("<br class='spacing'>");
                
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}
