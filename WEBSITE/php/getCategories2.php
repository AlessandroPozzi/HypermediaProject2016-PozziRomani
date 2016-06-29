<?php

       getCategories2();
		/**  
        *  Builds a page containing all the categories belonging to a macro category given as parameter in the url, plus
        *  the "all" category.
        *  It is actually called only for device and smart life macro groups, while the assistance has its
        *  own version of the file because it needs to handle a couple of additional things (highlights)
        */
       function getCategories2(){
       	$high_cat = $_GET['high_cat'];
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           
           // handle the go back button
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/index.html'>Vai alla Home</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));
           
           //handle title
           $titlenodes = $xpathsearch->query('//h2[contains(@id,"title")]'); 
           $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
           $newtitle = $doc->createDocumentFragment();
           $titlecode = "<h2 id='title'>{$high_cat}</h2>";
           $newtitle->appendXML($titlecode);
           $title_parents= $xpathsearch->query($title_parent_path); 
           $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
           
            //handle orientation info
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
           $orientation="Sei in: ".$high_cat;
           $orientationcode = "<small id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           
           
           
           // find tag where to put the query results
           $nodes = $xpathsearch->query('//div[contains(@class,"result")]'); 
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
             
               //handle category cover image
               $query="SELECT url FROM content_images WHERE content="."'".$high_cat."'";
               $result = $mysqli->query($query);

                if($result->num_rows>0){
                    $myArray = array();
                    while($row = $result->fetch_array(MYSQL_ASSOC)){
                        $myArray[] =  array_map('utf8_encode', $row);
                    }
                }

                foreach ($myArray as $elem){ //should be only one result
                    $img_url = $elem["url"];
                }
             
               $url = "http://timhypermediaproject2016.altervista.org/img/".$img_url;
               $orientation_nodes = $xpathsearch->query('//img[contains(@id,"img_panel")]'); 
               $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
               $newimage = $doc->createDocumentFragment();
               $imagecode = "<img class='img-responsive' id='img_panel' src ='".$url."'/>";
               $newimage->appendXML($imagecode);
               $orientation_parents= $xpathsearch->query($orientation_parent_path); 
               $orientation_parents->item(0)->replaceChild($newimage,$orientation_nodes->item(0));
             
             //handle the products:
		  
             $query ="SELECT category FROM high_level_categories WHERE macro_group="."'".$high_cat."'";
			 

             $result = $mysqli->query($query);
		     
		
			 if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				// should be only one iteration
			   foreach($nodes as $node){
                   $acc=array();
				   
				  foreach($myArray as $elem){
					$newnode = $doc->createDocumentFragment();
                
					$cat=$elem['category'];
                    // we want the img from the db
					$queryimg="SELECT url FROM content_images WHERE content="."'".$cat."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] =  array_map('utf8_encode', $rowimg);
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "http://timhypermediaproject2016.altervista.org/img/".$finalurl['url'];
                   
					$codeimg = "<img class='img-responsive' src='".$url."'/>";
					
					$codefooter = "<div class="."'panel-footer cat'".">{$elem['category']}</div>";
                    $codeimgandfooter = $codeimg.$codefooter;
                    $href = "<a href='getElementOfCategory.php?catX=".$elem['category']."'>";
                    $codeprimary =$href."<div class= 'panel panel-primary'>{$codeimgandfooter}</div></a>";
                    $code= "<div class="."'col-sm-4 col-lg-3  col-centered clearfix'".">{$codeprimary}</div>";

                  
                    array_push($acc,$code);
					//only 3 items displayed in a row
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
			
					
				 }//last row
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
			   }//send page to client
              echo $doc->saveHtml();	
              
              
			 }  else{
             echo "no rows";
             }
		

            //close connection
            $mysqli->close();
            
		 }
       }


     ?>