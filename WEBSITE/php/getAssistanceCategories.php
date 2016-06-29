<?php

       getAssistanceCategories();
		/**
        *   Special file that performs the same operation of getCategories2.php but is specialized
        *   for the assistance macro group, since in that case we need to embed in the page also
        *   the special links to assistance services marked as highlights
        */
       function getAssistanceCategories(){
       	$high_cat = "ASSISTENZA";
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
           
           
           //find tag where to put results of query
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
             
             
		    
			 // query for normal categories
             $query ="SELECT category FROM high_level_categories WHERE macro_group="."'".$high_cat."'";
             //query for highlights stuff
			 $queryevidenza="SELECT * FROM assistance WHERE In_evidenza = 1 ORDER BY id_assistance";

             $result = $mysqli->query($query);
		     $resultevidenza = $mysqli->query($queryevidenza);
			
			 $arrayEvidenza = array();
			 while($rowEvidenza = $resultevidenza->fetch_array(MYSQL_ASSOC)){
                    $arrayEvidenza[] =  array_map('utf8_encode', $rowEvidenza);
                    
                }
			 
			 if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				// should be only 1 iteration
			   foreach($nodes as $node){
                   $acc=array();
				   
				  foreach($myArray as $elem){
					$newnode = $doc->createDocumentFragment();
                
					$cat=$elem['category'];
                    
                    // img from db
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
				 //handle table in evidenza
				 $evidaccum ="";
				 foreach($arrayEvidenza as $elemEv){
					 	$evidnode = $doc->createDocumentFragment();
						$evidcode = "<tr><td><a href='getMultiTopic.php?name=".$elemEv['name'].htmlspecialchars("&")."catX=In evidenza".htmlspecialchars("&")."orientation=".$orientation." > In evidenza'>".$elemEv['name']."</a></td></tr>";
						$evidaccum = $evidaccum.$evidcode;
						
				 }
				 
				 $tablenode = $doc->createDocumentFragment();
				 $tablecode = "<h3>In evidenza</h3><table class='table-condensed'><tbody>".$evidaccum."</tbody></table>";
				 $tablenode->appendXML($tablecode);
				 $node->appendChild($tablenode);
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