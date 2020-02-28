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

/**
 * Servlet implementation class LoanRequestAction
 */
@WebServlet("/LoanRequestAction")
public class LoanRequestAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Integer user_id = (Integer) session.getAttribute("userId");

		Connection con = Connect.connectDb();
		try {
			PreparedStatement ps = con.prepareStatement("update user_loan set is_Sanctioned=? where  user_id_fk=?");
			ps.setBoolean(1, Boolean.TRUE);
			ps.setInt(2, user_id);

			int i = ps.executeUpdate();
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Loan request accepted successfully.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");

			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
