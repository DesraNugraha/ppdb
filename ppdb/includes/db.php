<?php
$conn = new mysqli("localhost", "root", "", "ppdb");
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
