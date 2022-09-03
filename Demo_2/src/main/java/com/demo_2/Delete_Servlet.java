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
 * Servlet implementation class Delete_Servlet
 */
@WebServlet("/Delete")
public class Delete_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String empId = request.getParameter("empId");
		Connection con = null;
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
			
			PreparedStatement ps = con.prepareStatement("delete from employee where eid=?");
			ps.setString(1, empId);
			PreparedStatement pst = con.prepareStatement("delete from salary where eid=?");
			pst.setString(1, empId);
			int rowCount = ps.executeUpdate();
			int row = pst.executeUpdate();
			RequestDispatcher rd = null;
			if(rowCount > 0 && row > 0) {
				request.setAttribute("delete", "deleted");
				rd = request.getRequestDispatcher("Delete.jsp");
			}
			else {
				request.setAttribute("delete", "notdeleted");
				rd = request.getRequestDispatcher("Delete.jsp");
			}
			rd.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}

}
