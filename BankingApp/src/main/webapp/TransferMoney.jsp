<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="transferAmount" method="post">
 <input type="hidden" name="type" value="TRANSFER">
<label for="sendernumber"> Sender Account number</label>
<input type="number" name="sendernumber" id="sendernumber" placeholder="Enter sender AccounNumber here" required>
<br>
<label for="password">password</label>
<input type="password" name="password" id="password" placeholder="Sender  password " required>
<br>
<label for="receivernumber"> Receiver Account number</label>
<input type="number" name="receivernumber" id="receivernumber" placeholder="Enter receiver AccountNumber here" required>
<br>
<label for="amount"> Amount</label>
<input type="number" name="amount" id="amount" placeholder="Enter Amounnt you Transfer" required> 
<br>
<label for="confirm">Press 1 for confirmation</label>
<input type="number" name="confirm" id="confirm" required>
<br>
<button type="submit">submit</button>
<br>
<a href="home.jsp">Home</a>
</form>

</body>
</html>