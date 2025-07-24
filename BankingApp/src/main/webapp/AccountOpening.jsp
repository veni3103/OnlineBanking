<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="accountopening" method="post">
<label for="name" >Name</label>
<input type="text" name="name" id="name" placeholder="enter your name" required>
<br>
<label for="DOB" >DOB</label>
<input type="date" name="DOB" id="DOB" placeholder="enter your DOB " required>
<br>
<label for="Aadhar" >AadharNumber</label>
<input type="number" name="Aadhar" id="Aadhar" placeholder="enter your Aadhar number" minlength="8" maxlength="8" required>
<br>
<label for="email" >Email id</label>
<input type="email" name="email" id="email" placeholder="enter your email id" required>
<br>
<label for="phonenumber" >PhoneNumber</label>
<input type="number" name="phonenumber" id="phonenumber" placeholder="enter your phone number" minlength="10" maxlength="10" required>
<br>
<label for="Doornumber" >DoorNumber</label>
<input type="text" name="Doornumber" id="Doornumber" placeholder="enter your door number" required>
<br>
<label for="street" >street name</label>
<input type="text" name="street" id="street" placeholder="enter your streetname" required>
<br>
<label for="village" >village name</label>
<input type="text" name="village" id="village" placeholder="enter your villagename" required>
<br>
<label for="taluk" >Taluk</label>
<input type="text" name="taluk" id="taluk" placeholder="enter your taluk" required>
<br>
<label for="pincode" >PinCode</label>
<input type="number" name="pincode" id="pincode" placeholder="enter your pincode" minlength="6" maxlength="6" required>
<br>
<label for="dist">district</label>
<input  type="text" id="dist" name="dist" placeholder="enter your district here">
<br>
<label for="state">State</label>
<input  type="text" id="state" name="state" placeholder="enter your state here">
<br>
<label for="password">Password</label>
<input  type="password" id="password" name="password" placeholder="enter password you want">
<br>
<label>Gender:</label>
<br>
<input  type="radio" name="gender" id="female" value="female">
<label  for="female">Female</label>
<br>
<input  type="radio" name="gender"  id="male" value="male">
<label  for="male">Male</label>
<br>

<input  type="radio" name="gender" id="other" value="other">
<label for="other">other</label>
<br>
<button  type="submit">Submit form</button>
</form>

</body>
</html>