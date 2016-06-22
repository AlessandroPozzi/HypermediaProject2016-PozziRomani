<?php

getBusiness();

function getBusiness(){
    
    $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
    
    if (mysqli_connect_errno()){
        echo "Error".mysqli_connect_error();
        exit();
    }
    else{
            
            $query = "SELECT title, st.content
                      FROM single_topic st JOIN single_topic_content stc
                      WHERE st.name='Aspetti di mercato'
                            AND stc.name='Business'";
            
            $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    
                    $myArray[] = array_map('utf8_encode', $row);
                    
                }
                
                //free result
                $result->close();

                //close connection
                $mysqli->close();
                
                foreach($myArray as $elem){
                 
                    $doc = new DOMDocument();
                    $doc->loadHTMLFile("../pages/business.html");
                    $xpathsearch = new DOMXPath($doc);

                    

                    //handle title
                   $titlenodes = $xpathsearch->query('//h2[contains(@id,"business_title")]');
                   $title_parent_path = ($titlenodes->item(0)->getNodePath())."/..";
                   $newtitle = $doc->createDocumentFragment();
                   $titlecode = "<h2 id='business_title'>".$elem['title']."</h2>";
                   $newtitle->appendXML($titlecode);
                   $title_parents= $xpathsearch->query($title_parent_path); 
                   $title_parents->item(0)->replaceChild($newtitle,$titlenodes->item(0));
                    
                    //handle main content
                   $node = $xpathsearch->query('//p[contains(@id,"description")]');
                   $parent_path = ($node->item(0)->getNodePath())."/..";
                   $newcontent = $doc->createDocumentFragment();
                   $contentcode = "<p id='description'>".$elem['content']."</p>";
                   $newcontent->appendXML($contentcode);
                   $title_parents= $xpathsearch->query($parent_path); 
                   $title_parents->item(0)->replaceChild($newcontent,$node->item(0));
                    
                   
                }
               
                echo $doc->saveHtml();	
                
            }
            
    
            
    
    }
    

}

?>