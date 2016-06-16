<?php


  getDeviceTopic();
  getSLTopic();
  getAssistanceTopic();
  
  
  function getDeviceTopic(){
	  
	  $name = $_GET['name'];
	  $category = $_GET['cat'];
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
         
		    		 
             $query ="SELECT * FROM device WHERE name="."'".$name."'";
			
			 $result = $mysqli->query($query);
			 
			 if($result->num_rows == 1){
				  $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    //$myArray[] = $row;
                    $myArray[] = array_map('utf8_encode', $row);
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
                   
				   
				  foreach($myArray as $elem){
					  
					
                
					$codetitle="<h2 id='device_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                    //$codedescr = "<p id='description'>{aaaaaaaa}</p>";
					$price = $elem['price']."€";	
                    $codeprice = "<p id='price'>{$price}</p>";
					$chara =$elem['characteristics'].$codeprice;
                    $codechara =  "<div id='main_content'>{$chara}</div>";
                    $codeInfoCat = "<meta  id='category_info' content='".$category."'></meta>"; //cat info
                    
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
                    
         
				  }
                	           
                //handle go back button
           $query_back ="SELECT device_category FROM device_categories_content WHERE content="."'".$name."'";
           $result_back = $mysqli->query($query_back);
           $backArray = array();
           while($backrow = $result_back->fetch_array(MYSQL_ASSOC)){
                    $backArray[] =  array_map('utf8_encode', $backrow);
                    
              }
           $backElem = $backArray[0];  
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$backElem['device_category']."'>Vai a ".$backElem['device_category']."</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           
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
           
                  echo $doc->saveHtml();	

						
			 }
			 
			 
			 $mysqli->close();
		 }
  }

function getSLTopic(){
  $name = $_GET['name'];
	  
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
           $query ="SELECT * FROM sl WHERE name="."'".$name."'";
			
			 $result = $mysqli->query($query);
			 
			 if($result->num_rows == 1){
				  $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    //$myArray[] = $row;
                    $myArray[] = array_map('utf8_encode', $row);
                }
         
             	$doc = new DOMDocument();
                $doc->loadHTMLFile("../pages/sl.html");
		        $xpathsearch = new DOMXPath($doc);
                $descr_nodes = $xpathsearch->query('//p[contains(@id,"description")]'); 
				
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"sl_name")]'); 
				
				$img_nodes = $xpathsearch->query('//img[contains(@id,"img_panel")]'); 
         
         
                foreach($myArray as $elem){
					  
					
                
					$codetitle="<h2 id='sl_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                    //$codedescr = "<p id='description'>{aaaaaaaa}</p>";
				
                 

                   
					
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
					
					
					$newdescr->appendXML($codedescr);
				
					$newtitle->appendXML($codetitle);
					

					$descr_parent_path =($descr_nodes->item(0)->getNodePath())."/..";
                    
					
					$title_parent_path =($title_nodes->item(0)->getNodePath())."/..";
					
                     $descr_parents = $xpathsearch->query($descr_parent_path);
					
					$title_parents = $xpathsearch->query($title_parent_path); 
					
				
					$descr_parents->item(0)->replaceChild($newdescr,$descr_nodes->item(0));
					
					$title_parents->item(0)->replaceChild($newtitle,$title_nodes->item(0));
					
					$img_nodes->item(0)->setAttribute("src",$url);
                    
         
				  }
                  
                          //handle go back button
           $query_back ="SELECT sl_category FROM sl_categories_content WHERE content="."'".$name."'";
           $result_back = $mysqli->query($query_back);
           $backArray = array();
           while($backrow = $result_back->fetch_array(MYSQL_ASSOC)){
                    $backArray[] =  array_map('utf8_encode', $backrow);
                    
              }
           $backElem = $backArray[0];  
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$backElem['sl_category']."'>Vai a ".$backElem['sl_category']."</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
	
}

function getAssistanceTopic(){
	 $name = $_GET['name'];
	  
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
           $query ="SELECT * FROM assistance WHERE name="."'".$name."'";
			
			 $result = $mysqli->query($query);
			 
			 if($result->num_rows == 1){
				  $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    //$myArray[] = $row;
                    $myArray[] = array_map('utf8_encode', $row);
                }
         
             	$doc = new DOMDocument();
                $doc->loadHTMLFile("../pages/assistance.html");
		        $xpathsearch = new DOMXPath($doc);
                $descr_nodes = $xpathsearch->query('//p[contains(@id,"description")]'); 
				
				$title_nodes = $xpathsearch->query('//h2[contains(@id,"assistance_name")]'); 
				
				
         
         
                foreach($myArray as $elem){
					  
					
                
					$codetitle="<h2 id='assistance_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                    //$codedescr = "<p id='description'>{aaaaaaaa}</p>";
				
                 

                   
					
                  
					
					
					$newdescr = $doc->createDocumentFragment();
				
					$newtitle = $doc->createDocumentFragment();
					
					
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
           $query_back ="SELECT assistance_category FROM assistance_categories_content WHERE content="."'".$name."'";
           $result_back = $mysqli->query($query_back);
           $backArray = array();
           while($backrow = $result_back->fetch_array(MYSQL_ASSOC)){
                    $backArray[] =  array_map('utf8_encode', $backrow);
                    
              }
           $backElem = $backArray[0];  
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getElementOfCategory.php?catX=".$backElem['assistance_category']."'>Vai a ".$backElem['assistance_category']."</a>";
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
}



?>