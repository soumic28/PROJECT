<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees Salary</title>
<link rel="stylesheet" href="inserts.css">
</head>
<body>
<form action="salary_save" class="box" method="post" autocomplete="off">
<h1>S A L A R Y</h1>
 <h5>EMPLOYEE ID<input type="text" value="<%=request.getAttribute("id") %>" name="eid" placeholder="Enter Employee ID" required="required">
 BASIC<input type="text" value="<%=request.getAttribute("basic") %>" name="basic" placeholder="Enter Basic Salary Amount" required="required">
 DEARNESS ALLOWANCE<input type="text" value="<%=request.getAttribute("da") %>" name="da" placeholder="Enter Dearness Allowance Amount">
 HOUSE RENT ALLOWANCE<input type="text" value="<%=request.getAttribute("hra") %>" name="hra" placeholder="Enter House Rent Allowance Amount">
 PROVIDEND FUND<input type="text" value="<%=request.getAttribute("pf") %>" name="pf" placeholder="Enter Provident Fund Amount">
 TAX PARCENTAGE<input type="text" value="<%=request.getAttribute("tax") %>" name="tax" placeholder="Enter Tax Parcentage" required="required">
 NET SALARY</h5><input type="text" value="<%=request.getAttribute("net") %>" name="net" placeholder="Enter Net Salary Amount">
 <input type="submit" value="SAVE">
 </form>
</body>
</html>