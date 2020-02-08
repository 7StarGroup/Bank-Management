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
 * Servlet implementation class PassbookAction
 */
@WebServlet("/PassbookAction")
public class PassbookAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con=null;
	PreparedStatement ps=null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String acno=request.getParameter("acno");
		int action=Integer.parseInt(request.getParameter("action"));
		
		if(action==1)
		{
			boolean result=Acceptrequest(name,acno);
			
			if(result==true)
			{
			out.println("<script>");
			out.println("alert('Pass Book Request Accepted Successfully');");
			out.println("window.parent.location.reload();");
			out.println("</script>");
			}
			
		}
		else
		{
			boolean result=Rejectrequest(name,acno);
			if(result==true)
			{
			out.println("<script>");
			out.println("alert('Pass Book Request deleted Successfully');");
			out.println("window.parent.location.reload();");
			out.println("</script>");
			}
		}
		
		
		
		
		
		
		
	}



	private boolean Rejectrequest(String name, String acno) {
		  int i=0;
		try {
			con=Connect.connectDb();
		PreparedStatement stmt=con.prepareStatement("update user set passbook='' where user_name=?");
		stmt.setString(1, name);
		i=stmt.executeUpdate();
		}
		catch(Exception e) {System.out.println("Error in passbook rejection"+e);}
		if(i!=1)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}



	private boolean Acceptrequest(String name, String acno) {
		try { 
			 con=Connect.connectDb();
		ps = con.prepareStatement("update user set passbook=0 where user_name=?");
		
		ps.setString(1, name);
		int updusr=ps.executeUpdate();
		
		
		if(updusr!=0)
		{
			return true;
			
		}
		
		
		
		
		
		}
		catch(Exception e) {System.out.println("Error in passbook account acception"+e);}
		return false;
	}
		
		
		
	}


