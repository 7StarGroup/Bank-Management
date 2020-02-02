package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;

/**
 * Servlet implementation class AddBranch
 */
@WebServlet("/AddBranch")
public class AddBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=Connect.connectDb();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String ifscInitial=request.getParameter("ifscInitial");
		String ifscCode=request.getParameter("ifsc");
		String finalIfsc=ifscInitial.concat(ifscCode);
		
		try {
			String branchname=request.getParameter("branch");
			System.out.println("b"+branchname);
			ps=con.prepareStatement("insert into branch(branch_name,branch_address,branch_contact,ifsc_code) values(?,?,?,?)");
			ps.setString(1, request.getParameter("branch"));
			ps.setString(2, request.getParameter("address"));
			ps.setString(3, request.getParameter("contact"));
			ps.setString(4, finalIfsc);
			
			int i=ps.executeUpdate();
			if(i!=0)
			{
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('Branch created successfully.')");
				
				out.println("</script>");
				
				
			}
			else
			{
				System.out.println("error");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}
