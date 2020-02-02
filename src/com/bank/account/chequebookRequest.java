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

@WebServlet("/chequebookRequest")
public class chequebookRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try

		{
			PreparedStatement ps = null;
			Connection con = null;
			con=Connect.connectDb();
			HttpSession session = request.getSession();
			Integer user_id = (Integer) session.getAttribute("user_id");
			ps = con.prepareStatement("update user set chequebook=? where user_id=?");
			ps.setBoolean(1, Boolean.TRUE);
			ps.setLong(2, user_id);
			int i = ps.executeUpdate();
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('cheque request accepted.')");
				out.println("window.location.href='HomeScreen.jsp'");
				out.println("</script>");

			}

		} catch (Exception e) {

		}

	}

}
