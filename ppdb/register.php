<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<h2>Register</h2>
<form action="auth/register_process.php" method="POST">
  Username: <input type="text" name="username"><br>
  Password: <input type="password" name="password"><br>
  Role:
  <select name="role">
    <option value="student">Student</option>
    <option value="admin">Admin</option>
  </select><br>
  <input type="submit" value="Register">
</form>
</body>
</html>
