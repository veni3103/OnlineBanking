<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Arial, Helvetica, sans-serif;
}

.login-card{
    width:420px;
    border:none;
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,0.3);
}

.header{
    background:#0d6efd;
    color:white;
    text-align:center;
    padding:30px;
}

.bank-icon{
    font-size:55px;
}

.card-body{
    padding:35px;
}

.form-control{
    border-radius:12px;
    height:48px;
}

.btn-login{
    width:100%;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
    padding:10px;
}

.btn-home{
    width:100%;
    border-radius:30px;
    margin-top:15px;
}

.footer{
    text-align:center;
    margin-top:20px;
    color:gray;
    font-size:13px;
}

</style>

</head>

<body>

<div class="card login-card">

    <div class="header">
        <i class="bi bi-bank bank-icon"></i>
        <h2 class="mt-3">Online Banking</h2>
        <p>Secure Customer Login</p>
    </div>

    <div class="card-body">

        <form action="login" method="post">

            <div class="mb-3">
                <label class="form-label">
                    <i class="bi bi-credit-card"></i>
                    Account Number
                </label>

                <input
                    type="number"
                    class="form-control"
                    name="accountnumber"
                    placeholder="Enter Account Number"
                    required>
            </div>

            <div class="mb-4">
                <label class="form-label">
                    <i class="bi bi-lock-fill"></i>
                    Password
                </label>

                <input
                    type="password"
                    class="form-control"
                    name="password"
                    placeholder="Enter Password"
                    required>
            </div>

            <button type="submit" class="btn btn-primary btn-login">
                <i class="bi bi-box-arrow-in-right"></i>
                Login
            </button>

            <a href="index.jsp" class="btn btn-outline-primary btn-home">
                <i class="bi bi-house-door"></i>
                Back to Home
            </a>

        </form>

        <div class="footer">
            🔒 Your information is protected with secure encryption.
        </div>

    </div>

</div>

</body>
</html>