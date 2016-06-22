<?php

getNextInGroup($_POST["name"], $_POST["category"], $_POST["sl_info"], $_POST["assistance_info"]);

function getNextInGroup($name, $category, $sl, $assistance){
    
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
        
        if($category === "sl_relation"){ //special case: we have to this device page from an associated Smart Life service
            
            $query = "SELECT d.id_device, d.name 
                        FROM device d JOIN for_device_1 fd JOIN sl s   
                        WHERE s.name="."'".$sl."' 
                                AND s.id_sl = fd.id_sl 
                                AND fd.id_device = d.id_device 
                        ORDER BY d.id_device";
           
        }elseif($category === "assistance_relation"){
            
            $query = "SELECT d.id_device, d.name 
                        FROM device d JOIN for_device_2 fd JOIN assistance a   
                        WHERE a.name="."'".$assistance."' 
                                AND a.id_assistance = fd.id_assistance
                                AND fd.id_device = d.id_device
                                ORDER BY d.id_device";
            
        }elseif($category === "Tutti i dispositivi"){ //special case: the category is all devices (not explictly present in database)
            
            $query = "Select id_device, name
                      FROM device
                      ORDER BY id_device";
            
        }else{ //standard case: we have come here from a device category
                  $query = "SELECT id_device, name 
                  FROM device d 
                  INNER JOIN device_categories_content dcc
                      on d.name = dcc.content
                  WHERE dcc.device_category ="."'".$category."'
                  ORDER BY id_device";
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
        
        $id_device =  null;
        $found = false;
        
        foreach ($myArray as $elem){
            if($found){
                
                $id_device = $elem["id_device"];
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
        
        //Recover the next device:
        
        $query = "SELECT name, description, characteristics, price
                  FROM device
                  WHERE id_device=".$id_device;
       
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