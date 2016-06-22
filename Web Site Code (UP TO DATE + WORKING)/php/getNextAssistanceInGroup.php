<?php

getNextInGroup($_POST["name"], $_POST["category"], $_POST["device_info"]);

function getNextInGroup($name, $category, $device){
    
    mysql_query("SET NAMES 'utf8_bin'");
    mysql_query("SET CHARACTER SET utf8_bin");
    mysql_query("SET COLLATION_CONNECTION = 'utf8mb4_bin'");
    
    $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
    
    if (mysqli_connect_errno()){
        echo "Error".mysqli_connect_error();
        exit();
    }
    else{

        mysql_query("SET NAMES 'utf8_bin'");
        mysql_query("SET CHARACTER SET utf8_bin");
        mysql_query("SET COLLATION_CONNECTION = 'utf8mb4_bin'");
        
        if($category === "device_relation"){ //special case: we have come to this assistance page from an associated device
            
            
            $query = "SELECT a.id_assistance, a.name 
                        FROM assistance a JOIN assistance_for af JOIN device d   
                        WHERE d.name="."'".$device."' 
                                AND a.id_assistance = af.id_assistance
                                AND d.id_device = af.id_device
                        ORDER BY a.id_assistance";
           
            
        }elseif($category === "Tutti i servizi di Assistenza"){ //special case: the category is all the assistances (not explictly present in database)
            
            $query = "Select id_assistance, name
                      FROM assistance
                      ORDER BY id_assistance";
            
        }else{ //standard case: we have come here from a single assistance category
                  $query = "SELECT a.id_assistance, a.name 
                  FROM assistance a 
                  INNER JOIN assistance_categories_content acc
                      on a.name = acc.content
                  WHERE acc.assistance_category ="."'".$category."'
                  ORDER BY a.id_assistance";
        }
        $result = $mysqli->query($query);

        if (!$result) {
            echo 'Could not run query: ' . mysql_error();
            exit;
        }else{
            $myArray = array();
            while($row = $result->fetch_array(MYSQL_ASSOC)){
                
                $myArray[] = array_map('utf8_encode', $row);

            }
        }
        
        $id_assistance =  null;
        $found = false;
        
        foreach ($myArray as $elem){
            if($found){
                
                $id_assistance = $elem["id_assistance"];
                $found = false;
                break;
            }
            
            if($elem["name"] == $name){
                $found = true;
            }
            
        }
        
        if ($found == true){ //End of the group list reached; echo an empty json
            echo "{}";
            exit;
        }
        
        $result->close();
        
        //Recover the next assistance:
        
        $query = "SELECT name, description
                  FROM assistance
                  WHERE id_assistance=".$id_assistance;
       
        $result = $mysqli->query($query);

        if($result->num_rows>0)
        {
            $myArray = array();
            while($row = $result->fetch_array(MYSQL_ASSOC)){

                $myArray[] = array_map('utf8_encode', $row);

            }

            echo json_encode($myArray, JSON_UNESCAPED_UNICODE );
        }
        
            //free result
            $result->close();

            //close connection
            $mysqli->close();
    }
    

    
}


?>