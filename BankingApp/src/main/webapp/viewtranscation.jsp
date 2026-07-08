i<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,connection.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Statement</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    font-family:Arial,Helvetica,sans-serif;
}

.bank-card{
    max-width:1100px;
    margin:50px auto;
    border:none;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,.25);
}

.bank-header{
    background:#17a2b8;
    color:white;
    text-align:center;
    padding:30px;
}

.card-body{
    padding:30px;
}

.table th{
    background:#0d6efd;
    color:white;
}

.btn-home{
    border-radius:30px;
    padding:10px 30px;
}

</style>

</head>

<body>

<div class="container">

    <div class="card bank-card">

        <div class="bank-header">
            <h2>🏦 Online Banking</h2>
            <p>Transaction Statement</p>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-bordered table-hover table-striped text-center">

                    <thead>

                    <tr>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Date & Time</th>
                        <th>Amount (₹)</th>
                        <th>Balance (₹)</th>
                    </tr>

                    </thead>

                    <tbody>

<%

try{

    Connection connect=DBConnection.getConnection();

    Statement state=connect.createStatement();

    HttpSession sessions=request.getSession();

    if(sessions!=null){

        Integer number=(Integer)sessions.getAttribute("usernumber");

        int accountnumber=number.intValue();

        String startStr=(String)sessions.getAttribute("start");

        String endStr=(String)sessions.getAttribute("end");

        ResultSet rs;

        if(startStr!=null && endStr!=null &&
           !startStr.trim().isEmpty() &&
           !endStr.trim().isEmpty()){

            java.sql.Date sdate=java.sql.Date.valueOf(startStr);

            java.sql.Date edate=java.sql.Date.valueOf(endStr);

            rs=state.executeQuery(
            "select * from transactionhistory where date_time::DATE between '"
            +sdate+
            "' and '"+
            edate+
            "' and user_id="+
            accountnumber);

        }
        else{

            rs=state.executeQuery(
            "select * from transactionhistory where user_id="+accountnumber);

        }

        while(rs.next()){

%>

<tr>

<td><%=rs.getString("amount_type")%></td>

<td><%=rs.getString("description")%></td>

<td><%=rs.getTimestamp("date_time")%></td>

<td>₹ <%=rs.getInt("transaction_amount")%></td>

<td>₹ <%=rs.getInt("balance_after")%></td>

</tr>

<%

        }

        rs.close();

        state.close();

        connect.close();

    }

}catch(Exception e){

%>

<tr>

<td colspan="5" class="text-danger">

<%=e.getMessage()%>

</td>

</tr>

<%

}

%>

                    </tbody>

                </table>

            </div>

            <div class="text-center mt-4">

                <a href="home.jsp" class="btn btn-primary btn-home">
                    ⬅ Back to Home
                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>