package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import com.bank.db.*;

@WebServlet("/DeleteLoan")
public class DeleteLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Connection con = Connect.connectDb();
			PreparedStatement ps = con.prepareStatement("delete  from loan where loan_id=?");
			ps.setInt(1, Integer.parseInt(request.getParameter("loanId")));
			int i = ps.executeUpdate();
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Loan deleted successfully.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");

			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Loan Deletion Error.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}
		} catch (Exception e) {

		}

	}

}
