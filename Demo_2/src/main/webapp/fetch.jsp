<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   
	    <title>Employee Database</title>
	    <link rel="stylesheet" href="update.css">
	    <style>
		    h1{
		display:inline-block;
	    margin-top:3%;
	    margin-left:30%;
	    color:white;
	    text-shadow:5px 5px 10px black;
	    border-bottom:3px solid white;
	    }
	    .table{
	    border-top:2px solid white;
	    margin-top:5%;
	    color:white;
	    }
	    th,td{
	    border-right:2px solid white;
	    border-left:2px solid white;
	    }
	    </style>
  </head>
  <body>
 
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->  
    <h1 align=center>E M P L O Y E E S - D A T A B A S E</h1> 
  <table class="table">
  
  <thead>
    <tr>
      <th scope="col">EMPLOYEE ID</th>
      <th scope="col">NAME</th>
      <th scope="col">DESIGNATION</th>
      <th scope="col">ADDRESS</th>
      <th scope="col">DEPARTMENT</th>
      <th scope="col">EMAIL</th>
      <th scope="col">PHONE NO</th>
      <th scope="col">ADHAR NO</th>
      <th scope="col">GENDER</th>
      <th scope="col">TAX</th>
      <th scope="col">NET SALARY</th>
    </tr>
  </thead>
<tbody>
<% String name =  request.getParameter("search");
RequestDispatcher rd = null;
Connection con = null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
	PreparedStatement ps = con.prepareStatement("select * from employee where eid=?");
	PreparedStatement pst = con.prepareStatement("select tax,net from salary where eid=?");
	ps.setString(1,name);
	pst.setString(1,name);
	ResultSet rs = ps.executeQuery();
	ResultSet rst = pst.executeQuery();
	if(rs.next() && rst.next())
	{
		%>
		<tr>
		  <td scope="col"><%=rs.getString("eid")%></td>
	      <td scope="col"><%=rs.getString("ename")%></td>
	      <td scope="col"><%=rs.getString("designation")%></td>
	      <td scope="col"><%=rs.getString("address")%></td>
	      <td scope="col"><%=rs.getString("department")%></td>
	      <td scope="col"><%=rs.getString("email")%></td>
	      <td scope="col"><%=rs.getString("phone")%></td>
	      <td scope="col"><%=rs.getString("adhar")%></td>
	      <td scope="col"><%=rs.getString("gender")%></td>
	      <td scope="col"><%=rst.getDouble("tax")%></td>
	      <td scope="col"><%=rst.getDouble("net")%></td>
		</tr>
	<%}
	else{
		request.setAttribute("detail","notfound");
		rd = request.getRequestDispatcher("Menu.jsp");
	}
	rd.forward(request,response);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</tbody>
</table>
  </body>
</html>