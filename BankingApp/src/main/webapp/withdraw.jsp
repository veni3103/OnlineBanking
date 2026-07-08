i<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw Money</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    font-family:Arial,Helvetica,sans-serif;
}

.bank-card{
    max-width:500px;
    margin:50px auto;
    border:none;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,.25);
}

.bank-header{
    background:#0d6efd;
    color:white;
    text-align:center;
    padding:30px;
}

.card-body{
    padding:30px;
}

.form-control{
    border-radius:10px;
    height:45px;
}

.btn-submit{
    width:100%;
    padding:12px;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
}

.home-link{
    text-decoration:none;
    color:white;
    font-weight:bold;
}

.position-relative span{
    font-size:20px;
}

</style>

</head>

<body>

<div class="container">

    <div class="card bank-card">

        <div class="bank-header">
            <h2>🏦 Online Banking</h2>
            <p>Withdraw Money Securely</p>
            <a href="home.jsp" class="home-link">⬅ Back to Home</a>
        </div>

        <div class="card-body">

            <form action="withdraw" method="post">

                <input type="hidden" name="type" value="WITHDRAW">

                <div class="mb-3">
                    <label class="form-label">Account Number</label>
                    <input type="number"
                           class="form-control"
                           name="accountnumber"
                           placeholder="Enter Account Number"
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>

                    <div class="position-relative">

                        <input type="password"
                               class="form-control"
                               id="password"
                               name="password"
                               placeholder="Enter Password"
                               required>

                        <span onclick="togglePwd()"
                              style="position:absolute;right:15px;top:50%;transform:translateY(-50%);cursor:pointer;">
                            👁
                        </span>

                    </div>

                </div>

                <div class="mb-3">
                    <label class="form-label">Withdraw Amount</label>
                    <input type="number"
                           class="form-control"
                           name="amount"
                           placeholder="Enter Amount"
                           required>
                </div>

                <div class="mb-4">
                    <label class="form-label">OTP</label>
                    <input type="number"
                           class="form-control"
                           name="otp"
                           placeholder="Enter OTP (if required)">
                </div>

                <button type="submit" class="btn btn-danger btn-submit">
                    💸 Withdraw Money
                </button>

            </form>

        </div>

    </div>

</div>

<script>
function togglePwd(){
    var x = document.getElementById("password");

    if(x.type==="password"){
        x.type="text";
    }else{
        x.type="password";
    }
}
</script>

</body>
</html>