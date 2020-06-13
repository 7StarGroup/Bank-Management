package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement stmt;
	ResultSet rs = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("html");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);
		int current_user_id = (int) session.getAttribute("user_id");
		
		System.out.println("User id"+current_user_id);
		String name = request.getParameter("name");
		System.out.println("Username"+name);
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		// update query for editing user info is remaining
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
			if (con == null) {
				System.out.println("Not Connected");
			} else {
				System.out.println("Connected");
			}

			stmt = con.prepareStatement(
					"update user set user_name=?,email=?,address=?,contact=? where user_id=?");
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, address);
			stmt.setString(4, contact);
			stmt.setInt(5, current_user_id);

			int i = stmt.executeUpdate();

			if (i == 0) {
				out.println("<script>");
				out.println("alert('Problem in Updation!')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('Profile Updated Successfully!')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
