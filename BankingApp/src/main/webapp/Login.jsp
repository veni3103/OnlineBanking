<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form action="login" method="post">
<label for="accountnumber" >AccountNumber</label>
<input type="number" name="accountnumber" id="accountnumber" placeholder="enter your account number" required>
<br>
<label for="password">Password</label>
<input type="password" name="password" id="password" placeholder="enter your password" required>
<br>
<button type="submit">submit</button>
</form>
</body>
</html>