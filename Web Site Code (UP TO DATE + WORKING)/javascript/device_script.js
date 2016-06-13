$(document).ready(documentReady);

var img = new Array();

var currentImage = null;

var lenght = null;

function documentReady(){
    console.log("I'm ready");
	
    $("#section1").on("click",loadCharacteristics);
    
    $("#section2").on("click",loadSpecification);
    
    $("#section3").on("click",loadPromo);
    
    $("#previous_image").on("click", previous_image);
    
    $("#next_image").on("click", next_image);
    
    preloadImage();

}

function loadCharacteristics(){
    
    var device_name = $('#device_name').html();  //Change this..? 
  
    console.log(""+device_name);
    
    $.ajax({
        method: "POST",
        //datatype = json is not necessary, the parsing is done later
        url: "http://timhypermediaproject2016.altervista.org/php/getCharacteristics.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
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
            
            $("#main_content").append("<h4>Caratteristiche principali: </h4><br>");
            
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

function loadSpecification(){
    
    var device_name = $('#device_name').html();  //Change this..? 
  
    console.log(""+device_name);
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getSpecification.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
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


function loadPromo(){

	var device_name = $('#device_name').html();  //Change this..?
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getPromo.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response));  // debugging stuff
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
                    b.innerHTML = "Nome dell'offerta e dettagli: ";
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

function preloadImage(){
    
    var device_name = $('#device_name').html();
    currentImage = $("#img_panel").attr("src");
    console.log("asdasdasd: "+$("#img_panel").attr("src"));
    
    $.ajax({
        method: "POST",
        url: "http://timhypermediaproject2016.altervista.org/php/getImages.php",
        data: {name:device_name},
        success: function(response) {
			
        	console.log("Ajax call: success!");  
            console.log(JSON.parse(response)); 
            var response_parsed = JSON.parse(response);
            
            lenght = 0;
            for (var elem in response_parsed){
                lenght ++;
            }
            
            console.log("Json array lenght: " + lenght);
            
            if (lenght <= 1){
                console.log("No other images: preload not necessary " + lenght);
                //disable the arrows
            }else{
                
                for (var elem in response_parsed){
                   img[elem] = "../img/" + response_parsed[elem].url;
                }
                console.log("Success!");
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
    
    console.log("Lenght: " + lenght);
    console.log("current image: " +  currentImage);
    
    
    for(i = 0; i < lenght; i++){
    
        console.log("img" + i + ": " + img[i]);
        
        if (img[i] == currentImage){
            
            if(i + 1 < lenght){
                console.log("next image: " + img[i+1]);
                currentImage = img[i+1];
                $("#img_panel").attr("src", img[i+1]);
                return false;
            }else{
                console.log("next image: " + img[0]);
                currentImage = img[0];
                $("#img_panel").attr("src", img[0]);
                return false;
            }
            
        }
        
    }
}

function previous_image(){
    
    console.log("Lenght: " + lenght);
    console.log("current image: " +  currentImage);
    
    
    for(i = 0; i < lenght; i++){
    
        console.log("img" + i + ": " + img[i]);
        
        if (img[i] == currentImage){
            
            if(i -1 >= 0){
                console.log("previous image: " + img[i-1]);
                currentImage = img[i-1];
                $("#img_panel").attr("src", img[i-1]);
                return false;
            }else{
                console.log("previous image: " + img[lenght-1]);
                currentImage = img[lenght-1];
                $("#img_panel").attr("src", img[lenght-1]);
                return false;
            }
            
        }
        
    }
}
