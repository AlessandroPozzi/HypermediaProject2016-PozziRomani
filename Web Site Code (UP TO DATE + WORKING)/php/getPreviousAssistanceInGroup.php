<?php

getPreviousInGroup($_POST["name"], $_POST["category"], $_POST["device_info"]);

function getPreviousInGroup($name, $category, $device){
    
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
        
        if($category === "device_relation"){ //special case: we have to this device page from an associated Smart Life service
            
            /*
            $query = "SELECT d.id_device, d.name 
                        FROM device d JOIN for_device_1 fd JOIN sl s   
                        WHERE s.name="."'".$sl."' 
                                AND s.id_sl = fd.id_sl 
                                AND fd.id_device = d.id_device 
                        ORDER BY d.id_device";
           */
            
            
        }elseif($category === "Tutti i servizi di Assistenza"){ //special case: the category is all devices (not explictly present in database)
            
            $query = "Select id_assistance, name
                      FROM assistance
                      ORDER BY id_assistance";
            
        }else{ //standard case: we have come here from a device category
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
        $previous_elem = null;
        
        foreach ($myArray as $elem){
            
            if($elem["name"] == $name){
                if ($previous_elem != null){
                    //we have found the previous product in list
                    $id_assistance = $previous_elem["id_assistance"]; 
                    break;
                }else{
                    //reached the beginning of the group list; echo a null json object
                    echo "{}";
                    exit;
                }
            }
            $previous_elem = $elem;
        }
        
        //Recover the previous device:
        
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