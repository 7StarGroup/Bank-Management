package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;


@WebServlet("/NewRegistration")
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
       
   
    public NewRegistration() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String mob=request.getParameter("mob");
		String email=request.getParameter("email");
		String aadhar=request.getParameter("aadhar");
		String pan=request.getParameter("pan");
		String address=request.getParameter("address");
		String nationality=request.getParameter("nationality");
		
		
		
		
		
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
			
			
		
			
			

			
		PreparedStatement stmt = con.prepareStatement("select user_name from user where user_name=? and email=?");	
			
	
		/*	stmt.setString(1,username);
			stmt.setString(2,Email);
			*/
			
			
			ResultSet rs = stmt.executeQuery();
			
			
			
			
	
			
			
			
		
	}
		catch(Exception e) {}
		
	
	}
		
		
	}


