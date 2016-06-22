$(document).ready(documentReady);

var img = new Array();

var currentImage = null;

var lenght = null;

var device_name = null;

var category = null;

var sl_info = ""; //used only if the user come in this page from a Smart Life association

var assistance_info = ""; //used only if the user come in this page from an assistance association

function documentReady(){
    
    //Update the global variables:
    
    device_name = $('#device_name').html();
    
    currentImage = $("#img_panel").attr("src");
    
    category = $("#category_info").attr("content");
    
    sl_info = $("#sl_info").attr("content");
    
    assistance_info = $("#assistance_info").attr("content");
    
    preloadImage(); //preload the URLs
    
    //Set the event listeners:
	
    $("#section1").on("click",loadCharacteristics);
    
    $("#section2").on("click",loadSpecification);
    
    $("#section3").on("click",loadPromo);
    
    $("#previous_image").on("click", previous_image);
    
    $("#next_image").on("click", next_image);
    
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
    
    /*
    $(".top_landmark").mouseenter(function (e) {
    
       $(".top_landmark").attr("class","active top_landmark");
    });
    $(".top_landmark").mouseleave(function (e) {
       $(".top_landmark").attr("class","top_landmark");
    });*/
        
    console.log("I'm ready");

}

//loads the "Caratteristiche" section
function loadCharacteristics(){
  
    console.log(""+device_name);
    
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getDeviceCharacteristics.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $("#sect3").removeAttr("class");
            $('#sect1').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#description").empty();
            $("#main_content").empty();
            
            //Update with new content
            $("#description").append(response_parsed[0].description);
            
            $("#main_content").append("<h4>Caratteristiche principali: </h4>");
            
            var p = document.createElement("p");
            p.innerHTML = response_parsed[0].characteristics;
            $("#main_content").append(p);
            
            $("#main_content").append("<br>");
            
            var b = document.createElement("b");
            b.innerHTML = ("Prezzo: " + response_parsed[0].price + " €");
            $("#main_content").append(b);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}

//loads the "Specifiche tecniche" section
function loadSpecification(){
  
    console.log(""+device_name);
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getDeviceSpecification.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect3").removeAttr("class");
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
                
                th.innerHTML= response_parsed[spec].spec_name;
                tr.appendChild(th);
                td.innerHTML= response_parsed[spec].content;
                tr.appendChild(td);
                
                tbody.appendChild(tr);
                
            }
            $("#main_content").append("<h4>Specifiche tecniche:</h4><br>");
            $("#main_content").append(table);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}

//loads the "Promozioni" section
function loadPromo(){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getDevicePromo.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect2").removeAttr("class");
            $('#sect3').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            
            //Update with new content
            $("#main_content").append("<h4>Offerte speciali per questo prodotto</h4><br>");
            
            for (var promo in response_parsed){
            
            	var div = document.createElement("div");
                
                var new_price = response_parsed[promo].new_price;
                var payment_inst = response_parsed[promo].payment_instalments;
                var other_promo = response_parsed[promo].other_promo;
            
                if (new_price != ""){
                	var b = document.createElement("b");
                    b.innerHTML = "Prezzo in promozione: ";
                    var p = document.createElement("p");
                    p.innerHTML = new_price;
                    div.appendChild(b);
                    div.appendChild(p);
                }
                
                if (payment_inst != ""){
                	var b = document.createElement("b");
                    b.innerHTML = "Offerta a rate: ";
                    var p = document.createElement("p");
                    p.innerHTML = payment_inst;
                    div.appendChild(b);
                    div.appendChild(p);
                }
                
                if (other_promo != ""){
                	var b = document.createElement("b");
                    b.innerHTML = "Nell'offerta è incluso inoltre: ";
                    var p = document.createElement("p");
                    p.innerHTML = other_promo;
                    div.appendChild(b);
                    div.appendChild(p);
                }
                
                $("#main_content").append(div);
                
            }
            
            
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call: no promo associated to this product?");
        }
        
    });
    
	return false; //to avoid the scrolling down of the page
}

//"Preload" the URLs of the images (not the actual images)
function preloadImage(){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getDeviceImages.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            
            lenght = 0;
            for (var elem in response_parsed){
                lenght ++;
            }
            console.log("Json array lenght: " + lenght);
            
       
            for (var elem in response_parsed){
               img[elem] = "../img/" + response_parsed[elem].url;
               //console.log("Preload of image: " + response_parsed[elem].url)
            }
            console.log("Image preload success!");
            
            if (currentImage == null){ //safety measure + used when going to the next product
                
                $("#img_panel").attr("src", img[0]);
                //console.log("Content of the img 0: " + img[0]);
                currentImage = img[0];
                
            }
           
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false;
}


function next_image(){
    
    for(i = 0; i < lenght; i++){
    
        //cycle the images:
        if (img[i] == currentImage){
            
            if(i + 1 < lenght){
                //console.log("next image: " + img[i+1]);
                currentImage = img[i+1];
                $("#img_panel").attr("src", img[i+1]);
                return false;
            }else{
                //console.log("next image: " + img[0]);
                currentImage = img[0];
                $("#img_panel").attr("src", img[0]);
                return false;
            }
            
        }
        
    }
}

