$(document).ready(documentReady);

var sl_name = null; //the name of this smart life product

var category = null; //stores the category of smart life from which the page was loaded, or the relation info

var sl_directory = "SmartLifeMultiTopic/"; //directory that contains the php files used by this page

function documentReady(){
    
    //Update the global variables:
    
    sl_name = $('#sl_name').html();
    
    category = $("#category_info").attr("content");
    
    //Set the event listeners:
	
    $("#section1").on("click",loadDescription);
    
    $("#section2").on("click",loadCharacteristics);
    
    $("#section3").on("click",loadHowTo);
    
    $("#section4").on("click",loadPromo);
    
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


/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Descrizione" 
* section of the page. The Ajax Call sends to the php file the name of the current smart life 
* loaded in the page; expects as a response a JSON object cointaining the smart life's 
* "Descrizione".
*/
function loadDescription(){
  
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLDescription.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect2").removeAttr("class");
            $("#sect3").removeAttr("class");
            $("#sect4").removeAttr("class");
            $('#sect1').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty(); //also removes "description" id tag
            
            //Update with new content
            var p = document.createElement("p");
            p.setAttribute("id","description");
            p.innerHTML = (response_parsed[0].description);
            $("#main_content").append(p);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
	return false; //to avoid the scrolling down of the page
}

/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Caratteristiche" 
* section of the page. The Ajax Call sends to the php file the name of the current smart life 
* loaded in the page; expects as a response a JSON object cointaining the smart life's 
* "Caratteristiche".
*/
function loadCharacteristics(){
  
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLCharacteristics.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect3").removeAttr("class");
            $("#sect4").removeAttr("class");
            $('#sect2').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            
            //Update with new content:
            var table = document.createElement("table");
            table.setAttribute("class", "table table-condensed");
            var tbody = document.createElement("tbody");
            table.appendChild(tbody);
            
            for (var spec in response_parsed){
				var tr = document.createElement("tr");
                var th = document.createElement("th");
                var td = document.createElement("td");
                
                th.innerHTML= response_parsed[spec].name;
                tr.appendChild(th);
                td.innerHTML= response_parsed[spec].content;
                tr.appendChild(td);
                
                tbody.appendChild(tr);
                
            }
            $("#main_content").append("<h4>Caratteristiche principali:</h4><br>");
            $("#main_content").append(table);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
   
	return false; //to avoid the scrolling down of the page
}


/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Come si attiva" 
* section of the page. The Ajax Call sends to the php file the name of the current smart life 
* loaded in the page; expects as a response a JSON object cointaining the smart life's 
* "Come si attiva".
*/
function loadHowTo(){
  
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLHowTo.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect2").removeAttr("class");
            $("#sect4").removeAttr("class");
            $('#sect3').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty(); //also removes "description" id tag
            
            //Update with new content
            var p = document.createElement("p");
            p.innerHTML = (response_parsed[0].how_to);
            $("#main_content").append(p);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
    });
	return false; //to avoid the scrolling down of the page
}


/*
* Performs an asynchronous HTTP (Ajax) request to a php file to load the "Promozioni" 
* section of the page. The Ajax Call sends to the php file the name of the current smart life 
* loaded in the page; expects as a response a JSON object cointaining the smart life's 
* "Promozioni".
*/
function loadPromo(){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLPromo.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging
            var response_parsed = JSON.parse(response);
            
            //update the lateral bar:
            $("#sect1").removeAttr("class");
            $("#sect2").removeAttr("class");
            $("#sect3").removeAttr("class");
            $('#sect4').attr('class', 'active');
            
            //remove and clear useless tags:
            $("#main_content").empty();
            
            //Update with new content
            $("#main_content").append("<h4>Offerte speciali per questo prodotto</h4><br>");
            
            for (var promo in response_parsed){
            
            	var div = document.createElement("div");
                
                var new_price = response_parsed[promo].new_price;
                var payment_inst = response_parsed[promo].payment_instalments;
                var other_promo = response_parsed[promo].other_promo;
                
                if (other_promo != ""){ //name of the promotion
                	var p = document.createElement("p");
                    p.innerHTML = other_promo + "<br>";
                    p.setAttribute("class","center");
                    div.appendChild(p);
                }
                
                                
                if (payment_inst != ""){ //installments payment of the SL, if any
                	var b = document.createElement("b");
                    b.innerHTML = "Condizioni: ";
                    var p = document.createElement("p");
                    p.innerHTML = payment_inst;
                    div.appendChild(b);
                    div.appendChild(p);
                }
            
                if (new_price != ""){ //new price, if any
                	var b = document.createElement("b");
                    b.innerHTML = "Prezzo: ";
                    var p = document.createElement("p");
                    p.innerHTML = new_price + "€";
                    div.appendChild(b);
                    div.appendChild(p);
                }
                
                div.setAttribute("id","promo_box");
                
                $("#main_content").append(div);
                $("#main_content").append("<br>");
                
            }
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call: no promo associated to this product?");
        }
        
    });
    
	return false;
}


