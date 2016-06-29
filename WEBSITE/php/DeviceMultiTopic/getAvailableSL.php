<?php

getAvailableSL($_POST["name"]);
/**
*   Search the SL services related to the same device and
*   send them to the client wrapped in a json object
*   the file is called with ajax to change asynchronously the page
*/
function getAvailableSL($name){
    
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
        
            $query = "SELECT sl.name
                      FROM sl
                      INNER JOIN available_sl_service ass
                      on sl.id_sl = ass.id_sl
                      INNER JOIN device d
                      on d.id_device = ass.id_device
                      WHERE d.name="."'".$name."'";
			
            $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    
                    $myArray[] = array_map('utf8_encode', $row);
                    
                }
               
	  			echo json_encode($myArray, JSON_UNESCAPED_UNICODE );
                
            }else{
                echo "{}";
            }
            //free result
            $result->close();

            //close connection
            $mysqli->close();
    }

}

?>