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


@WebServlet("/CloseAccountAction")
public class CloseAccountAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	PreparedStatement ps = null;
	Connection con = null;
   

	
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
			out.println("alert('Account deleted Successfully');");
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
			out.println("alert('Request deleted Successfully');");
			out.println("window.parent.location.reload();");
			out.println("</script>");
			}
		}
		
		
		
		
		
		
		
	}



	private boolean Rejectrequest(String name, String acno) {
		  int i=0;
		try {
			con=Connect.connectDb();
		PreparedStatement stmt=con.prepareStatement("update user_account set is_deleted=0 where account_id_fk=?");
		stmt.setString(1, acno);
		i=stmt.executeUpdate();
		}
		catch(Exception e) {System.out.println("Error in delete account rejection"+e);}
		if(i==1)
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
		ps = con.prepareStatement("delete from user_account where account_id_fk=?");
		
		ps.setString(1, acno);
		int delusrac=ps.executeUpdate();
		
		PreparedStatement ps1 = con.prepareStatement("delete from account where account_id=?");
		
		ps1.setString(1, acno);
		int ac=ps1.executeUpdate();
		
		PreparedStatement ps2 = con.prepareStatement("delete from user where user_name=?");
		
		ps2.setString(1, name);
		int usr=ps2.executeUpdate();
		
		if(delusrac==1&&ac==1&&usr==1)
		{
			return true;
			
		}
		
		
		
		
		
		}
		catch(Exception e) {System.out.println("Error in delete account acception"+e);}
		return false;
	}


	

}
