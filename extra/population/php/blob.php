<?php 

$conn = new mysqli("localhost", "root", "","devecommerce");
//$conn = new mysqli("localhost", "root", "toor","ecommerce");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";


for ($i = 1; $i <= 200; $i++) {
	$file = file_get_contents('./img/1 ('.strval($i).')');
	$file = base64_encode($file);
	$file = $conn->real_escape_string($file);
	//$file = addslashes($file);
	if($conn->query("INSERT INTO ShopPhoto (Image, ShopID) VALUES ('$file','$i')") !== TRUE){
		echo $conn->error;
		break;
	}
	else{
		echo "Item {$i} successfully inserted </br>";
	}	
}

$conn->close();
?>