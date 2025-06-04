<?php
session_start();
if ($_SESSION['role'] != 'student') {
  header('Location: ../login.php');
  exit;
}
echo "<h1>Student Dashboard</h1>";
echo "<p>Selamat datang, " . $_SESSION['username'] . "</p>";
?>
