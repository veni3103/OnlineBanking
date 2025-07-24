<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="viewBalance" method="post">
<a href="home.jsp">Home</a>
<br>
<label for="accountnumber">Account number</label>
<input type="number" name="accountnumber" id="accountnumber" placeholder="Enter your account number" required>
<br>
<label for="password">Password</label>
<input type="password" name="password" id="password" placeholder="Enter your password" required>
<br>
<button type="submit">Submit</button>
</form>

</body>
</html>