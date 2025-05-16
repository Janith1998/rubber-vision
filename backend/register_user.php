<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");

require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullName = $_POST['full_name'] ?? '';
    $email = $_POST['email'] ?? '';
    $mobile = $_POST['mobile'] ?? '';
    $address = $_POST['address'] ?? '';


    if (!$fullName || !$email || !$mobile || !$address) {
        echo json_encode(["status" => "error", "message" => "Missing required fields"]);
        exit();
    }

    // Check if email already exists
    $checkQuery = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $checkQuery->bind_param("s", $email);
    $checkQuery->execute();
    $checkQuery->store_result();

    if ($checkQuery->num_rows > 0) {
        echo json_encode(["status" => "error", "message" => "Email already exists"]);
        exit();
    }

    // Insert user
    $stmt = $conn->prepare("INSERT INTO users (full_name, email, mobile, address) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $fullName, $email, $mobile, $address);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "User registered"]);
    } else {
        echo json_encode(["status" => "error", "message" => $stmt->error]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method"]);
}
?>
