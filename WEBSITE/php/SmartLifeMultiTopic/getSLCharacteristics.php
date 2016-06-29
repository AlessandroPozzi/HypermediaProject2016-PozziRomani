<?php

getSLCharacteristics($_POST["name"]);
/**
*   Search the characteristics of a SL service and
*   send them to the client wrapped in a json object
*   the file is called with ajax to change asynchronously the page
*/
function getSLCharacteristics($name){
    
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
        
            $query = "SELECT sb.name, sb.content
                      FROM sl_benefits sb
                      INNER JOIN sl_to_benefits stb
                      on stb.id_benefit = sb.id_benefit
                      INNER JOIN sl
                      on sl.id_sl = stb.id_sl
                      WHERE sl.name="."'".$name."'";
			
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