<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ChangePassword" method="post">
<label>Account number</label>
<input type="number" name="accountnumber" id="accountnumber" placeholder="enter your account number"  required>
<br>
<label for="currentpassword"> Current password</label>
<input type="password"  name="currentpassword" id="currentpassword" placeholder="Enter Current password " required>
<br>
<label for="newpassword"> New password</label>
<input type="password"  name="newpassword" id="newpassword" placeholder="Enter new password " required>
<br>
<label for="confirmpassword"> Confirm new password</label>
<input type="password"  name="confirmpassword" id="confirmpassword" placeholder="Enter  new password " required>
<br>
<br>
<button type="submit">Submit</button>
<br>
<br>
<a href="home.jsp"> home</a>
<br>
</form>
</body>
</html>