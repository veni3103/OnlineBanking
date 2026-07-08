<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Opening</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:linear-gradient(135deg,#0d6efd,#4facfe);
    font-family:Arial,Helvetica,sans-serif;
}

.bank-card{
    max-width:900px;
    margin:40px auto;
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

.form-control{
    border-radius:10px;
}

.btn-submit{
    width:100%;
    padding:12px;
    border-radius:30px;
    font-size:18px;
    font-weight:bold;
}

.card-body{
    padding:35px;
}

.position-relative span{
    font-size:20px;
}
</style>

</head>
<body>

<div class="bank-header">
    <h2>🏦 Online Banking</h2>
    <p>Open your savings account securely</p>
</div>

<div class="container py-5">

    <div class="card bank-card">

        <div class="card-body">

            <h3 class="text-center mb-4">Account Opening</h3>

            <form action="accountopening" method="post">

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Name</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Date of Birth</label>
                    <div class="col-sm-9">
                        <input type="date" class="form-control" name="DOB" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Aadhar Number</label>
                    <div class="col-sm-9">
                        <input type="text"
                               class="form-control"
                               name="Aadhar"
                               maxlength="12"
                               pattern="[0-9]{12}"
                               placeholder="Enter Aadhar Number"
                               required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email"
                               class="form-control"
                               name="email"
                               placeholder="Enter Email"
                               required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Phone Number</label>
                    <div class="col-sm-9">
                        <input type="text"
                               class="form-control"
                               name="phonenumber"
                               maxlength="10"
                               pattern="[0-9]{10}"
                               placeholder="Enter Phone Number"
                               required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Door Number</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="Doornumber" placeholder="Door Number" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Street</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="street" placeholder="Street Name" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Village</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="village" placeholder="Village" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Taluk</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="taluk" placeholder="Taluk" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Pincode</label>
                    <div class="col-sm-9">
                        <input type="text"
                               class="form-control"
                               name="pincode"
                               maxlength="6"
                               pattern="[0-9]{6}"
                               placeholder="Pincode"
                               required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">District</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="dist" placeholder="District" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">State</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="state" placeholder="State" required>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label">Password</label>

                    <div class="col-sm-9 position-relative">

                        <input type="password"
                               class="form-control"
                               id="password"
                               name="password"
                               placeholder="Enter Password"
                               required>

                        <span onclick="togglePwd()"
                              style="position:absolute;right:20px;top:50%;transform:translateY(-50%);cursor:pointer;">
                            👁
                        </span>

                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Gender</label>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Female" required>
                        <label class="form-check-label">Female</label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Male">
                        <label class="form-check-label">Male</label>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Other">
                        <label class="form-check-label">Other</label>
                    </div>

                </div>

                <button type="submit" class="btn btn-primary btn-submit">
                    Create Account
                </button>

            </form>

        </div>

    </div>

</div>

<script>
function togglePwd() {
    var x = document.getElementById("password");

    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
</script>

</body>
</html>