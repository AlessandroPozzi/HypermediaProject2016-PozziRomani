<?php

  /**
  *  To avoid passing too many parameters, this file tries to build all types of multitopic pages for each  call
  *  It is required that all the items belong to one and only one "type" of content (device, sl, assistance) so that
  *  only one of the functions will performs its operations
  */
  getDeviceTopic();
  getSLTopic();
  getAssistanceTopic();
  
  /**
  *  builds the html page for the device asked by the user
  *  parameters are in the url
  */
  function getDeviceTopic(){
	  
	  $name = $_GET['name'];
	  $category = $_GET['catX'];
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
         
		    //query for the specific device		 
             $query ="SELECT * FROM device WHERE name="."'".$name."'";
             //query for devices of same category - Guided Tour pattern
			 $query_category="SELECT * FROM device d JOIN device_categories_content dcc WHERE dcc.device_category='".$category."' AND
             dcc.content = d.name ORDER BY d.id_device";
             //special case for "all" category
             if($category == "Tutti i dispositivi"){
                $query_category="SELECT * FROM device ORDER BY id_device";
             }//special case for promotion "category"
             if($category == "PROMOZIONI"){
                $query_category="SELECT DISTINCT d.name,d.description,d.characteristics,d.price FROM device d JOIN promotion p JOIN device_to_promo dtp
			    WHERE d.id_device = dtp.id_device AND dtp.id_promo = p.id_promo ORDER BY d.id_device";
             }
             $result_category=$mysqli->query($query_category);
			 $result = $mysqli->query($query);
			// only 0 or 1 results expected
			 if($result->num_rows == 1){
				$myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                  
                    $myArray[] = array_map('utf8_encode', $row);
                }
				$categoryArray = array();
                while($categoryrow = $result_category->fetch_array(MYSQL_ASSOC)){
                    
                    $categoryArray[] = array_map('utf8_encode', $categoryrow);
                }
                
				$doc = new DOMDocument();
                $doc->loadHTMLFile("../pages/device_topic.html");
		        $xpathsearch = new DOMXPath($doc);
                $descr_nodes = $xpathsearch->query('//p[contains(@id,"description")]'); 
				$chara_nodes = $xpathsearch->query('//div[contains(@id,"main_content")]'); 
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"device_name")]'); 
				$price_nodes = $xpathsearch->query('//p[contains(@id,"price")]'); 
				$img_nodes = $xpathsearch->query('//img[contains(@id,"img_panel")]'); 
				$head_node = $xpathsearch->query('//head'); //cat info
                   
				   // should be only 1 iteration
				  foreach($myArray as $elem){
					 $position=0;
                     $count=0;
					foreach($categoryArray as $elements){
                     if($elements['name'] == $elem['name']) {$position=$count;}
                    
                     $count = $count+1;
                    }
                    
                    //decide if prev link is red
                    if($position == 0){
                        $prev_nodes = $xpathsearch->query('//a[contains(@id,"previous_in_group")]'); 
                        $prev_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                    }
                     //decide if next link is red
                    if($position == ($count-1)){
                        $next_nodes = $xpathsearch->query('//a[contains(@id,"next_in_group")]'); 
                        $next_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                    }
                     // index pattern for promozioni
					 if($_GET['catX'] == "PROMOZIONI"){
                       $toRight_nodes  = $xpathsearch->query('//a[contains(@class,"toRight")]'); 
                       $toRight_icons  = $xpathsearch->query('//span[contains(@class,"toRight")]'); 
                       $toRight_nodes->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_nodes->item(1)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(1)->setAttribute("style","visibility:hidden");
                     }
                
                //build the tags
					$codetitle="<h2 id='device_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
					$price = "Prezzo: ".$elem['price']."€";	
                    $codeprice = "<br/><b id='price'>{$price}</b>";
                    $chara_title = "<h4>Caratteristiche principali:</h4>";
					$chara = $chara_title.$elem['characteristics'].$codeprice;
                    $codechara =  "<div id='main_content'>{$chara}</div>";
                    $codeInfoCat = "<meta  id='category_info' content='".$category."'></meta>"; //cat info
                    // look for imgs in db
                    $queryimg="SELECT url FROM content_images WHERE content="."'".$elem['name']."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
					
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] = $rowimg;
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "../img/".$finalurl['url'];
					
					
					$newdescr = $doc->createDocumentFragment();
					$newchara = $doc->createDocumentFragment();
					$newtitle = $doc->createDocumentFragment();
                    $catinfo = $doc->createDocumentFragment(); //cat info
					
					
					$newdescr->appendXML($codedescr);
					$newchara->appendXML($codechara);
					$newtitle->appendXML($codetitle);
                    $catinfo->appendXML($codeInfoCat); //cat info
                      
                    
                    $head_node->item(0)->appendChild($catinfo);//cat info
					$descr_parent_path =($descr_nodes->item(0)->getNodePath())."/..";
                    
					$chara_parent_path =($chara_nodes->item(0)->getNodePath())."/..";
					$title_parent_path =($title_nodes->item(0)->getNodePath())."/..";
					
                     $descr_parents = $xpathsearch->query($descr_parent_path);
					$chara_parents = $xpathsearch->query($chara_parent_path); 
					$title_parents = $xpathsearch->query($title_parent_path); 
					
				
					$descr_parents->item(0)->replaceChild($newdescr,$descr_nodes->item(0));
					$chara_parents->item(0)->replaceChild($newchara,$chara_nodes->item(0));
					$title_parents->item(0)->replaceChild($newtitle,$title_nodes->item(0));
					
					$img_nodes->item(0)->setAttribute("src",$url);
                      
                    
               //handle promotion link
           
              $querypromotion = "SELECT * FROM device_to_promo dp JOIN promotion p
              WHERE'".$elem['id_device']."'= dp.id_device AND dp.id_promo = p.id_promo";
           
              $resultpromotion = $mysqli->query($querypromotion);
		
			 if($resultpromotion->num_rows == 0){
                 $promotion_nodes = $xpathsearch->query('//a[contains(@id,"section3")]'); 
                 $promotion_parent_path = ($promotion_nodes->item(0)->getNodePath())."/..";
                 $promotion_parents= $xpathsearch->query($promotion_parent_path); 
                 $promotion_parents->item(0)->removeChild($promotion_nodes->item(0));
             }
         
		 }
                	           
            //handle go back button
       
         if($_GET['catX'] != null){
           $backElem=$_GET['catX'];
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode="";
           if(!($_GET['catX'] == "PROMOZIONI")){
             $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$backElem."'>Vai a ".$backElem."</a>";
           }else{
             $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getPromotions.php'>Vai a PROMOZIONI</a>";

           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           }
                 
           //handle orientation info
                 
         $orientation=  $_GET['orientation']." > ";
         if(!($orientation==null)){   
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
          
           $orientationcode = "<small class='nav-link' id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           $neworientation2 = $doc->createDocumentFragment();
           $orientationcode2 = "<small class='nav-link' id='orientation2'>{$_GET['name']}</small>";
           $neworientation2->appendXML($orientationcode2);
           $orientation_parents->item(0)->appendChild($neworientation2);
           }
           //handle assistancefor 
          
             //this query checks if there is any assistance associated with the device
            $query = "SELECT a.name
                      FROM assistance a
                      INNER JOIN assistance_for asf
                      on a.id_assistance = asf.id_assistance
                      INNER JOIN device d
                      on d.id_device = asf.id_device
                      WHERE d.name="."'".$name."'"; 
             
            $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $ass_for_nodes = $xpathsearch->query('//li[contains(@class,"assistanceFor")]'); 
               $ass_for_parent_path = ($ass_for_nodes->item(0)->getNodePath())."/..";
               $newass_for = $doc->createDocumentFragment();
               $ass_for_code = "<li class='assistancefor'><a  href='http://timhypermediaproject2016.altervista.org/php/AssistanceFor.php?prodX=".$_GET['name'].htmlspecialchars("&").
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false'>Assistenza</a></li>";
               $newass_for->appendXML($ass_for_code);
               $ass_for_parents = $xpathsearch->query($ass_for_parent_path); 
               $ass_for_parents->item(0)->replaceChild($newass_for,$ass_for_nodes->item(0));	
            }else{
                $ass_for_box = $xpathsearch->query('//div[contains(@id,"assistanceFor_box")]');
                $ass_for_box_single = $ass_for_box->item(0);
                while ($ass_for_box_single->hasChildNodes()){
                    $ass_for_box_single->removeChild($ass_for_box_single->childNodes->item(0));
                }
            
           }
                 
                 
           //handle available SL
            
                  $query = "SELECT sl.name
                  FROM sl
                  INNER JOIN available_sl_service ass
                  on sl.id_sl = ass.id_sl
                  INNER JOIN device d
                  on d.id_device = ass.id_device
                  WHERE d.name="."'".$name."'";
                 
              $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $search = $xpathsearch->query('//div[contains(@id,"availableSL_box")]'); 
                $avail_sl_box = $search->item(0);
                $new_av_sl = $doc->createDocumentFragment();
                $av_sl_title = "<h4 id='availableSL_title'>Dai un'occhiata ai servizi Smart Life associati:</h4>";
                $new_av_sl->appendXML($av_sl_title);
                $av_sl_body = "<ul class='nav nav-pills nav-stacked' id='availableSL_list'>";
                //$new_av_sl->appendXML($av_sl_ul);
                
               while($row2 = $result->fetch_array(MYSQL_ASSOC)){
                   $myArray2[] = array_map('utf8_encode', $row2);
               }
                
                foreach ($myArray2 as $elem2){

                   $avail_sl_li = "<li class='availableSL'><a href='AvailableSL_Target.php?name=".$elem2['name'].
                   htmlspecialchars("&")."prodX=".$_GET['name'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false' >".$elem2["name"]."</a></li>"; //ADD the link to the SL -- TODO
                    $av_sl_body = $av_sl_body.$avail_sl_li;
                   //$new_av_sl->appendXML($avail_sl_code);	
                    
                }
                
                $closed_ul = "</ul>";
                $av_sl_body = $av_sl_body.$closed_ul;
                $new_av_sl->appendXML($av_sl_body);
                $avail_sl_box->appendChild($new_av_sl);

               
            }else{
                
                //DO NOTHING, the box is already empty
                
            }
                 
                 
             echo $doc->saveHtml();	

						
			 }
			 
			 
			 $mysqli->close();
		 }
  }
  
  /**
  *  builds the html page for the SL service asked by the user
  *  parameters are in the url
  */
