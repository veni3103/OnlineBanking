<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>
</head>
<body>
<form action="withdraw" method="post">
<a href="home.jsp">Home</a>
<br>
<input type="hidden" name="type" value="WITHDRAW">
<label>Account number</label>
<input type="number" name="accountnumber" id="accountnumber" placeholder="Enter your account number" required>
<br>
<label for="password">Password</label>
<input type="password"  name="password" id="password" placeholder=" Enter password " required>
<br>
<label for="amount">Withdraw Amount</label>
<input type="number"  name="amount" id="amount" placeholder="Enter withdraw amount" required>
<br>
<label for="otp">OTP</label>
<input type="number" name="otp" id="otp"  >
<br>
<button type="submit">Submit</button>
<br>
</form>
</body>
</html>