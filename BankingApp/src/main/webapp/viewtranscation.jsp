<%@page
	import="jdk.internal.org.jline.terminal.TerminalBuilder.SystemOutput"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,connection.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<%
Connection connect; 
try{
connect=DBConnection.getConnection() ;
 Statement state=connect.createStatement();
 HttpSession sessions=request.getSession();
 if(sessions != null){
 Integer number=(Integer)sessions.getAttribute("usernumber");
 int accountnumber=number.intValue();
 ResultSet rs=state.executeQuery("select * from transactionhistory where user_id="+accountnumber+";");
 out.println("<table>");
 out.println("<tr><th>Transaction_id</th><th>Type</th><th>Description</th><th>DateAndTime</th><th>TransactionAmount</th><th>Balance</th></tr>");
 while(rs.next()){
	   int id=rs.getInt("transaction_id");
	   String amountType=rs.getString("amount_type");
	   String descrip=rs.getString("description");
	   Timestamp timestamp = rs.getTimestamp("date_time");
	   int balance=rs.getInt("balance_after");
	   int transAmount=rs.getInt("transaction_amount");
	      out.println("<tr>");
	     out.println("<td>" + id + "</td>");
	     out.println("<td>" + amountType + "</td>");
	     out.println("<td>" + descrip + "</td>");
	     out.println("<td>" + timestamp + "</td>");
	     out.println("<td>" + transAmount + "</td>");
	     out.println("<td>" +balance + "</td>");
	     out.println("</tr>");
	 }
 out.println("</table>");
 }
 else{
	 
 }
}
catch(Exception e){
	e.printStackTrace();
}
%>
<br>
<a href="home.jsp">Home</a> 
</form>
</body>
</html>