<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees Salary</title>
<link rel="stylesheet" href="inserts.css">
<link rel="stylesheet" href="update.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<form action="salfetch.jsp" method="post" class="s" autocomplete="off">
<div>
<h1>S A L A R Y - D E T A I L S</h1>
</div>
      <input type="text" name="search" placeholder="Search for an Employee's Salary by ID">
      <button type="submit">SEARCH</button>
</form>
<form action="Salary" class="box" method="post" autocomplete="off">
<h1>SALARY CALCULATION</h1>
 <input type="text"  name="eid" placeholder="Enter Employee ID" required="required">
 <input type="text"  name="basic" placeholder="Enter Basic Salary Amount" required="required">

 <input type="text" name="tax" placeholder="Enter Tax Parcentage" required="required">
 
 <input type="submit" value="CALCULATE">
 </form>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<input type="hidden" id="detail" value="<%=request.getAttribute("detail")%>">
<script>
var status = document.getElementById("status").value;
if (status == "success")
	{
	swal("WELL DONE","SALARY ADDED SUCCESSFULLY","success");
	}
var status = document.getElementById("detail").value;
if (status == "notfound")
	{
	swal("Oops!!","DATA NOT AVAILABLE","error");
	}
</script>
</body>
</html>