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
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;

/**
 * Servlet implementation class PassbookRequest
 */
@WebServlet("/PassbookRequest")
public class PassbookRequest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con=Connect.connectDb();
		PreparedStatement ps,ps1=null;
		try
		
		{
			HttpSession session=request.getSession();
			Integer user_id = (Integer) session.getAttribute("user_id");
		ps=con.prepareStatement("update user set passbook=? where user_id=?");
		ps.setBoolean(1, Boolean.TRUE);
		ps.setLong(2, user_id);
		int i=ps.executeUpdate();
		
		if(i!=0)
		{
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('Passbook request accepted.')");
			out.println("window.location.href='HomeScreen.jsp'");
			out.println("</script>");
			
		}
		
		}catch(Exception e)
		{
			
		}
		
	}

}
