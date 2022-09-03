<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet" href="inserts.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<!-- Registration Popup -->

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">

<form class="box" action="Insert" method="post" autocomplete="off">
<h1>R E G I S T R A T I O N</h1>
<input type="text" name="eid" placeholder="Enter Your ID" required="required">
<input type="text" name="ename" placeholder="Enter Your name" required="required">

<label class="design" for="desig">Designation</label>

  <select class="custom" name="designation" id="desig">
    <option value="SDE">SDE</option>
    <option value="Manager">Manager</option>
    <option value="Intern">Intern</option>
    <option value="CEO">CEO</option>
  </select>

<input type="text" name="address" placeholder="Enter Your Address" required="required">

<label class="design" for="dept">Depertment</label>

  <select class="custom" name="department" id="dept">
    <option value="IT">IT</option>
    <option value="Managing">Managing</option>
    <option value="Internship">Internship</option>
    <option value="Executive">Executive</option>
  </select>
  
<input type="text" name="email" placeholder="Enter Your Email Address" required="required">
<input type="text" name="phone" placeholder="Enter Your Phone No" required="required">
<input type="text" name="adhar" placeholder="Enter Your Adhar No" required="required">

<label class="design" for="gen">Gender</label>
  <select class="custom" name="gender" id="gen">
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Others">Others</option>
  </select>
  
<input type="submit" Value="SAVE">
</form>
<!-- Javascript for popup --> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("status").value;
if (status == "success")
	{
	swal("Successfully Registered","Well Done","success");
	}
if (status == "failed")
	{
	swal("Sorry","Not Registered","error");
	}
</script>
</body>
</html>