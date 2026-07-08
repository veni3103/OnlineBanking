<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Money Transfer</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    font-family:Arial,Helvetica,sans-serif;
}

.bank-card{
    max-width:550px;
    margin:50px auto;
    border:none;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 15px 35px rgba(0,0,0,.25);
}

.bank-header{
    background:#ffc107;
    color:#212529;
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
    color:#212529;
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
            <p>Transfer Money Securely</p>
            <a href="home.jsp" class="home-link">⬅ Back to Home</a>
        </div>

        <div class="card-body">

            <form action="transferAmount" method="post">

                <input type="hidden" name="type" value="TRANSFER">

                <div class="mb-3">
                    <label class="form-label">Sender Account Number</label>

                    <input
                        type="number"
                        class="form-control"
                        name="sendernumber"
                        placeholder="Enter Sender Account Number"
                        required>
                </div>

                <div class="mb-3">

                    <label class="form-label">Password</label>

                    <div class="position-relative">

                        <input
                            type="password"
                            class="form-control"
                            id="password"
                            name="password"
                            placeholder="Enter Password"
                            required>

                        <span
                            onclick="togglePwd()"
                            style="position:absolute;right:15px;top:50%;transform:translateY(-50%);cursor:pointer;">
                            👁
                        </span>

                    </div>

                </div>

                <div class="mb-3">
                    <label class="form-label">Receiver Account Number</label>

                    <input
                        type="number"
                        class="form-control"
                        name="receivernumber"
                        placeholder="Enter Receiver Account Number"
                        required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Transfer Amount</label>

                    <input
                        type="number"
                        class="form-control"
                        name="amount"
                        placeholder="Enter Amount"
                        required>
                </div>

                <div class="mb-4">
                    <label class="form-label">Confirmation</label>

                    <input
                        type="number"
                        class="form-control"
                        name="confirm"
                        placeholder="Enter 1 to Confirm"
                        min="1"
                        max="1"
                        required>
                </div>

                <button type="submit" class="btn btn-warning btn-submit">
                    🔄 Transfer Money
                </button>

            </form>

        </div>

    </div>

</div>

<script>

function togglePwd(){

    var x=document.getElementById("password");

    if(x.type==="password"){
        x.type="text";
    }
    else{
        x.type="password";
    }

}

</script>

</body>
</html>