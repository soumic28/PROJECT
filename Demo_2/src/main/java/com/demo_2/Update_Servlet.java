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
 * Servlet implementation class Update_Servlet
 */
@WebServlet("/Update")
public class Update_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		RequestDispatcher rd = null;
		String id = request.getParameter("eid");
		String name = request.getParameter("ename");
		String desig = request.getParameter("designation");
		String add = request.getParameter("address");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String adhar = request.getParameter("adhar");
		String gender = request.getParameter("gender");
		double base = Double.parseDouble(request.getParameter("basic"));
		double tax = Double.parseDouble(request.getParameter("tax"));
		double da = base * 0.50;
		double hra = base * 0.30;
		double pf = base * 0.10;
		double gross = base+da+hra-pf;
		double net = gross - (gross*tax)/100;
		
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
			
			PreparedStatement ps = con.prepareStatement("update employee set ename=?, designation=?, address=?,department=?,email=?,phone=?,adhar=?,gender=? where eid=?");
			PreparedStatement pst = con.prepareStatement("update salary set basic=?,da=?,hra=?,pf=?,tax=?,net=? where eid=?");
			ps.setString(1, name);
			ps.setString(2, desig);
			ps.setString(3, add);
			ps.setString(4, dept);
			ps.setString(5, email);
			ps.setString(6, phone);
			ps.setString(7, adhar);
			ps.setString(8, gender);
			ps.setString(9,id);
			
			pst.setDouble(1,base);
			pst.setDouble(2, da);
			pst.setDouble(3,hra);
			pst.setDouble(4, pf);
			pst.setDouble(5,tax);
			pst.setDouble(6,net);
			pst.setString(7,id);
			int rowCount = ps.executeUpdate();
			int row = pst.executeUpdate();
			
			if(rowCount > 0) {
				request.setAttribute("up","successful");
				rd = request.getRequestDispatcher("Update.jsp");
			}
			else {
				request.setAttribute("del", "notfound");
				rd = request.getRequestDispatcher("Update.jsp");
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
