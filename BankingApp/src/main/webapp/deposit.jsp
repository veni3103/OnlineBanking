<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Deposit Amount</h3>
<form action="deposit" method="post">
<a href="home.jsp"> home</a>
<br>
<br>
<label>Account number</label>
 <input type="hidden" name="type" value="DEPOSIT">
<input type="number" name="accountnumber" id="accountnumber" placeholder="enter your account number"  required>
<br>
<label for="password">password</label>
<input type="password"  name="password" id="password" placeholder="Enter password " required>
<br>
<label for="amount">deposit amount</label>
<input type="number"  name="amount" id="amount" placeholder="Enter deposit amount" required>
<br>
<a href="forgetpassword.jsp">Forget Password</a>
<button type="submit">submit</button>
</form>

</body>
</html>