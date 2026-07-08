<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Banking Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    font-family:Arial,Helvetica,sans-serif;
}

.dashboard{
    max-width:950px;
    margin:40px auto;
}

.bank-header{
    background:white;
    border-radius:20px;
    padding:25px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,.2);
    margin-bottom:30px;
}

.option-card{
    border:none;
    border-radius:20px;
    text-align:center;
    padding:25px;
    box-shadow:0 8px 20px rgba(0,0,0,.15);
    transition:.3s;
    height:180px;
}

.option-card:hover{
    transform:translateY(-5px);
}

.option-card h1{
    font-size:45px;
}

.option-card a{
    margin-top:15px;
    width:100%;
    border-radius:25px;
}

.logout{
    margin-top:30px;
}

</style>

</head>

<body>

<div class="container dashboard">

    <div class="bank-header">
        <h2>🏦 ONLINE BANKING</h2>
        <h5>Welcome</h5>
        <p>Choose a banking service below.</p>
    </div>

    <div class="row g-4">

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>💰</h1>
                <h5>Deposit</h5>
                <a href="deposit.jsp" class="btn btn-success">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>💸</h1>
                <h5>Withdrawal</h5>
                <a href="withdraw.jsp" class="btn btn-danger">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>💳</h1>
                <h5>View Balance</h5>
                <a href="balance.jsp" class="btn btn-primary">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>📄</h1>
                <h5>Statement</h5>
                <a href="TransactionHistory.jsp" class="btn btn-info">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>🔄</h1>
                <h5>Money Transfer</h5>
                <a href="TransferMoney.jsp" class="btn btn-warning">Open</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="option-card bg-white">
                <h1>🔒</h1>
                <h5>Change Password</h5>
                <a href="changepassword.jsp" class="btn btn-dark">Open</a>
            </div>
        </div>

    </div>

    <div class="text-center logout">

        <a href="forgetpassword.jsp" class="btn btn-secondary me-2">
            Forgot Password
        </a>

        <a href="index.jsp" class="btn btn-outline-light">
            Logout
        </a>

    </div>

</div>

</body>
</html>