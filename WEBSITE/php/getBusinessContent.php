<?php

getBusinessContent($_POST["name"]);
/**
*  loads the content of one of the structural pages of Business topic
*  called via ajax to change asynchronously the page on the client side
*/
function getBusinessContent($name){
    
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
        
             $query = "SELECT st.title, st.content
                      FROM single_topic st JOIN single_topic_content stc
                      WHERE st.name="."'".$name."' 
                            AND stc.content = st.name
                            AND stc.name='Business'";
        
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