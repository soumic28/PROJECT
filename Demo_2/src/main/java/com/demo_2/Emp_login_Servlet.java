package com.demo_2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class Emp_login_Servlet
 */
@WebServlet("/login_emp")
public class Emp_login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		RequestDispatcher rd = null;
		
		String name = request.getParameter("emp_name");
		String passcode = request.getParameter("emp_password");
		
		try
		{
	        Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
			PreparedStatement ps = con.prepareStatement("select * from employee where ename=? and eid=?");
			
			ps.setString(1,name);
			ps.setString(2,passcode);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next())
			{
				rd = request.getRequestDispatcher("Emp_inf.jsp");
				request.setAttribute("design",name);
			}
			else
			{
				rd = request.getRequestDispatcher("Emp_login.jsp");
				request.setAttribute("status","failed");
			}
			rd.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
