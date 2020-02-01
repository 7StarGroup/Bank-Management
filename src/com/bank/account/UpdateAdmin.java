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
 * Servlet implementation class UpdateAdmin
 */
@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con=Connect.connectDb();
		PreparedStatement ps=null;
		try
		{
		ps=con.prepareStatement("update user set user_name=?,email=?,address=?,contact=? where user_id=?");
		ps.setString(1, request.getParameter("username"));
		ps.setString(2, request.getParameter("email"));
		ps.setString(3, request.getParameter("address"));
		ps.setString(4, request.getParameter("contact"));
		ps.setLong(5, Long.parseLong(request.getParameter("userId")));
		int i=ps.executeUpdate();
		if(i!=0)
		{
			PrintWriter pw=response.getWriter();
			pw.println("<script>");
			pw.println("alert('Admin Updated succesfully')");
			pw.println("window.location.href='AdminHome.jsp'");
			pw.println("</script>");
		}
		}catch(Exception e)
		{
			
		}
		
	}

}
