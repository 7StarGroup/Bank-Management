package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;

@WebServlet("/RateOfInterest")
public class RateOfInterest extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String type=request.getParameter("type");
		String year=request.getParameter("years");
		
		
		System.out.println("Type"+type+" Year"+year);
		PreparedStatement ps=null;
		ResultSet rs;
		PrintWriter pw=response.getWriter();
		
		try {
			Connection con = Connect.connectDb();
			ps=con.prepareStatement(
					"select rate_of_interest from Loan where loan_type=? and no_of_years=?");
			ps.setString(1,type);
			ps.setString(2,year);
			rs=ps.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				
				session.setAttribute("rateOfInterest",rs.getString(1));
				
				pw.println("<script type='text/javascript'>");
				pw.println("location='LoanRequest.jsp';");
				pw.print("</script>");
			}
			else
			{
				pw.println("<script type='text/javascript'>");
				pw.println("alert('Problem')");
				pw.println("window.parent.location.reload();");
				pw.print("</script>");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
