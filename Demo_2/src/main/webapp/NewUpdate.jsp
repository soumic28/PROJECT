<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE FORM</title>
<link rel="stylesheet" href="inserts.css">
</head>
<body>
<% String name =  request.getParameter("search");
RequestDispatcher rd = null;
Connection con = null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
	PreparedStatement ps = con.prepareStatement("select * from employee where eid=?");
	PreparedStatement pst = con.prepareStatement("select * from salary where eid=?");
	ps.setString(1,name);
	pst.setString(1,name);
	ResultSet rs = ps.executeQuery();
	ResultSet rst = pst.executeQuery();
	if(rs.next() && rst.next())
	{
		%>
 <form class="update" action="Update" method="post" autocomplete="off">
<h1>DATA UPDATETION FORM</h1>
<h5>EMPLOYEE ID<input type="text" value="<%=rs.getString("eid")%>" name="eid" placeholder="Enter Your ID" required="required">
EMPLOYEE NAME<input type="text" value="<%=rs.getString("ename")%>" name="ename" placeholder="Enter Your name" required="required">

<label class="design" for="desig">Designation</label>

  <select class="custom" name="designation" id="desig">
  <option value="<%=rs.getString("designation")%>"><%=rs.getString("designation")%></option>
    <option value="SDE">SDE</option>
    <option value="Manager">Manager</option>
    <option value="Intern">Intern</option>
    <option value="CEO">CEO</option>
  </select>
<br><br>
ADDRESS<input type="text" value="<%=rs.getString("address")%>" name="address" placeholder="Enter Your Address" required="required">

<label class="design" for="dept">Depertment</label>

  <select class="custom" name="department" id="dept">
 <option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option>
    <option value="IT">IT</option>
    <option value="Managing">Managing</option>
    <option value="Internship">Internship</option>
    <option value="Executive">Executive</option>
  </select>
<br><br>  
EMAIL ID<input type="text" value="<%=rs.getString("email")%>" name="email" placeholder="Enter Your Email Address" required="required">
PHONE NO<input type="text" value="<%=rs.getString("phone")%>" name="phone" placeholder="Enter Your Phone No" required="required">
ADHAR NO<input type="text" value="<%=rs.getString("adhar")%>" name="adhar" placeholder="Enter Your Adhar No" required="required">

<label class="design" for="gen">Gender</label>
  <select class="custom" name="gender" id="gen">
  <option value="<%=rs.getString("gender")%>"><%=rs.getString("gender")%></option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Others">Others</option>
  </select>
<br><br>BASIC SALARY<input type="text" value="<%=rst.getDouble("basic")%>" name="basic" placeholder="Basic Salary" required="required">

TAX PARCENTAGE</h5><input type="text" value="<%=rst.getDouble("tax")%>" name="tax" placeholder="Tax Percentage" required="required">

<input type="submit" Value="UPDATE">
</form>	
		
	<%}
	else{
		request.setAttribute("del","notfound");
		rd = request.getRequestDispatcher("Update.jsp");
	}
	rd.forward(request,response);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>