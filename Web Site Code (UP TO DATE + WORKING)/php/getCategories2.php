<?php

       getCategories2();
		
       function getCategories2(){
       	$high_cat = $_GET['high_cat'];
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           $nodes = $xpathsearch->query('//div[contains(@class,"result")]'); 
           //echo $doc->saveHtml();
		   
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
			 
             //echo $high_cat;
             //$query ="SELECT category FROM high_level_categories WHERE macro_group='DISPOSITIVI'";//.$high_cat;
			 
             $query ="SELECT category FROM high_level_categories WHERE macro_group="."'".$high_cat."'";
			 

             $result = $mysqli->query($query);
		     
			
			 
			 
			 if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] = $row;
                    
                }
				
			   foreach($nodes as $node){
                   $acc=array();
				   
				  foreach($myArray as $elem){
					$newnode = $doc->createDocumentFragment();
                
					$cat=$elem['category'];
					$queryimg="SELECT url FROM content_images WHERE content="."'".$cat."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] = $rowimg;
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "http://timhypermediaproject2016.altervista.org/img/".$finalurl['url'];
                    
					
					
					
					$codeimg = "<img class='img-responsive' src='".$url."'/>";
					
					$codefooter = "<div class="."'panel-footer high_cat'".">{$elem['category']}</div>";
                    $codeimgandfooter = $codeimg.$codefooter;
                    $codeprimary ="<div class= 'panel panel-primary'>{$codeimgandfooter}</div>";
                    $code= "<div class="."'col-sm-4 col-lg-3  col-centered clearfix'".">{$codeprimary}</div>";

                  
                    array_push($acc,$code);
					
					if(sizeof($acc)==3){
						$tags="";
						foreach($acc as $col){
							$tags=$tags.$col;
						}
						$rowcode="<div class="."'row row-centered'".">{$tags}</div>";
						$newnode->appendXML($rowcode);
						$node->appendChild($newnode);
						$acc=array();
					}
			
					
				 }
                 if(sizeof($acc)>0){
					 $tags="";
						foreach($acc as $col){
							$tags=$tags.$col;
						}
						$rowcode="<div class="."'row'".">{$tags}</div>";
						$newnode->appendXML($rowcode);
						$node->appendChild($newnode);
						$acc=array();
				 }
			   }
              echo $doc->saveHtml();	
              
              
			 }  else{
             echo "no rows";
             }
			   //free result
            //$result->close();

            //close connection
            $mysqli->close();
            
		 }
       }


     ?>