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
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con=null;
	PreparedStatement stmt;
	ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession(false);  
	    int current_user_id=(int)session.getAttribute("user_id");// getting current user name to edit their info
		String name=request.getParameter("adminname");
		String email=request.getParameter("adminemail");
		String address=request.getParameter("adminaddress");
		String contact=request.getParameter("admincontact");
		
	
		
		//update query for editing user info is remaining
		try
		{
			con=Connect.connectDb();
			if(con==null)
			{
				System.out.println("Not connected");
			}
			else
			{
				System.out.println("Connected");
			}
			
			stmt=con.prepareStatement("update user set user_name=?,email=?,address=?,contact=? where user_id=?");
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, address);
			stmt.setString(4, contact);
			stmt.setInt(5, current_user_id);
			
			int i=stmt.executeUpdate();
			
			if(i==0)
			{
				out.println("<script>");
				out.println("alert('Problem in Updation!')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}
			else
			{
				out.println("<script>");
				out.println("alert('Profile Updated Successfully!')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
	}

}