function getSLTopic(){
  $name = $_GET['name'];
  $category = $_GET['catX'];  
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{// query for the specific SL service
           $query ="SELECT * FROM sl WHERE name="."'".$name."'";
           //query for the other SL services of same category
           $query_category="SELECT * FROM sl s JOIN sl_categories_content scc WHERE scc.sl_category='".$category."' AND
             scc.content = s.name ORDER BY s.id_sl";
             //special case for "all" category
             if($category == "Tutti i servizi Smart Life"){
                $query_category="SELECT * FROM sl ORDER BY id_sl";
             }//special case for promotions "category"
			  if($category == "PROMOZIONE"){
                $query_category="SELECT DISTINCT s.name,s.description,s.how_to,d.price FROM sl s JOIN promotion p JOIN sl_to_promo stp
			    WHERE s.id_sl = stp.id_sl AND stp.id_promo = s.id_promo ORDER BY s.id_sl";
             }
             
			 $result = $mysqli->query($query);
             $result_category=$mysqli->query($query_category);
			 //0 or 1 results are expected
			 if($result->num_rows == 1){
				  $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    
                    $myArray[] = array_map('utf8_encode', $row);
                }
         
               $categoryArray = array();
                while($categoryrow = $result_category->fetch_array(MYSQL_ASSOC)){
                    
                    $categoryArray[] = array_map('utf8_encode', $categoryrow);
                }
                
             	$doc = new DOMDocument();
                $doc->loadHTMLFile("../pages/sl.html");
		        $xpathsearch = new DOMXPath($doc);
                $descr_nodes = $xpathsearch->query('//p[contains(@id,"description")]'); 
				
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"sl_name")]'); 
				
				$img_nodes = $xpathsearch->query('//img[contains(@id,"img_panel")]'); 
               	$head_node = $xpathsearch->query('//head'); //cat info
           //should be only 1 iteration
                foreach($myArray as $elem){
					  
					 $position=0;
                     $count=0;
					foreach($categoryArray as $elements){
                     if($elements['name'] == $elem['name']) {$position=$count;}
                    
                     $count = $count+1;
                    }
                    
                    //decide if prev link is red
                    if($position == 0){
                        $prev_nodes = $xpathsearch->query('//a[contains(@id,"previous_in_group")]'); 
                        $prev_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                    }
                     //decide if next link is red
                    if($position == ($count-1)){
                        $next_nodes = $xpathsearch->query('//a[contains(@id,"next_in_group")]'); 
                        $next_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                    }
                
                
                // index pattern for promozioni
					 if($_GET['catX'] == "PROMOZIONI"){
                       $toRight_nodes  = $xpathsearch->query('//a[contains(@class,"toRight")]'); 
                       $toRight_icons  = $xpathsearch->query('//span[contains(@class,"toRight")]'); 
                       $toRight_nodes->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_nodes->item(1)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(1)->setAttribute("style","visibility:hidden");
                     }
                     //build the tags
					$codetitle="<h2 id='sl_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                    //$codedescr = "<p id='description'>{aaaaaaaa}</p>";
				    $codeInfoCat = "<meta  id='category_info' content='".$category."'></meta>"; //cat info
                 

                   //look for img in db
					
                    $queryimg="SELECT url FROM content_images WHERE content="."'".$elem['name']."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
					
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] = $rowimg;
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "../img/".$finalurl['url'];
					
					
					$newdescr = $doc->createDocumentFragment();
				
					$newtitle = $doc->createDocumentFragment();
					$catinfo = $doc->createDocumentFragment(); //cat info
					
					$newdescr->appendXML($codedescr);
				
					$newtitle->appendXML($codetitle);
					 
                    $catinfo->appendXML($codeInfoCat); //cat info
                    $head_node->item(0)->appendChild($catinfo);//cat info
					$descr_parent_path =($descr_nodes->item(0)->getNodePath())."/..";
                    
					
					$title_parent_path =($title_nodes->item(0)->getNodePath())."/..";
					
                     $descr_parents = $xpathsearch->query($descr_parent_path);
					
					$title_parents = $xpathsearch->query($title_parent_path); 
					
				
					$descr_parents->item(0)->replaceChild($newdescr,$descr_nodes->item(0));
					
					$title_parents->item(0)->replaceChild($newtitle,$title_nodes->item(0));
					
					$img_nodes->item(0)->setAttribute("src",$url);
                    
         
                    //handle promotion link
           
              $querypromotion = "SELECT * FROM sl_to_promo sp JOIN promotion p
              WHERE'".$elem['id_sl']."'= sp.id_sl AND sp.id_promo = p.id_promo";
           
              $resultpromotion = $mysqli->query($querypromotion);
		
			 if($resultpromotion->num_rows == 0){
                 $promotion_nodes = $xpathsearch->query('//a[contains(@id,"section4")]'); 
                 $promotion_parent_path = ($promotion_nodes->item(0)->getNodePath())."/..";
                 $promotion_parents= $xpathsearch->query($promotion_parent_path); 
                 $promotion_parents->item(0)->removeChild($promotion_nodes->item(0));
				  }
              }    
                          //handle go back button
          if(!($_GET['catX'] == null)){
           $backElem = $_GET['catX'];  
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           if(!($backElem == "PROMOZIONI")){
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$backElem."'>Vai a ".$backElem."</a>";
           }else{
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getPromotions.php'>Vai a PROMOZIONI</a>";

           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           }
           //handle orientation info
            $orientation=  $_GET['orientation']." > ";
         if(!($orientation==null)){   
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
          
           $orientationcode = "<small class='nav-link' id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           $neworientation2 = $doc->createDocumentFragment();
           $orientationcode2 = "<small class='nav-link' id='orientation2'>{$_GET['name']}</small>";
           $neworientation2->appendXML($orientationcode2);
           $orientation_parents->item(0)->appendChild($neworientation2);
           }
           
               //handle for device1
          
             //this query checks if there is any device associated with the smart life
            $queryfor_dev = "SELECT d.name
                      FROM device d
                      INNER JOIN for_device_1 fd1
                      on d.id_device = fd1.id_device
                      INNER JOIN sl s
                      on s.id_sl = fd1.id_sl
                      WHERE s.name="."'".$name."'"; 
             
            $resultfor_dev = $mysqli->query($queryfor_dev);

            if($resultfor_dev->num_rows>0)
            {
               $for_dev_nodes = $xpathsearch->query('//li[contains(@class,"forDevice1")]'); 
               $for_dev_parent_path = ($for_dev_nodes->item(0)->getNodePath())."/..";
               $newfor_dev = $doc->createDocumentFragment();
               $for_dev_code = "<li class='forDevice1'><a  href='http://timhypermediaproject2016.altervista.org/php/For_Device1.php?slX=".$_GET['name'].htmlspecialchars("&").
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false'>Prodotti</a></li>";
               $newfor_dev->appendXML($for_dev_code);
               $for_dev_parents = $xpathsearch->query($for_dev_parent_path); 
               $for_dev_parents->item(0)->replaceChild($newfor_dev,$for_dev_nodes->item(0));	
            }else{
                $for_dev_box = $xpathsearch->query('//div[contains(@id,"forDevice1_box")]');
                $for_dev_box_single = $for_dev_box->item(0);
                while ($for_dev_box_single->hasChildNodes()){
                    $for_dev_box_single->removeChild($for_dev_box_single->childNodes->item(0));
                }
              }      
       //send page to client
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
	
}
  
  /**
  *  builds the html page for the assistance asked by the user
  *  parameters are in the url
  */
