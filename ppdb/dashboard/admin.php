<?php
session_start();
if ($_SESSION['role'] != 'admin') {
  header('Location: ../login.php');
  exit;
}
echo "<h1>Admin Dashboard</h1>";
echo "<p>Selamat datang, " . $_SESSION['username'] . "</p>";
?>
