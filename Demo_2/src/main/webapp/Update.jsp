<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Updation</title>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="update.css">
	    <style>
	    h1{
	    color:white;
	    text-shadow:5px 5px 10px black;
	    }
	    </style>
</head>
<body>
<form action="NewUpdate.jsp" method="post" class="s" autocomplete="off">
<div>
<h1>U P D A T I O N</h1>
</div>
      <input type="text" name="search" placeholder="Search for an Employee by ID">
      <button type="submit">SEARCH</button>
</form>
<input type="hidden" id="status" value="<%=request.getAttribute("del")%>">
<input type="hidden" id="up" value="<%=request.getAttribute("up")%>">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var status = document.getElementById("status").value;
if (status == "notfound")
	{
	swal("Sorry","DATA NOT FOUND","error");
	}
var up = document.getElementById("up").value;
if(up == "successful")
	{
	swal("Good Job","DATA UPDATED SUCCESSFULLY","success");
	}
</script>
</body>
</html>