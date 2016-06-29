<?php

       getElementOfCategory();
		/**
        *  Same functionality of the getCategories2 file, but performed at a lower level in the navigation path
        *  Builds a page with all the items belonging to a single category.
        *  We do not know from wich macro category the user come from so we try all the types of content
        * (device, SL, assistance) relying on the fact that the categories have unique names.
        */
       function getElementOfCategory(){
       	$catX = $_GET['catX'];
		
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{
              // default query for devices
             $query1 ="SELECT * FROM device_categories_content dcc JOIN device d WHERE dcc.device_category="."'".$catX."' AND dcc.content
             = d.name";
             
             // special case of "all" category hardcoded, ugly and bad but we had no time
             if($catX == "Tutti i dispositivi"){
             
                $query1="SELECT * FROM device_categories_content dcc JOIN device d WHERE dcc.content  = d.name";
           
             }
             $query1 = $query1." ORDER BY d.id_device";
             
               // default query for SL
			 $query2 ="SELECT * FROM sl_categories_content scc JOIN sl s WHERE scc.sl_category="."'".$catX."' AND scc.content = s.name";
              // special case of "all" category hardcoded, ugly and bad but we had no time
           if($catX == "Tutti i servizi Smart Life"){
                
                $query2="SELECT * FROM sl_categories_content scc JOIN sl s WHERE scc.content = s.name";
                 
             }
             $query2 = $query2." ORDER BY s.id_sl";
             
               // default query for assistance
			 $query3 ="SELECT * FROM assistance_categories_content acc JOIN assistance a WHERE assistance_category="."'".$catX."' AND acc.content
             = a.name";
                // special case of "all" category hardcoded, ugly and bad but we had no time
			 if($catX == "Tutti i servizi di Assistenza"){
              
                $query3 = "SELECT * FROM assistance_categories_content acc JOIN assistance a WHERE acc.content = a.name";
              
             }
             $query3 = $query3." ORDER BY a.id_assistance";

             $result1 = $mysqli->query($query1);
			 $result2 = $mysqli->query($query2);
			 $result3 = $mysqli->query($query3);
             
             //cover images
               $queryimage1="SELECT url FROM content_images WHERE content='DISPOSITIVI'";
               $resultimage1 = $mysqli->query($queryimage1);
             
             $queryimage2="SELECT url FROM content_images WHERE content='SMART LIFE'";
               $resultimage2 = $mysqli->query($queryimage2);
             
             $queryimage3="SELECT url FROM content_images WHERE content='ASSISTENZA'";
               $resultimage3 = $mysqli->query($queryimage3);
			 
             // 2 of the 3 results will always be empty and won't produce nothing
		     manipulateResults($result1,$mysqli, $resultimage1);
			 manipulateResults($result2,$mysqli, $resultimage2);
			 manipulateResults($result3,$mysqli, $resultimage3);
			

            //close connection
            $mysqli->close();
            
		 }
       }
       
       //performs actual stuff with query results and build the page
	   
	   function manipulateResults($result,$mysqli, $resultimage){
		   
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
           
           //handle image url
           if($resultimage->num_rows>0){
                $myArray = array();
                while($row = $resultimage->fetch_array(MYSQL_ASSOC)){
                    $imgArray[] =  array_map('utf8_encode', $row);
                }
            }

            foreach ($imgArray as $elem){ //should be only one result
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
           
           
           
           
           //find tag where to put query results
           $nodes = $xpathsearch->query('//div[contains(@class,"result")]'); 
		   
		  
		   
		   if($result->num_rows>0){
         
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				//should be only one iteration
			   foreach($nodes as $node){
				   $acc=array();
				   $count=0;
				  foreach($myArray as $elem){
					$count = $count + 1; 
                   
					$newnode = $doc->createDocumentFragment();
                
					$content=$elem['content'];
                    //we want the img from the db
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
                    $codeimgandfooter = "";
                    if($resultimg->num_rows == 0){
                       $codeimgandfooter = $codefooter;
                       }else{
                    $codeimgandfooter = $codeimg.$codefooter;
                    }
                    $href = "<a href='getMultiTopic.php?name=".$elem['content'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$orientation."'>";
                    $codeprimary =$href."<div class= 'panel panel-primary'>{$codeimgandfooter}</div></a>";
                    $code= "<div class="."'col-sm-3'".">{$codeprimary}</div>";

               
                    array_push($acc,$code);
					//only 4 elemnts in a row
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
			   }//send page to client
              echo $doc->saveHtml();	
              
              
			 }
	   }


     ?>