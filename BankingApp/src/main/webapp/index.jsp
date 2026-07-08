<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Banking</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
body{
    background: linear-gradient(135deg,#0d6efd,#4facfe);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Arial, Helvetica, sans-serif;
}

.bank-card{
    width:420px;
    border:none;
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,.3);
}

.header{
    background:#0d6efd;
    color:white;
    padding:30px;
}

.bank-icon{
    font-size:60px;
}

.btn-custom{
    width:100%;
    border-radius:50px;
    padding:12px;
    font-size:18px;
    font-weight:bold;
    margin-top:15px;
}

.footer{
    color:gray;
    font-size:13px;
    margin-top:20px;
}
</style>

</head>
<body>

<div class="card bank-card">

    <div class="header text-center">
        <i class="bi bi-bank bank-icon"></i>
        <h2 class="mt-3">Online Banking</h2>
        <p>Your trusted banking partner</p>
    </div>

    <div class="card-body p-4">

        <a href="Login.jsp" class="btn btn-primary btn-custom">
            <i class="bi bi-box-arrow-in-right"></i>
            Customer Login
        </a>

        <a href="Admin.jsp" class="btn btn-dark btn-custom">
            <i class="bi bi-person-lock"></i>
            Admin Login
        </a>

        <a href="AccountOpening.jsp" class="btn btn-success btn-custom">
            <i class="bi bi-person-plus-fill"></i>
            Open New Account
        </a>

        <div class="footer text-center">
            Secure • Fast • Reliable
        </div>

    </div>

</div>

</body>
</html>