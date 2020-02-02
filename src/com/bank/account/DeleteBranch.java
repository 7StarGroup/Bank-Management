package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;

/**
 * Servlet implementation class DeleteBranch
 */
@WebServlet("/DeleteBranch")
public class DeleteBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PreparedStatement ps = null;
		Connection con = Connect.connectDb();
		try {
			ps = con.prepareStatement("delete from branch where branch_id=?");
			ps.setLong(1, Long.parseLong(request.getParameter("branchId")));
			int i = ps.executeUpdate();
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Branch deleted successfully.')");
				out.println("</script>");

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