function getAssistanceTopic(){
	 $name = $_GET['name'];
	 $category = $_GET['catX'];
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{//query for specific assistance service
           $query ="SELECT * FROM assistance WHERE name="."'".$name."'";
           //query for other assistance services of the same category
		   $query_category="SELECT * FROM assistance a JOIN assistance_categories_content acc WHERE acc.assistance_category='".$category."' AND
             acc.content = a.name ORDER BY a.id_assistance";
             //special case of "all" category
             if($category == "Tutti i servizi di Assistenza"){
                $query_category="SELECT * FROM assistance ORDER BY id_assistance";
             }//special case of highlights "category"
             if($category == "In evidenza"){
                $query_category="SELECT * FROM assistance WHERE In_evidenza=1 ORDER BY id_assistance";
             }
             
             $result_category=$mysqli->query($query_category);
			 $result = $mysqli->query($query);
			 //only 0 or 1 results are expected
			 if($result->num_rows == 1){
				  $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    //$myArray[] = $row;
                    $myArray[] = array_map('utf8_encode', $row);
                }
                
                $categoryArray = array();
                while($categoryrow = $result_category->fetch_array(MYSQL_ASSOC)){
                    
                    $categoryArray[] = array_map('utf8_encode', $categoryrow);
                }
         
             	$doc = new DOMDocument();
                $doc->loadHTMLFile("../pages/assistance.html");
		        $xpathsearch = new DOMXPath($doc);
                $descr_nodes = $xpathsearch->query('//p[contains(@id,"description")]'); 
				
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"assistance_name")]'); 
                 $head_node = $xpathsearch->query('//head'); //cat info
				
				
         
         // should be 1 iteration
                foreach($myArray as $elem){
					 
                     $position=0;
                     $count=0;
					foreach($categoryArray as $elements){
                     if($elements['name'] == $elem['name']) {$position=$count;}
                    
                     $count = $count+1;
                    }
                    
                    //decide if prev link is red
                    if($position == 0){
                        $prev_nodes = $xpathsearch->query('//a[contains(@id,"previous_in_group")]'); 
                        $prev_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                      
                    }
                     //decide if next link is red
                    if($position == ($count-1)){
                        $next_nodes = $xpathsearch->query('//a[contains(@id,"next_in_group")]'); 
                        $next_nodes->item(0)->setAttribute("style","text-decoration:none ; color:red");
                      
                    }
                    // index pattern for in evidenza
					 if($_GET['catX'] == "In evidenza"){
                       $toRight_nodes  = $xpathsearch->query('//a[contains(@class,"toRight")]'); 
                       $toRight_icons  = $xpathsearch->query('//span[contains(@class,"toRight")]'); 
                       $toRight_nodes->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_nodes->item(1)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(1)->setAttribute("style","visibility:hidden");
                     }
                //build the tags
					$codetitle="<h2 id='assistance_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";+
                    $codeInfoCat = "<meta  id='category_info' content='".$category."'></meta>"; //cat info
                  
				    $newdescr = $doc->createDocumentFragment();
				    $catinfo = $doc->createDocumentFragment(); //cat info
					$newtitle = $doc->createDocumentFragment();
					
					
					$newdescr->appendXML($codedescr);
				
					$newtitle->appendXML($codetitle);
					

					$descr_parent_path =($descr_nodes->item(0)->getNodePath())."/..";
                    
					
					$title_parent_path =($title_nodes->item(0)->getNodePath())."/..";
					
                     $descr_parents = $xpathsearch->query($descr_parent_path);
					
					$title_parents = $xpathsearch->query($title_parent_path); 
					
				
					$descr_parents->item(0)->replaceChild($newdescr,$descr_nodes->item(0));
					
					$title_parents->item(0)->replaceChild($newtitle,$title_nodes->item(0));
					
				$catinfo->appendXML($codeInfoCat); //cat info
                    $head_node->item(0)->appendChild($catinfo);//cat info
                    
                       //handle faq link
           
              $queryfaq = "SELECT * FROM assistance_to_faq atf JOIN assistance_faq f
              WHERE'".$elem['id_assistance']."'= atf.id_assistance AND atf.id_FAQ = f.id_faq";
           
              $resultfaq = $mysqli->query($queryfaq);
		
			 if($resultfaq->num_rows == 0){
                 $faq_nodes = $xpathsearch->query('//a[contains(@id,"section2")]'); 
                 $faq_parent_path = ($faq_nodes->item(0)->getNodePath())."/..";
                 $faq_parents= $xpathsearch->query($faq_parent_path); 
                 $faq_parents->item(0)->removeChild($faq_nodes->item(0));
				  }
         
		    }
                  
                          //handle go back button
        if($_GET['catX'] != null){
           $backElem=$_GET['catX'];
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           if(!($_GET['catX']=="In evidenza")){
              $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$_GET['catX']."'>Vai a ".$_GET['catX']."</a>";
           }else{
              $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getAssistanceCategories.php'>Vai a ASSISTENZA</a>";

           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
        }   
           //handle orientation info
            $orientation=  $_GET['orientation']." > ";
         if(!($orientation==null)){   
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
          
           $orientationcode = "<small class='nav-link' id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           $neworientation2 = $doc->createDocumentFragment();
           $orientationcode2 = "<small class='nav-link' id='orientation2'>{$_GET['name']}</small>";
           $neworientation2->appendXML($orientationcode2);
           $orientation_parents->item(0)->appendChild($neworientation2);
           }
           
                 //handle for device2
          
             //this query checks if there is any device associated with the assistance
            $queryfor_dev = "SELECT d.name
                      FROM device d
                      INNER JOIN for_device_2 fd2
                      on d.id_device = fd2.id_device
                      INNER JOIN assistance a
                      on a.id_assistance = fd2.id_assistance
                      WHERE a.name="."'".$name."'"; 
             
            $resultfor_dev = $mysqli->query($queryfor_dev);

            if($resultfor_dev->num_rows>0)
            {
               $for_dev_nodes = $xpathsearch->query('//li[contains(@class,"forDevice2")]'); 
               $for_dev_parent_path = ($for_dev_nodes->item(0)->getNodePath())."/..";
               $newfor_dev = $doc->createDocumentFragment();
               $for_dev_code = "<li class='forDevice2'><a  href='http://timhypermediaproject2016.altervista.org/php/For_Device2.php?assX=".$_GET['name'].htmlspecialchars("&").
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false'>Prodotti</a></li>";
               $newfor_dev->appendXML($for_dev_code);
               $for_dev_parents = $xpathsearch->query($for_dev_parent_path); 
               $for_dev_parents->item(0)->replaceChild($newfor_dev,$for_dev_nodes->item(0));	
            }else{
                $for_dev_box = $xpathsearch->query('//div[contains(@id,"forDevice2_box")]');
                $for_dev_box_single = $for_dev_box->item(0);
                while ($for_dev_box_single->hasChildNodes()){
                    $for_dev_box_single->removeChild($for_dev_box_single->childNodes->item(0));
                }
              }      
           
           
           
           
           //send page to client
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
}



?>