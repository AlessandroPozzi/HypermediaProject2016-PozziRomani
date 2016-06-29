<?php

    AvailableSL_Target();
	/**
    *  Builds an instance of a multiple topic smart life page related to the device given as
    *  parameter in the url. It preserves the context of navigation to be able to go back, but
    *  will specify to discard it in case of a user following another relation.
    *  The page is nearly the same as the one built by the getMultiTopic file
    */
	
	function AvailableSL_Target(){
		
		 $name = $_GET['name'];
         $category = $_GET['catX'];  
      
	   $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
         // query of specific smart life
           $query ="SELECT * FROM sl WHERE name="."'".$name."'";
           // no query of other smart lifes because of index pattern
             
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
               	$head_node = $xpathsearch->query('//head'); //cat info
         
         //should be only one
                foreach($myArray as $elem){
					  
				
                
                
                // index pattern, hide Guided Tour buttons
					
                       $toRight_nodes  = $xpathsearch->query('//a[contains(@class,"toRight")]'); 
                       $toRight_icons  = $xpathsearch->query('//span[contains(@class,"toRight")]'); 
                       $toRight_nodes->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_nodes->item(1)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(0)->setAttribute("style","visibility:hidden");
                       $toRight_icons->item(1)->setAttribute("style","visibility:hidden");
                       
                     //handle title
					$codetitle="<h2 id='sl_name'>{$elem['name']}</h2>";
					$codedescr = "<p id='description'>{$elem['description']}</p>";
                   
				    $codeInfoCat = "<meta  id='category_info' content='".$category."'></meta>"; //cat info
                 

                   // query for the img
					
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
       
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
		   $backcode="";
           if($_GET['default'] == "false"){
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['prodX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation']."'>Vai a ".$_GET['prodX']."</a>";
           }else{
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['prodX'].htmlspecialchars("&")."catX=Tutti i dispositivi".htmlspecialchars("&")."orientation=".$_GET['orientation']."'>Vai a ".$_GET['prodX']."</a>";

           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));	
           }
           
           //handle orientation info
            $orientation=  $_GET['orientation']." > ".$_GET['prodX']." > Servizi Smart Life associati > ";
            if($_GET['default']=="true"){
               $orientation = "DISPOSITIVI > Tutti i dispositivi"." > ".$_GET['prodX']." > Servizi Smart Life associati > ";
            }
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
               "catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation'].htmlspecialchars("&")."default=true'>Prodotti</a></li>";
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
           // send page to client
             echo $doc->saveHtml();	
             }
              $mysqli->close();
         }
         
	
		
		
	}
	
?>