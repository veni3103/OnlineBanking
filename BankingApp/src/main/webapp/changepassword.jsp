i<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

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
    color:white;
    text-decoration:none;
    font-weight:bold;
}

.position-relative span{
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    font-size:20px;
}

</style>

</head>

<body>

<div class="container">

    <div class="card bank-card">

        <div class="bank-header">
            <h2>🏦 Online Banking</h2>
            <p>Change Your Password</p>

            <a href="home.jsp" class="home-link">
                ⬅ Back to Home
            </a>

        </div>

        <div class="card-body">

            <form action="ChangePassword" method="post">

                <div class="mb-3">
                    <label class="form-label">Account Number</label>
                    <input
                        type="number"
                        class="form-control"
                        name="accountnumber"
                        placeholder="Enter Account Number"
                        required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Current Password</label>

                    <div class="position-relative">

                        <input
                            type="password"
                            class="form-control"
                            id="currentpassword"
                            name="currentpassword"
                            placeholder="Enter Current Password"
                            required>

                        <span onclick="togglePassword('currentpassword')">
                            👁
                        </span>

                    </div>

                </div>

                <div class="mb-3">
                    <label class="form-label">New Password</label>

                    <div class="position-relative">

                        <input
                            type="password"
                            class="form-control"
                            id="newpassword"
                            name="newpassword"
                            placeholder="Enter New Password"
                            required>

                        <span onclick="togglePassword('newpassword')">
                            👁
                        </span>

                    </div>

                </div>

                <div class="mb-4">
                    <label class="form-label">Confirm New Password</label>

                    <div class="position-relative">

                        <input
                            type="password"
                            class="form-control"
                            id="confirmpassword"
                            name="confirmpassword"
                            placeholder="Confirm New Password"
                            required>

                        <span onclick="togglePassword('confirmpassword')">
                            👁
                        </span>

                    </div>

                </div>

                <button type="submit" class="btn btn-primary btn-submit">
                    🔒 Change Password
                </button>

            </form>

        </div>

    </div>

</div>

<script>

function togglePassword(id){

    var input = document.getElementById(id);

    if(input.type === "password"){
        input.type = "text";
    }else{
        input.type = "password";
    }

}

</script>

</body>
</html>