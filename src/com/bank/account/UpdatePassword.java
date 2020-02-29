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


@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
        super();
    }
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		String Npassword=request.getParameter("Newpassword");
		String Cpassword=request.getParameter("Confirmpassword");
		String Username=request.getParameter("username");
		
		if(!(Npassword.equals(Cpassword)))
				{
					
					out.println("<script>");
					out.println("alert('Password does not match');window.location = 'NewPassword.jsp';");
					out.println("</script>");
				}
		
				int a=UpdatePassword(Npassword,Username);
				
				if(a>0)
				{
					out.println("<script>");
					out.println("alert('Password Updated');window.location = 'Login.jsp'");
					out.println("</script>");
				}
				
				else
				{
					out.println("<script>");
					out.println("alert('Error');window.location = 'Login.jsp';");
					out.println("</script>");
					
				}
	}


	private int UpdatePassword(String Npassword,String Username)
	{
		int b=0;
		try {
			con = Connect.connectDb();
			if(con==null)
			{
				System.out.println("Not Connected in Login .Java");
			}
			else
			{
				System.out.println("Connected");
		
			}
			
			
		
			
			

			
		PreparedStatement stmt = con.prepareStatement("update user set password=? where user_name=?");	
			
	
			stmt.setString(1,Npassword);
			stmt.setString(2,Username);
			
			 b=stmt.executeUpdate();
			
			
			
			
			
	
			
			
			
			
		
	}
		catch(Exception e) {}
		
		return b;
		
		
	}
		
		
	

}
