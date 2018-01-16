<?php 

$conn = new mysqli("localhost", "root", "","ecommerce");
//$conn = new mysqli("localhost", "root", "toor","ecommerce");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

for ($j = 1; $j <= 48; $j++) {
for ($i = 1; $i <= 8; $i++) {
	$file = file_get_contents('./import/'.strval($j).' ('.strval($i).').jpg');
	//$file = base64_encode($file);
	$file = $conn->real_escape_string($file);
	//$file = addslashes($file);
	if($file == FALSE || $conn->query("INSERT INTO ProductPhoto (PhotoID, Image, ProductID) VALUES (NULL,'$file','$j')") !== TRUE){
		echo $conn->error;
		break;
	}
	else{
		echo "Item {$j} {$i} successfully inserted </br>";
	}
}	
}

$conn->close();
?>