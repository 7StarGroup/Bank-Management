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
@WebServlet("/DebitRequest")
public class DebitRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try

		{
			PreparedStatement ps = null;
			Connection con = null;
			String cardType=request.getParameter("cardType");
			con = Connect.connectDb();
			HttpSession session = request.getSession();
			Integer user_id = (Integer) session.getAttribute("user_id");
			ps = con.prepareStatement("update user set debitcard_applied=? , card_type=? where user_id=?");
			ps.setBoolean(1, Boolean.TRUE);
			ps.setString(2, cardType);
			ps.setLong(3, user_id);
			int i = ps.executeUpdate();
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('credit card request accepted.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");

			}

		} catch (Exception e) {

		}

	}

}
