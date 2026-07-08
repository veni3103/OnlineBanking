
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connection.DBConnection,java.sql.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4 class="text-center">ONLINE BANKING</h4>
<br>
   <p class="text-center">Your trusted partner for safe and efficient online transactions.</p>
   <br>
   <a class ="text-center d-block" href="home.jsp"> Home</a>
   <br>
   <h3 class="text-center">YOUR ACCOUNTNUMBER </h3>
   <br>
    <h3 class="text-center"><%= session.getAttribute("AccountNumber")%></h3>
   

</body>
</html>