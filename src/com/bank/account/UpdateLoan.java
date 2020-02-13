package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;

@WebServlet("/UpdateLoan")
public class UpdateLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
		Connection con=Connect.connectDb();
		PreparedStatement ps=null;
		ps=con.prepareStatement("update loan set loan_type=?,rate_of_interest=?,no_of_years=? where loan_id=? ");
		ps.setInt(4, Integer.parseInt(request.getParameter("loanId")));
		ps.setString(1, request.getParameter("loanType"));
		ps.setString(2, request.getParameter("interest"));
		ps.setString(3,request.getParameter("years"));
		int i = ps.executeUpdate();
		if (i != 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Data updated successfully.')");
			out.println("window.parent.location.reload();");
			out.println("</script>");

		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
