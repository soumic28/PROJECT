<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<link rel="stylesheet" href="menus.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body>

<header><h1>PAYROLL MANAGMENT PORTAL</h1></header>
    <nav class="a">
      <a href="Insert.jsp" target="_blank">REGISTRATION FORM</a>
      <a href="Update.jsp" target="_blank">UPDATE DATA</a>
      <a href="Delete.jsp" target="_blank">DELETE DATA</a>
      <a href="NewSal.jsp" target="_blank">ADD / EMPLOYEES SALARY</a>
      <form class="sr" action="fetch.jsp" autocomplete="off">
      <input type="text" name="search" placeholder="Search for an Employee by ID">
      <button type="submit">SEARCH</button>
      </form>
    </nav>
<input type="hidden" id="detail" value="<%=request.getAttribute("detail")%>">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("detail").value;
if (status == "notfound")
	{
	swal("Oops!!","DATA NOT AVAILABLE","error");
	}
</script>

<!--  <footer>
    <p><strong>MADE BY</strong></p>
    <pre><b>SOUGATA SINGHA || TRINATH DEY || SOUMIC SARKAR || TRITHANKAR GHOSH || SAYON KUNDU</b></pre>
 </footer>-->
</body>
</html>