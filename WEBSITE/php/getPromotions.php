<?php


getPromotions();

/**
*  Builds the special page that contains both the devices and the smart life services in promotion.
*  The page points directly to the items.
*  No input parameters needed
*/

function getPromotions(){
	
		$catX = "PROMOZIONI";
		
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
             //query of the devices in promotion
             $query_device ="SELECT DISTINCT d.name FROM device d JOIN promotion p JOIN device_to_promo dtp
			 WHERE d.id_device = dtp.id_device AND dtp.id_promo = p.id_promo ORDER BY d.id_device";
            //query of the SL in promotion
			 $query_sl ="SELECT DISTINCT s.name FROM sl s JOIN promotion p JOIN sl_to_promo stp
			 WHERE s.id_sl = stp.id_sl AND stp.id_promo = p.id_promo ORDER BY s.id_sl";
          

             $result_device = $mysqli->query($query_device);
			 $result_sl = $mysqli->query($query_sl);
		
		     $doc = new DOMDocument();
             $doc->loadHTMLFile("../pages/promotions.html");
			 $xpathsearch = new DOMXPath($doc);
			 
			 
			   //handle title
           $titlenodes = $xpathsearch->query('//h2[contains(@id,"title")]'); 
           $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
           $newtitle = $doc->createDocumentFragment();
          
           $titlecode = "<h2 id='title'>{$catX}</h2>";
           $newtitle->appendXML($titlecode);
           $title_parents= $xpathsearch->query($title_parent_path); 
           $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
           
           //handle go back button
          
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/index.html'>Vai alla HOME </a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));
             
             //handle cover image
               $query="SELECT url FROM content_images WHERE content='PROMOZIONI'";
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
           
           
              //handle orientation info
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
           $orientation="Sei in: PROMOZIONI";
           $orientationcode = "<small id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
			 
			 //prepare device tags
		    $doc = manipulateResults($result_device,$mysqli,$doc,"result_device");
            //prepare SL tags
			$doc = manipulateResults($result_sl,$mysqli,$doc,"result_sl");
			 //send page to the client
             echo $doc->saveHtml();	

            //close connection
            $mysqli->close();
            
		 }
       }
	   //builds the parte of the page related to the query results
	   function manipulateResults($result,$mysqli,$doc,$tagid){
		   
		 
		   $xpathsearch = new DOMXPath($doc);
           
           // find tag where to put results
           $nodes = $xpathsearch->query("//div[contains(@id,'$tagid')]"); 
		   
		   
		   
		   if($result->num_rows>0){
           
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				//should be only 1 iteration
			   foreach($nodes as $node){
				   $acc=array();
				   $count=0;
				  foreach($myArray as $elem){
					$count = $count + 1; 
					$newnode = $doc->createDocumentFragment();
                
                
					$content=$elem['name'];
                    
                    //search img in db
					$queryimg="SELECT url FROM content_images WHERE content="."'".$content."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] =  array_map('utf8_encode', $rowimg);
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "http://timhypermediaproject2016.altervista.org/img/".$finalurl['url'];
                  
					$codeimg = "<img class='img-responsive' src='".$url."'/>";
					
					$codefooter = "<div class="."'panel-footer name_elem'".">{$elem['name']}</div>";
                    $codeimgandfooter = $codeimg.$codefooter;
                    $href = "<a href='getMultiTopic.php?name=".$elem['name'].htmlspecialchars("&")."catX=PROMOZIONI".htmlspecialchars("&")."orientation=Sei in: PROMOZIONI'>";
                    $codeprimary =$href."<div class= 'panel panel-primary'>{$codeimgandfooter}</div></a>";
                    $code= "<div class="."'col-sm-3'".">{$codeprimary}</div>";

                    array_push($acc,$code);
					
                    //4 items in a row
					if(sizeof($acc)==4){
						$tags="";
						foreach($acc as $col){
							$tags=$tags.$col;
						}
						$rowcode="<div class="."'row'".">{$tags}</div>";
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
			   }
            
              
              
			 }
	
	   return $doc;
	
}



?>