<?php

$queryResult=getDescription($_POST["pt"]);

echo $queryResult;

function getDescription($pt){
    
    $mysqli = new mysqli("%", "amaldi", "manzini", "hyp");
    //sql query
    if (mysqli_connect_errno()){
        echo "Error".mysqli_connect_error();
        exit();
    }
    else{
        echo "successufl connection";
    }
    
    $query = "SELECT name FROM sl";
    
    $result = $mysqli->query($query);
    
    if($result->num_rows>0)
    {
        $myArray = array();
        while($row = $result->fetch_array(MYSQL_ASSOC)){
            $myArray[] = $row;
        }
        echo json_encode($myArray);
    }
    
}


?>