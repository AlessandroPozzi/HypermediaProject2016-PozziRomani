<?php

       getCategories($_POST["high_cat"]);


       function getCategories($high_cat){
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           $nodes = $xpathsearch->query('//ul[contains(@class,"result")]'); 
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
		     $category="category";
			 $high_level_categories="high_level_categories";
			 $macro_group="macro_group";
			 $query = "SELECT $category FROM $high_level_categories WHERE $macro_group = $high_cat";

             $result = $mysqli->query($query);
		     
			 if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] = $row;
                    
                }
				
			   foreach($nodes as $node){
				  foreach($myArray as $elem){
					$newnode = $doc->createDocumentFragment();
					$code= "<li>" + $elem + "</li>";
                    $newnode->appendXML($code);
                    $node->appendChild($newnode);
				 }
			   }
              echo $doc->saveHtml();			   
			 }   
			   //free result
            $result->close();

            //close connection
            $mysqli->close();
            
		 }
       }


     ?>