<?php

       getElementOfCategory();
		
       function getElementOfCategory(){
       	$catX = $_GET['catX'];
		
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{

             $query1 ="SELECT * FROM device_categories_content WHERE device_category="."'".$catX."'";
             if($catX == "Tutti i dispositivi"){
             
                $query1="SELECT * FROM device_categories_content";
             
             }
             $query1." ORDER BY id_device";
			 $query2 ="SELECT * FROM sl_categories_content WHERE sl_category="."'".$catX."'";
             if($catX == "Tutti i servizi Smart Life"){
                
                $query2="SELECT * FROM sl_categories_content";
                 
             }
             $query2." ORDER BY id_sl";
			 $query3 ="SELECT * FROM assistance_categories_content WHERE assistance_category="."'".$catX."'";
			 if($catX == "Tutti i servizi di Assistenza"){
              
                $query3 = "SELECT * FROM assistance_categories_content";
              
             }
           //  $query3." ORDER BY id_assistance";

             $result1 = $mysqli->query($query1);
			 $result2 = $mysqli->query($query2);
			 $result3 = $mysqli->query($query3);
			 
		     manipulateResults($result1,$mysqli);
			 manipulateResults($result2,$mysqli);
			 manipulateResults($result3,$mysqli);
			

            //close connection
            $mysqli->close();
            
		 }
       }
	   
	   function manipulateResults($result,$mysqli){
		   
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
         
            //handle title
           $titlenodes = $xpathsearch->query('//h2[contains(@id,"title")]'); 
           $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
           $newtitle = $doc->createDocumentFragment();
           $catX = $_GET['catX'];
           $titlecode = "<h2 id='title'>{$catX}</h2>";
           $newtitle->appendXML($titlecode);
           $title_parents= $xpathsearch->query($title_parent_path); 
           $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
          
           //handle go back button
           $query_back ="SELECT macro_group FROM high_level_categories WHERE category="."'".$catX."'";
           $result_back = $mysqli->query($query_back);
           $backArray = array();
           while($backrow = $result_back->fetch_array(MYSQL_ASSOC)){
                    $backArray[] =  array_map('utf8_encode', $backrow);
                    
              }
           $backElem = $backArray[0];  
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           if(!($backElem['macro_group']=="ASSISTENZA")){
              $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getCategories2.php?high_cat=".$backElem['macro_group']."'>Vai a ".$backElem['macro_group']."</a>";
           }else{
              $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getAssistanceCategories.php'>Vai a ".$backElem['macro_group']."</a>";
       
           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));
           
          
              //handle orientation info
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
           $orientation="Sei in: ".$backElem['macro_group']." > ".$catX;
           $orientationcode = "<small id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           
           
           
           
           $nodes = $xpathsearch->query('//div[contains(@class,"result")]'); 
		   
		  
		   
		   if($result->num_rows>0){
         
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				
			   foreach($nodes as $node){
				   $acc=array();
				   $count=0;
				  foreach($myArray as $elem){
					$count = $count + 1; 
                   
					$newnode = $doc->createDocumentFragment();
                
                
					$content=$elem['content'];
					$queryimg="SELECT url FROM content_images WHERE content="."'".$content."'";
					$resultimg=$mysqli->query($queryimg);
					$arrayresultimg = array();
                    while($rowimg = $resultimg->fetch_array(MYSQL_ASSOC)){
                    $arrayresultimg[] =  array_map('utf8_encode', $rowimg);
                    
                    }
					
                    $finalurl= $arrayresultimg[0];
					$url = "http://timhypermediaproject2016.altervista.org/img/".$finalurl['url'];
                    
					
					
					
					$codeimg = "<img class='img-responsive' src='".$url."'/>";
					
					$codefooter = "<div class="."'panel-footer name_elem'".">{$elem['content']}</div>";
                    $codeimgandfooter = $codeimg.$codefooter;
                    $href = "<a href='getMultiTopic.php?name=".$elem['content'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$orientation."'>";
                    $codeprimary =$href."<div class= 'panel panel-primary'>{$codeimgandfooter}</div></a>";
                    $code= "<div class="."'col-sm-3'".">{$codeprimary}</div>";

                   // $newnode->appendXML($code);
                    array_push($acc,$code);
					
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
              
              
			 }
	   }


     ?>