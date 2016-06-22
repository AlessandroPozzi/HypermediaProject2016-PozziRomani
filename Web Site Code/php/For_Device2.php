<?php

    For_Device2();
		
       function For_Device2(){
       	$catX = $_GET['catX'];
		$assX = $_GET['assX'];
		   
          $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
        //sql query
         if (mysqli_connect_errno()){
            echo "Error".mysqli_connect_error();
            exit();
         }
         else{

             $query1 ="SELECT d.name FROM device d JOIN for_device_2 fd JOIN assistance a WHERE a.name="."'".$assX."' AND a.id_assistance = fd.id_assistance AND
			 fd.id_device = d.id_device ORDER BY d.id_device";
			 
            

             $result1 = $mysqli->query($query1);
			
			 
		     manipulateResults($result1,$mysqli);
			
			

            //close connection
            $mysqli->close();
            
		 }
       }
	   
	   function manipulateResults($result,$mysqli){
		    $catX = $_GET['catX'];
		   $doc = new DOMDocument();
           $doc->loadHTMLFile("../pages/categories.html");
		   $xpathsearch = new DOMXPath($doc);
           
            //handle title
           $titlenodes = $xpathsearch->query('//h2[contains(@id,"title")]'); 
           $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
           $newtitle = $doc->createDocumentFragment();
           $prodX = $_GET['assX']." - Prodotti associati";
           $titlecode = "<h2 id='title'>{$assX}</h2>";
           $newtitle->appendXML($titlecode);
           $title_parents= $xpathsearch->query($title_parent_path); 
           $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
           
           //handle go back button
            
           $backnodes = $xpathsearch->query('//a[contains(@id,"back")]'); 
           $back_parent_path = ($backnodes->item(0)->getNodePath())."/..";
           $newback = $doc->createDocumentFragment();
           $backcode="";
           if($_GET['default']=="false"){
             $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['assX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation']."'>Vai a ".$_GET['assX']."</a>";
           }else{
             $backcode = "<a class='nav-link active' id='back' href='http://timhypermediaproject2016.altervista.org/php/getMultiTopic.php?name=".$_GET['assX'].htmlspecialchars("&")."catX=Tutti i servizi di Assistenza".htmlspecialchars("&")."orientation=ASSISTENZA > Tutti i servizi di Assistenza'>Vai a ".$_GET['assX']."</a>";

           }
           $newback->appendXML($backcode);
           $back_parents = $xpathsearch->query($back_parent_path); 
           $back_parents->item(0)->replaceChild($newback,$backnodes->item(0));
           
           
              //handle orientation info
           $orientation_nodes = $xpathsearch->query('//small[contains(@id,"orientation")]'); 
           $orientation_parent_path = ($orientation_nodes->item(0)->getNodePath())."/..";
           $neworientation = $doc->createDocumentFragment();
           $orientation= "";
           if($_GET['default']=="false"){
              $orientation=$_GET['orientation']." > ".$_GET['assX']." > Prodotti associati";
              }else{
              $orientation="ASSISTENZA > Tutti i servizi di Assistenza > ".$_GET['assX']." > Prodotti associati";
              }
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
                
                
					$content=$elem['name'];
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
                    if($_GET['default']=="false"){
                    $href = "<a href='for_Device2_Target.php?name=".$elem['name'].htmlspecialchars("&")."assX=".$_GET['assX'].htmlspecialchars("&")."catX=".$_GET['catX'].htmlspecialchars("&")."orientation=".$_GET['orientation']."'>"; // TO BE CHANGED
                   }else{
                     $href = "<a href='for_Device2_Target.php?name=".$elem['name'].htmlspecialchars("&")."assX=".$_GET['assX'].htmlspecialchars("&")."catX=Tutti i servizi di Assistenza".htmlspecialchars("&")."orientation=ASSISTENZA > Tutti i servizi di Assistenza'>"; // TO BE CHANGED

                   }
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