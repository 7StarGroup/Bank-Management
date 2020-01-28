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

import com.bank.db.Connect;

/**
 * Servlet implementation class AddBranch
 */
@WebServlet("/AddBranch")
public class UpdateBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=Connect.connectDb();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Long branchId=Long.parseLong(request.getParameter("branchId"));
		try {
			String branchname=request.getParameter("branchname");
			System.out.println("b"+branchname);
			ps=con.prepareStatement("update branch set branch_name,=?,branch_address=?,branch_contact=?,ifsc_code=? where branch_id=? ");
			ps.setLong(1, branchId);
			ps.setString(2, request.getParameter("branchaddress"));
			ps.setString(3, request.getParameter("branchcontact"));
			ps.setString(4, request.getParameter("branchIfsc"));
			
			int i=ps.executeUpdate();
			if(i!=0)
			{
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('Branch Updated successfully.')");
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
