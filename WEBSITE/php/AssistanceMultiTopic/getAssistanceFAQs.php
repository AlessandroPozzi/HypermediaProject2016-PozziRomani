<?php

getAssistanceFAQs($_POST["name"]);
/**
*   Search the FAQs of an assistance service and
*   send them to the client wrapped in a json object
*   the file is called with ajax to change asynchronously the page
*/
function getAssistanceFAQs($name){
    
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
        
            $query = "SELECT af.question, af.answer
                      FROM assistance_faq af
                      INNER JOIN assistance_to_faq atf
                      on af.id_faq = atf.id_FAQ
                      INNER JOIN assistance a
                      on a.id_assistance = atf.id_assistance
                      WHERE a.name="."'".$name."'";
			
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