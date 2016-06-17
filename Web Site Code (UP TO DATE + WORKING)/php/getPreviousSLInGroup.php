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
        
        if($category === "Tutti i servizi Smart Life"){ //special case: all devices
            
            $query = "Select id_sl, name
                      FROM sl
                      ORDER BY id_sl";
            
        }else{
            
            $query = "SELECT id_sl, name 
                  FROM sl
                  INNER JOIN sl_categories_content scc
                      on sl.name = scc.content
                  WHERE scc.sl_category ="."'".$category."'
                  ORDER BY id_sl";
            
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
        
        $id_sl =  null;
        $previous_elem = null;
        
        foreach ($myArray as $elem){
            
            if($elem["name"] == $name){
                if ($previous_elem != null){
                    //we have found the previous product in list
                    $id_sl = $previous_elem["id_sl"]; 
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
                  FROM sl
                  WHERE id_sl=".$id_sl;
        
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