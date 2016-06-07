<?php

       getElementOfCategory();
		
       function getElementOfCategory(){
       	$high_cat = $_GET['catX'];
		   
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{

             $query1 ="SELECT content FROM device_categories_content WHERE device_category="."'".$catX."'";
			 $query2 ="SELECT content FROM sl_categories_content WHERE sl_category="."'".$catX."'";
			 $query3 ="SELECT content FROM assistance_categories_content WHERE assistance_category="."'".$catX."'";
			 

             $result1 = $mysqli->query($query1);
			 $result2 = $mysqli->query($query2);
			 $result3 = $mysqli->query($query3);
			 
		     manipulateResults($result1);
			 manipulateResults($result2);
			 manipulateResults($result3);
			

            //close connection
            $mysqli->close();
            
		 }
       }
	   
	   function manipulateResults($result){
		   
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           $nodes = $xpathsearch->query('//ul[contains(@class,"result")]'); 
		   
		   
		   
		   if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] = $row;
                    
                }
				
			   foreach($nodes as $node){
				  foreach($myArray as $elem){
					$newnode = $doc->createDocumentFragment();
                    
					$code= "<li class="."'catX'".">{$elem['content']}</li>";
                    //$code= "<li>" + "ciao" + "</li>";
                    $newnode->appendXML($code);
                    $node->appendChild($newnode);
				 }
			   }
              echo $doc->saveHtml();	
              
              
			 }
	   }


     ?>