<?php

    For_Device1();
		
         /** 
        *  Receives parameters via url, uses the name of a smart life to retrieve all the
        *  devices related to it and build the proper html page. 
        *  To allow maintaining the notion of a context, it
        *  receives also info about the orientation path and the category used to reach the smart life.
        *  It uses also a flag parameter true-false which specifies if the above said context is stil
        *  needed or can be reset (we do allow infinite loops between relations but keep only the last context).
        */
        
       function For_Device1(){
       	
		$slX = $_GET['slX'];
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
       
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{

             $query1 ="SELECT d.name FROM device d JOIN for_device_1 fd JOIN sl s WHERE s.name="."'".$slX."' AND s.id_sl = fd.id_sl AND
			 fd.id_device = d.id_device ORDER BY d.id_device";
             $result1 = $mysqli->query($query1);
             
             $queryimage1="SELECT url FROM content_images WHERE content='DISPOSITIVI'";
             $resultimage1 = $mysqli->query($queryimage1);
			
			 
		     manipulateResults($result1,$mysqli, $resultimage1);
			
			

            //close connection
            $mysqli->close();
            
		 }
       }
	   // performs the actual stuff on the query results
	   function manipulateResults($result,$mysqli, $resultimage){
		   
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           
            //handle title
           $titlenodes = $xpathsearch->query('//h2[contains(@id,"title")]'); 
           $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
           $newtitle = $doc->createDocumentFragment();
           $slX = $_GET['slX']." - Prodotti associati";
           $titlecode = "<h2 id='title'>{$slX}</h2>";
           $newtitle->appendXML($titlecode);
           $title_parents= $xpathsearch->query($title_parent_path); 
           $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
           
           //handle go back button
            
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode="";
           if($_GET['default']=="false"){
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['slX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation']."'>Vai a ".$_GET['slX']."</a>";
           }else{
               $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['slX'].htmlspecialchars("&")."catX=Tutti i servizi Smart Life".htmlspecialchars("&")."orientation=SMART LIFE > Tutti i servizi Smart Life'>Vai a ".$_GET['slX']."</a>";
           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));
           
           
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
           
           
              //handle orientation info
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
           if($_GET['default']=="false"){
             $orientation=$_GET['orientation']." > ".$_GET['slX']." > Prodotti associati";
             }else{
             $orientation="SMART LIFE > Tutti i servizi Smart Life > ".$_GET['slX']." > Prodotti associati";
             }
           $orientationcode = "<small id='orientation'>{$orientation}</small>";
           $neworientation->appendXML($orientationcode);
           $orientation_parents= $xpathsearch->query($orientation_parent_path); 
           $orientation_parents->item(0)->replaceChild($neworientation,$orientation_nodes->item(0));
           
           
           
           // find the tag where to put the query results
           $nodes = $xpathsearch->query('//div[contains(@class,"result")]'); 
		   
		   
		   
		   if($result->num_rows>0){
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] =  array_map('utf8_encode', $row);
                    
                }
				// should be only one iteration
			   foreach($nodes as $node){
				   $acc=array();
				   $count=0;
				  foreach($myArray as $elem){
					$count = $count + 1; 
					$newnode = $doc->createDocumentFragment();
                
                
					$content=$elem['name'];
                    // we want the img from the db
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
                    $href="";
                    // choose if reset context or not
                     if($_GET['default']=="false"){
                        $href = "<a href='for_Device1_Target.php?name=".$elem['name'].htmlspecialchars("&")."slX=".$_GET['slX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation']."'>"; // TO BE CHANGED
                     }else{
                           $href = "<a href='for_Device1_Target.php?name=".$elem['name'].htmlspecialchars("&")."slX=".$_GET['slX'].htmlspecialchars("&")."catX=Tutti i servizi Smart Life".htmlspecialchars("&")."orientation=SMART LIFE > Tutti i servizi Smart Life'>"; // TO BE CHANGED
                  
                     }
                    $codeprimary =$href."<div class= 'panel panel-primary'>{$codeimgandfooter}</div></a>";
                    $code= "<div class="."'col-sm-3'".">{$codeprimary}</div>";

                 
                    array_push($acc,$code);
					// only 4 items in a row
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
				
					
				 } // last row
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
			   }// send page to client
              echo $doc->saveHtml();	
              
              
			 }
	   }


     ?>