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
 * Servlet implementation class Save_Salary_Servlet
 */
@WebServlet("/salary_save")
public class Save_Salary_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		RequestDispatcher rd = null;
		String id = request.getParameter("eid");
		double base = Double.parseDouble(request.getParameter("basic"));
		double da = Double.parseDouble(request.getParameter("da"));
		double hra = Double.parseDouble(request.getParameter("hra"));
		double pf = Double.parseDouble(request.getParameter("pf"));
		double tax = Double.parseDouble(request.getParameter("tax"));
		double net = Double.parseDouble(request.getParameter("net"));
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
			
			PreparedStatement ps = con.prepareStatement("insert into salary value(?,?,?,?,?,?,?)");
			ps.setString(1, id);
			ps.setDouble(2, base);
			ps.setDouble(3, da);
			ps.setDouble(4, hra);
			ps.setDouble(5, pf);
			ps.setDouble(6, tax);
			ps.setDouble(7, net);
			
            int rowCount = ps.executeUpdate();
            rd = request.getRequestDispatcher("NewSal.jsp");
            if (rowCount > 0)
            {
            	request.setAttribute("status","success");
            }
			rd .forward(request, response);
	}
		catch(Exception e)
		{
			e.printStackTrace();		
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}