/*
* Performs an asynchronous HTTP (Ajax) request to a php file in order to update 
* part of the page and display the next or previous product in this group.
* The PHP file is chosen dynamically based on what the user has clicked on ("previous"
* product or "next" product).
* The Ajax Call sends to the php file the name of the current smart life, its 
* category. Expects as response the "Descrizione" information of this device.
*/
function move_in_group(event){
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "get" + event.data.direction + "SLInGroup.php",
        data: {name:sl_name, category:category},
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
                $("#sect3").removeAttr("class");
                $("#sect4").removeAttr("class");
                $('#sect1').attr('class', 'active');

                //remove and clear useless tags + reset image:
                $("#main_content").empty();
                $("#sl_name").empty();
                $("#orientation2").empty();
                $("#sect4").remove();
                $("#img_panel").attr("src", "");
                $(".spacing").remove();

                /* Update with new content and update the vars: */
                $("#sl_name").append(response_parsed[0].name);
                sl_name = response_parsed[0].name;
                check_promotion(); //must be done after setting the new name and resetting the previous promotions
                $("#orientation2").append(sl_name); //update orientation info
                disable_activate_group_links(event.data.direction); //update the red/blue aspect of the group links
                loadImage();
                updateForDevice1();
                var p = document.createElement("p");
                p.setAttribute("id","description");
                p.innerHTML = (response_parsed[0].description);
                $("#main_content").append(p);
                
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
}

/**
* Auxialiary function that performs an ajax call in order to check if there is or not another smart life
* next or before this device (the correct smart life group is inferred by the php file).
* The Ajax Call sends to the php file the name of the current smart life, its 
* category and the (optional) information about the assistance or smart life associated to this 
* smart life. Expects as a response a JSON array whose lenght represents the 
* number of smart life next or before this one. Based on the response, makes
* the previous/successive links red or blue.
*/
function disable_activate_group_links(direction){
    
    $.ajax({ //check if there is a next/previous product
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "get" + direction + "SLInGroup.php",
        data: {name:sl_name, category:category},
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

/*
* Performs an asynchronous HTTP (Ajax) request to a php file in order to add, if present,
* the lateral bar "Promozioni" of the new smart life that is being loaded.
* Expects as a response a JSON array whose lenght represents the abstence (0) or presence (>0)
* of the bar.
*/
function check_promotion(){
    
     $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLPromo.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging 
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
                li.setAttribute("id","sect4");
                a.setAttribute("id","section4");
                a.setAttribute("href", "");
                a.innerHTML = "Promozione";
                li.appendChild(a);
                $("#sl_box").append(li);
                $("#section4").on("click",loadPromo); //add again the proper event
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call: no promo associated to this product?");
        }
        
    });
    
	return false; 
    
}

/**
* Performs an AJAX call to a php file in order to get the URL of the image associated to
* the current smart life.
*/
function loadImage(){
    
     $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getSLImage.php",
        data: {name:sl_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging 
            var response_parsed = JSON.parse(response);
            $("#img_panel").attr("src", "../img/" + response_parsed[0].url);
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
}

/*
* Performs an ajax call in order to check if there is or not a "forDevice_1" relation 
* from this smart life to some devices. Updates the lateral button accordingly.
* Expects as a response a JSON array whose lenght represents the abstence (0) or presence (>0)
* of the bar.
*/
function updateForDevice1(){
    
        $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/" + sl_directory + "getForDevice1.php",
        data: {name:sl_name},
        success: function(response) {
			
            console.log(JSON.parse(response));  // debugging 
            var response_parsed = JSON.parse(response);
            
            var array_lenght = 0;
            for (var elem in response_parsed){
                array_lenght ++;
            }
            
            //Remove the old SL services:
            $("#forDevice1_list").remove();
            $("#forDevice1_title").remove(); 
            
            if (array_lenght > 0){
                
                //Add the title and the the ul list tag
                var title = "<h4 id='forDevice1_title'>Dai un'occhiata ai Prodotti associati:</h4>";
                var ul = "<ul class='nav nav-pills nav-stacked' id='forDevice1_list'>";
                $("#forDevice1_box").append(title + ul);
                
                //add the assistance_for button in the lateral bar:
                var li = document.createElement("li");
                var a = document.createElement("a");
                li.setAttribute("class","forDevice1"); //MAY BE REMOVED
                var orientation = $("#orientation").text();
                var orientation_slice = orientation.substring(0, orientation.length-2);
                var assistance_link = "http://timhypermediaproject2016.altervista.org/php/For_Device1.php?slX=" + 
                                    encodeURI(sl_name) + "&catX=" + encodeURI(category) + 
                                    "&orientation=" + orientation_slice;
                a.setAttribute("href", assistance_link);
                a.innerHTML = "Prodotti";
                li.appendChild(a);
                $("#forDevice1_list").append(li);
                    
                $("#forDevice1_box").append("</ul>");
                $("#forDevice1_box").after("<br class='spacing'>");
                
            }
            
        },
        error: function(request,error) 
        {
            console.log("Error with the ajax call");
        }
        
    });
    
	return false; 
    
}