package com.demo_2;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Salary_Servlet
 */
@WebServlet("/Salary")
public class Salary_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		    String id = request.getParameter("eid");
			double base = Double.parseDouble(request.getParameter("basic"));
			double tax = Double.parseDouble(request.getParameter("tax"));
			double da = base * 0.50;
			double ha = base * 0.30;
			double pf = base * 0.10;
			double gross = base+da+ha-pf;
			double net = gross - (gross*tax)/100;
		
			request.setAttribute("id", id);
			request.setAttribute("basic",base);
			request.setAttribute("da",da);
			request.setAttribute("hra",ha);
			request.setAttribute("pf",pf);
			request.setAttribute("gross",gross);
			request.setAttribute("net",net);
			request.setAttribute("base",base);
			request.setAttribute("tax",tax);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("Salary.jsp");
			rd.forward(request,response);
	}

}
