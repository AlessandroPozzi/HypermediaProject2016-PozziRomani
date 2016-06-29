<?php
   
   for_Device2_Target();
   /**
    *  Builds an instance of a multiple topic device page related to the assistance given as
    *  parameter in the url. It preserves the context of navigation to be able to go back, but
    *  will specify to discard it in case of a user following another relation.
    *  The page is nearly the same as the one built by the getMultiTopic file
    */
    
   function for_Device2_Target(){
	  
	    $name = $_GET['name'];
	  $category = $_GET['catX'];
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
      
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
         
		   //query of the specific device 		 
             $query ="SELECT * FROM device WHERE name="."'".$name."'";
			//query of other devices related to same assistance
             $query_category ="SELECT d.name FROM device d JOIN for_device_2 fd JOIN assistance a WHERE a.name="."'".$_GET['assX']."' AND a.id_assistance = fd.id_assistance AND
			 fd.id_device = d.id_device ORDER BY d.id_device";
           
             
             $result_category=$mysqli->query($query_category);
			 $result = $mysqli->query($query);
			
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
                   
				   //should be only one
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
                  //handle title
					$codetitle="<h2 id='device_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
					$price = "Prezzo: ".$elem['price']."€";	
                    $codeprice = "<p id='price'>{$price}</p>";
                    $chara_title = "<h4>Caratteristiche principali:</h4>";
					$chara = $chara_title.$elem['characteristics'].$codeprice;
                    $codechara =  "<div id='main_content'>{$chara}</div>";
                    $codeInfoCat = "<meta  id='category_info' content='assistance_relation'></meta>"; //cat info
                    $codeInfoAssistance = "<meta  id='assistance_info' content='".$_GET['assX']."'></meta>"; //related assistance info
                    //query of the img
                    $queryimg="SELECT url FROM content_images WHERE content="."'".$elem['name']."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
					
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] = $rowimg;
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "../img/".$finalurl['url'];
					
					//create new tags to be inserted
					$newdescr = $doc->createDocumentFragment();
					$newchara = $doc->createDocumentFragment();
					$newtitle = $doc->createDocumentFragment();
                    $catinfo = $doc->createDocumentFragment(); //cat info
					$assistanceinfo = $doc->createDocumentFragment(); //related assistance info
					
					$newdescr->appendXML($codedescr);
					$newchara->appendXML($codechara);
					$newtitle->appendXML($codetitle);
                    $catinfo->appendXML($codeInfoCat); //cat info
                    $assistanceinfo->appendXML($codeInfoAssistance); //related assistance info
                      
                    
                    $head_node->item(0)->appendChild($catinfo);//cat info
                    $head_node->item(0)->appendChild($assistanceinfo); //related assistance assistance info



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
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/For_Device2.php?assX=".$_GET['assX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false'>Vai a ".$_GET['assX']." - Prodotti associati</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           }
                 
           //handle orientation info
                 
         $orientation=  $_GET['orientation']." > ".$_GET['assX']." > Prodotti associati > ";
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
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=true'>Assistenza</a></li>";
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
                   htmlspecialchars("&")."prodX=".$_GET['name'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=true' >".$elem2["name"]."</a></li>"; //ADD the link to the SL -- TODO
                    $av_sl_body = $av_sl_body.$avail_sl_li;
                   //$new_av_sl->appendXML($avail_sl_code);	
                    
                }
                
                $closed_ul = "</ul>";
                $av_sl_body = $av_sl_body.$closed_ul;
                $new_av_sl->appendXML($av_sl_body);
                $avail_sl_box->appendChild($new_av_sl);

               
            }
             
             //send page to client
             echo $doc->saveHtml();	

						
			 }
			 
			 
			 $mysqli->close();
		 }
         
	   
	   
	   
	   
   }
   
   
   
   
?>