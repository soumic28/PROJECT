package com.demo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Servlet implementation class login_servlet
 * 
 * 
 */

@WebServlet("/NewFile")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name_str = request.getParameter("name_1");
		String password_str = request.getParameter("password_1");
		PrintWriter out = response.getWriter();
		//RequestDispatcher rd = null;
		Connection con = null;
		try {
			//Database Driver Loader//
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Driver Loaded to the con object// //payroll_sys is the schema name, root is database id, system is database password//
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","system");
PreparedStatement ps = con.prepareStatement("select * from new_demo where name= ? and password= ?");
			
			ps.setString(1, name_str);
			ps.setString(2, password_str);
            ResultSet rs =  ps.executeQuery();
			//This if block is checking the username and the password from the database//
			if(rs.next()) {
				
				out.println("Login Successfully");
			}
			else {
				out.println("Failed to Login! Please Try Again");
			}
		}
		catch(Exception e){
			e.printStackTrace();
	}
	}
}