function previous_image(){
    
    for(i = 0; i < lenght; i++){
    
        //cycle the images:
        if (img[i] == currentImage){
            
            if(i -1 >= 0){
                //console.log("previous image: " + img[i-1]);
                currentImage = img[i-1];
                $("#img_panel").attr("src", img[i-1]);
                return false;
            }else{
                //console.log("previous image: " + img[lenght-1]);
                currentImage = img[lenght-1];
                $("#img_panel").attr("src", img[lenght-1]);
                return false;
            }
            
        }
        
    }
}

//Update part of the page in order to display the next or previous product in the group
function move_in_group(event){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/get" + event.data.direction + "DeviceInGroup.php",
        data: {name:device_name, category:category, sl_info:sl_info, assistance_info:assistance_info},
        success: function(response) {
			
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
                $("#sect3").removeAttr("class");
                $('#sect1').attr('class', 'active');

                //remove and clear useless tags + reset image:
                $("#description").empty();
                $("#main_content").empty();
                $("#device_name").empty();
                $("#price").empty();
                $("#orientation2").empty();
                img.length = 0; //empty images URLs' array
                currentImage = null;
                $("#img_panel").attr("src", "");
                $("#sect3").remove();
                $(".spacing").remove();

                /* Update with new content and update the vars: */
                $("#device_name").append(response_parsed[0].name);
                device_name = response_parsed[0].name;
                preloadImage(); //must be done after resetting array and current image, and after setting the new name
                check_promotion(); //must be done after setting the new name and resetting the previous promotions
                updateAvailableSL();
                updateAssistanceFor();
                $("#orientation2").append(device_name); //update orientation info
                disable_activate_group_links(event.data.direction); //update the red/blue aspect of the group links
                $("#description").append(response_parsed[0].description);
                $("#main_content").append("<h4>Caratteristiche principali: </h4><br>");

                var p = document.createElement("p");
                p.innerHTML = response_parsed[0].characteristics;
                $("#main_content").append(p);

                $("#main_content").append("<br>");

                var b = document.createElement("b");
                b.innerHTML = ("Prezzo: " + response_parsed[0].price + " €");
                $("#main_content").append(b);
                
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
        url: "http://timhypermediaproject2016.altervista.org/php/get" + direction + "DeviceInGroup.php",
        data: {name:device_name, category:category, sl_info:sl_info, assistance_info:assistance_info},
        success: function(response) {
			
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

//adds "Promozione" on the lateral bar only if there is at least one associated to the device 
function check_promotion(){
    
     $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getDevicePromo.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            //Iff json response is empty, no promotions are associated to this product.
            if (array_lenght > 0){
                //add the lateral bar:
                var li = document.createElement("li");
                var a = document.createElement("a");
                li.setAttribute("id","sect3");
                a.setAttribute("id","section3");
                a.setAttribute("href", "");
                a.innerHTML = "Promozione";
                li.appendChild(a);
                $("#device_box").append(li);
                $("#section3").on("click",loadPromo); //add again the proper event
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}

function updateAvailableSL(){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getAvailableSL.php",
        data: {name:device_name},
        success: function(response) {
			
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            
            //Remove the old SL services:
            $("#availableSL_list").remove();
            $("#availableSL_title").remove(); //remove the title
            
            if (array_lenght > 0){
                
                //Add the title and the the ul list tag
                var title = "<h4 id='availableSL_title'>Dai un'occhiata ai servizi Smart Life associati:</h4>";
                var ul = "<ul class='nav nav-pills nav-stacked' id='availableSL_list'>";
                $("#availableSL_box").append(title + ul);
                
                for(var avSL in response_parsed){
                    
                    //add the available SL in the lateral bar:
                    var li = document.createElement("li");
                    var a = document.createElement("a");
                    li.setAttribute("class","availableSL");//MAY BE REMOVED
                    a.setAttribute("href", ""); //TODO SET THE HREF LINK TO THE PROPER PHP FILE
                    a.innerHTML = response_parsed[avSL].name;
                    li.appendChild(a);
                    $("#availableSL_list").append(li);
                    
                }
                
                $("#availableSL_box").append("</ul>");
                $("#availableSL_box").after("<br class='spacing'>");
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}

function updateAssistanceFor(){
    
        $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getAssistanceFor.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging 
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            
            //Remove the old SL services:
            $("#assistanceFor_list").remove();
            $("#assistanceFor_title").remove(); 
            
            if (array_lenght > 0){
                
                //Add the title and the the ul list tag
                var title = "<h4 id='assistanceFor_title'>Servizi assistenza associati:</h4>";
                var ul = "<ul class='nav nav-pills nav-stacked' id='assistanceFor_list'>";
                $("#assistanceFor_box").append(title + ul);
                
                //add the assistance_for button in the lateral bar:
                var li = document.createElement("li");
                var a = document.createElement("a");
                li.setAttribute("class","assistanceFor");//MAY BE REMOVED
                var orientation = $("#orientation").text();
                var orientation_slice = orientation.substring(0, orientation.length-2);
                var flag ="";
                if(category == "sl_relation" || category=="assistance_relation"){
                    flag="&default=true";
                }
                var assistance_link = "http://timhypermediaproject2016.altervista.org/php/AssistanceFor.php?prodX=" + 
                                    encodeURI(device_name) + "&catX=" + encodeURI(category) + 
                                    "&orientation=" + orientation_slice + flag;
                a.setAttribute("href", assistance_link);
                a.innerHTML = "Assistenza";
                li.appendChild(a);
                $("#assistanceFor_list").append(li);
                    
                $("#assistanceFor_box").append("</ul>");
                $("#assistanceFor_box").after("<br class='spacing'>");
                
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}