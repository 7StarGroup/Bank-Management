package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
<<<<<<< HEAD
=======

import com.bank.db.Connect;


>>>>>>> b8d79ebd45b8b95c1def694827bdc68a30c3d705

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
       
    }

<<<<<<< HEAD
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		
=======
	Connection con;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		try {
			con = Connect.connectDb();
			if(con==null)
			{
				System.out.println("Not Connected in Login .Java");
			}
			else
			{
				System.out.println("Connected");
>>>>>>> b8d79ebd45b8b95c1def694827bdc68a30c3d705
		
			}
			
			String name=request.getParameter("username");
			String password=request.getParameter("password");
		
			
<<<<<<< HEAD
			System.out.println("Screen called");
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","Akshay@1997");
			if(con==null)
=======
			

			
		PreparedStatement stmt = con.prepareStatement("select user_name,password from user where user_name=? and password=?");	
			
	
			stmt.setString(1,name);
			stmt.setString(2,password);
			
			
			
			ResultSet rs = stmt.executeQuery();
			
			
			
			
	
			
			
			if(rs.next())
>>>>>>> b8d79ebd45b8b95c1def694827bdc68a30c3d705
			{
					/*out.println("<script>");
					out.println("alert('Success')");
					out.println("</script>");*/
					
					request.getRequestDispatcher("HomeScreen.jsp").forward(request, response); 
			}
			else
			{
				out.println("<script>");
				out.println("alert('Oops login failed please try again with correct credentials')");
				out.println("window.location.replace('login.jsp')");
				out.println("</script>");
				
			}
			
					
		}catch(Exception e)
		{
			System.out.println("Error"+e);
		}
		
<<<<<<< HEAD

		
		try
		{
		PreparedStatement ps;
		ps=con.prepareStatement("select * from user where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			 HttpSession session=request.getSession();  
		        session.setAttribute("uname",email);  
			
				pw.println("<script type='text/javascript'>");
				pw.println("location='HomeScreen.jsp';");
				pw.print("</script>");
				
				
		}
		}
		catch(Exception e)
	{
		System.out.println(e);
=======
>>>>>>> b8d79ebd45b8b95c1def694827bdc68a30c3d705
	}
}


