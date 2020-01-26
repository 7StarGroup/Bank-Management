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

import com.bank.db.Connect;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("html");
		PrintWriter out = response.getWriter();
		try {
			Connection con;
			con = Connect.connectDb();

			if (con == null) {
				System.out.println("Not Connected in Login .Java");
			} else {
				System.out.println("Connected");

			}

			String name = request.getParameter("username");
			String password = request.getParameter("password");

			PreparedStatement stmt = con
					.prepareStatement("select user_name,role,password,user_id from user where user_name=? and password=?");

			stmt.setString(1, name);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				/*
				 * out.println("<script>"); out.println("alert('Success')");
				 * out.println("</script>");
				 */

				// setting session to this user
				int uid = rs.getInt("user_id");
				HttpSession session = request.getSession();
				session.setAttribute("user_id", uid);

				
				if(rs.getString("role").equalsIgnoreCase("ADMIN"))
				{
					out.println("<script>");
					out.println("window.location.replace('AdminHome.jsp')");
					out.println("</script>");
				}else
				{
				
				out.println("<script>");
				out.println("window.location.replace('HomeScreen.jsp')");
				out.println("</script>");
				}

			} else {
				out.println("<script>");
				out.println("alert('Oops login failed please try again with correct credentials')");
				out.println("window.location.replace('Login.jsp')");
				out.println("</script>");

			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}

	}
}
