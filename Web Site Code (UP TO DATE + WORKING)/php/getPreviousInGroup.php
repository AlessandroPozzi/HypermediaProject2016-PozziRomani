<?php

getPreviousInGroup($_POST["name"], $_POST["category"]);

function getPreviousInGroup($name, $category){
    
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

        $query = "SELECT id_device, name 
                  FROM device d 
                  INNER JOIN device_categories_content dcc
                      on d.name = dcc.content
                  WHERE dcc.device_category ="."'".$category."'
                  ORDER BY id_device";

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
        $previous_elem = null;
        
        foreach ($myArray as $elem){
            
            if($elem["name"] == $name){
                if ($previous_elem != null){
                    //we have found the previous product in list
                    $id_device = $previous_elem["id_device"]; 
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