package com.demo_2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Insert")
public class Insert_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("eid");
		String name = request.getParameter("ename");
		String desig = request.getParameter("designation");
		String add = request.getParameter("address");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String adhar = request.getParameter("adhar");
		String gender = request.getParameter("gender");
		//PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll_sys","root","system");
			
			PreparedStatement ps = con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, desig);
			ps.setString(4, add);
			ps.setString(5, dept);
			ps.setString(6, email);
			ps.setString(7, phone);
			ps.setString(8, adhar);
			ps.setString(9, gender);
            //ResultSet rs =  ps.executeQuery();
            int rowCount = ps.executeUpdate();
            rd = request.getRequestDispatcher("NewSal.jsp");
            if (rowCount > 0)
            {
            	//out.println("Registration Successfully");
            	request.setAttribute("status","success");
            }
            else
            {
            	request.setAttribute("status","failed");
            	//out.println("Falid to Register");
            }
			rd .forward(request, response);
		}
		catch(SQLException e){
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


