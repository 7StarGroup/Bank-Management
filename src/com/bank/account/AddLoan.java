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

/**
 * Servlet implementation class AddLoan1
 */
@WebServlet("/AddLoan")
public class AddLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String noOfYears = request.getParameter("years");
		String loanType = request.getParameter("loanType");
		String rateOfInterest = request.getParameter("rateOfInterest");

		try {
			Connection con = Connect.connectDb();

			PreparedStatement ps = null;
			ps = con.prepareStatement("insert into loan(loan_type,rate_of_interest,no_of_years) values(?,?,?)");
			ps.setString(1, loanType);
			ps.setString(2, rateOfInterest);
			ps.setString(3, noOfYears);
			
			PrintWriter out=response.getWriter();
			int i=ps.executeUpdate();
			if(i!=0)
			{
				
				out.println("<script>");
				out.println("alert('Data added successfully.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
				
				
			}
			else
			{
				out.println("<script>");
				out.println("alert('Problem in adding data.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
