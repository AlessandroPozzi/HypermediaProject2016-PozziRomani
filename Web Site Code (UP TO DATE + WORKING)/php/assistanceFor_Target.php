<?php

    assistanceFor_Target();
	
	function assistanceFor_Target(){
		
		
		  $name = $_GET['name'];
	  
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
           $query ="SELECT * FROM assistance WHERE name="."'".$name."'";
            $query_category ="SELECT a.name FROM device d JOIN assistance_for af JOIN assistance a WHERE d.name="."'".$_GET['prodX']."' AND d.id_device = af.id_device AND
			 af.id_assistance = a.id_assistance ORDER BY a.id_assistance";
             
			 $result_category=$mysqli->query($query_category);
			 $result = $mysqli->query($query);
			 
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
				$head_node = $xpathsearch->query('//head'); //cat info
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"assistance_name")]'); 
                 
				
				
         
         
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
					
                
					$codetitle="<h2 id='assistance_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                    //$codedescr = "<p id='description'>{aaaaaaaa}</p>";
				    $newdescr = $doc->createDocumentFragment();
				
					$newtitle = $doc->createDocumentFragment();
                    $codeInfoCat = "<meta  id='category_info' content='device_relation'></meta>"; //cat info
                    $codeInfoDevice = "<meta  id='device_info' content='".$_GET['prodX']."'></meta>"; //related device info
					
					$catinfo = $doc->createDocumentFragment(); //cat info
                    $deviceinfo = $doc->createDocumentFragment(); //related device info
                    
                    $catinfo->appendXML($codeInfoCat); //cat info
                    $deviceinfo->appendXML($codeInfoDevice); //related device info
                    
                     $head_node->item(0)->appendChild($catinfo);//cat info
                    $head_node->item(0)->appendChild($deviceinfo); //related smart life info
                    
					$newdescr->appendXML($codedescr);
				
					$newtitle->appendXML($codetitle);
					

					$descr_parent_path =($descr_nodes->item(0)->getNodePath())."/..";
                    
					
					$title_parent_path =($title_nodes->item(0)->getNodePath())."/..";
					
                     $descr_parents = $xpathsearch->query($descr_parent_path);
					
					$title_parents = $xpathsearch->query($title_parent_path); 
					
				
					$descr_parents->item(0)->replaceChild($newdescr,$descr_nodes->item(0));
					
					$title_parents->item(0)->replaceChild($newtitle,$title_nodes->item(0));
					
				
                    
         
				  }
                  
                          //handle go back button

           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/AssistanceFor.php?prodX=".$_GET['prodX'].
		   htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=false'>Vai a ".$_GET['prodX']." - Servizi Assistenza associati</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           
           //handle orientation info
            $orientation=  $_GET['orientation']." > ".$_GET['prodX']." > Assistenze associate > ";
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
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=true'>Prodotti</a></li>";
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
           
           
           
           
           
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
		
	}















?>