<?php

//$queryResult=getDescription($_POST["pt"]);
getDescription();
//echo $queryResult;

function getDescription($name){
    mysql_query("SET NAMES 'utf8_bin'");
            mysql_query("SET CHARACTER SET utf8_bin");
            mysql_query("SET COLLATION_CONNECTION = 'utf8mb4_bin'");
    $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
    //mysql_query('SET CHARACTER SET utf8');
    //sql query
    
    if (mysqli_connect_errno()){
        echo "Error".mysqli_connect_error();
        exit();
    }
    else{
        //echo "successufl connection";
            
            //$query = "SELECT name,description,price" FROM "device" WHERE ;
            //mysql_query('SET CHARACTER SET utf8');
            //mysql_query("SET NAMES latin1");
            mysql_query("SET NAMES 'utf8_bin'");
            mysql_query("SET CHARACTER SET utf8_bin");
            mysql_query("SET COLLATION_CONNECTION = 'utf8mb4_bin'");
            $query = "SELECT * FROM device";
			//$query = "SELECT * FROM test_table";
            //mysqli_query($result,"SELECT * FROM test_table");
            //$query ="SELECT category FROM high_level_categories WHERE macro_group=DISPOSITIVI";
			
            $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                   //echo $row[name];
                   //echo $row[descr];
                   
                    //$myArray[] = $row;
                    
                    $myArray[] = array_map('utf8_encode', $row);
                }

                //echo "OK";
                //echo $myArray;
                //$somearray['mystring'] = utf8_encode($mystring);
                //echo json_encode($myArray);
               
	  			echo json_encode($myArray, JSON_UNESCAPED_UNICODE );
                //echo json_last_error ();
                //echo json_encode("{[àààààèèèèèòòòò]}",JSON_UNESCAPED_UNICODE);
            }
            //free result
            $result->close();

            //close connection
            $mysqli->close();
    }
    

    
}


?>