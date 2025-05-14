<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "rubber";

// MySQL connection
$conn = new mysqli($host, $user, $pass, $db);

// Check for connection error
if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]));
}
?>
