<?php
$username = $_POST['username'];
$password = $_POST['password'];
$role = $_POST['role'];
$conn = new mysqli("localhost", "root", "", "ppdb");

$conn->query("INSERT INTO users (username, password, role) VALUES ('$username', '$password', '$role')");
header('Location: ../login.php');
?>
