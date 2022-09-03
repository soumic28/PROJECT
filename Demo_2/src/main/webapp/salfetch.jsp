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
   
	    <title>Employees Salary Database</title>
	    <link rel="stylesheet" href="update.css">
	    <style>
	    h1{
	    margin-top:3%;
	    color:white;
	    text-shadow:5px 5px 10px black;
	    }
	    .table{
	    border-top:2px solid white;
	    margin-top:5%;
	    color:white;
	    }
	    th,td{
	    border-right:2px solid white;
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
    <h1 align=center>S A L A R Y - D A T A B A S E</h1> 
  <table class="table">
  
  <thead>
    <tr>
      <th scope="col">EMPLOYEE ID</th>
      <th scope="col">BASIC</th>
      <th scope="col">DEARNESS ALLOWANCE</th>
      <th scope="col">HOUSE RENT ALLOWANCE</th>
      <th scope="col">PROVIDEND FUND</th>
      <th scope="col">TAX PERCENTAGE</th>
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
	PreparedStatement pst = con.prepareStatement("select * from salary where eid=?");
	pst.setString(1,name);
	ResultSet rst = pst.executeQuery();
	if(rst.next())
	{
		%>
		<tr>
		  <td scope="col"><%=rst.getString("eid")%></td>
		  <td scope="col"><%=rst.getDouble("basic")%></td>
		  <td scope="col"><%=rst.getDouble("da")%></td>
		  <td scope="col"><%=rst.getDouble("hra")%></td>
		  <td scope="col"><%=rst.getDouble("pf")%></td>
	      <td scope="col"><%=rst.getDouble("tax")%></td>
	      <td scope="col"><%=rst.getDouble("net")%></td>
		</tr>
	<%}
	else{
		request.setAttribute("detail","notfound");
		rd = request.getRequestDispatcher("NewSal.jsp");
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