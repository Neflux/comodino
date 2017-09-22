<?php 

$conn = new mysqli("localhost", "root", "","ecommerce");
//$conn = new mysqli("localhost", "root", "toor","ecommerce");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";



	$file = file_get_contents('beko.jpg');
	//$file = base64_encode($file);
	$file = $conn->real_escape_string($file);
	//$file = addslashes($file);
	if($conn->query("INSERT INTO ProductPhoto (PhotoID,Image, ProductID) VALUES (null,'$file','22')") !== TRUE){
		echo $conn->error;
		break;
	}
	else{
		echo "Item successfully inserted </br>";
	}	

$conn->close();
?>