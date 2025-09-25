<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
</head>
<body>

<form action="ForgetPassword" method="post">
<label>Account number</label>
<input type="number" name="accountnumber" id="accountnumber" placeholder="enter your account number"  required>
<br>
<label for="email" >Email id</label>
<input type="email" name="email" id="email" placeholder="enter your email id" required>
<br>
<label for="DOB" >DOB</label>
<input type="date" name="DOB" id="DOB" placeholder="enter your DOB " required>
<br>
<label for="password">password</label>
<input type="password"  name="password" id="password" placeholder="Enter new password " required>
<br>
<button type="submit">Submit</button>
<br>
<br>
<a href="home.jsp"> home</a>
<br>
</form>
</body>
</html>