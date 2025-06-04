<?php
session_start();
$username = $_POST['username'];
$password = $_POST['password'];
$conn = new mysqli("localhost", "root", "", "ppdb");

$result = $conn->query("SELECT * FROM users WHERE username='$username' AND password='$password'");
if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    $_SESSION['username'] = $user['username'];
    $_SESSION['role'] = $user['role'];
    if ($user['role'] == 'admin') {
        header('Location: ../dashboard/admin.php');
    } else {
        header('Location: ../dashboard/student.php');
    }
} else {
    echo "Login gagal. <a href='../login.php'>Coba lagi</a>";
}
?>
