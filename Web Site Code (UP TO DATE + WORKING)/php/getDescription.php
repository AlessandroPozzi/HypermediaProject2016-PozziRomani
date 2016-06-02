<?php

//$queryResult=getDescription($_POST["pt"]);
getDescription();
//echo $queryResult;

function getDescription($pt){
    
    $mysqli = new mysqli("localhost", "timhypermediaproject2016", "", "my_timhypermediaproject2016");
    //sql query
    if (mysqli_connect_errno()){
        echo "Error".mysqli_connect_error();
        exit();
    }
    else{
        //echo "successufl connection";
            
            $query = "SELECT * FROM sl";

            $result = $mysqli->query($query);

            if($result->num_rows>0)
            {
                $myArray = array();
                while($row = $result->fetch_array(MYSQL_ASSOC)){
                    $myArray[] = $row;
                    //echo $row[name];
                }
                //echo "OK";
                //echo $myArray;
	  			echo json_encode($myArray);
            }
            //free result
            $result->close();

            //close connection
            $mysqli->close();
    }
    

    
}


?>