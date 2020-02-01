package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bank.db.Connect;
import java.sql.*;

/**
 * Servlet implementation class UpdateBranch
 */
@WebServlet("/UpdateBranch")
public class UpdateBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBranch() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PreparedStatement ps = null;
		Connection con = Connect.connectDb();
		System.out.println("Branch" + request.getParameter("branchId"));
		try {
			ps = con.prepareStatement("update branch set branch_name=?,branch_address=?,branch_contact=?,ifsc_code=? where branch_id=?");
			ps.setString(1, request.getParameter("branchname"));
			ps.setString(2, request.getParameter("branchaddress"));
			ps.setString(3, request.getParameter("branchcontact"));
			ps.setString(4, request.getParameter("branchIfsc"));
			ps.setLong(5, Long.parseLong(request.getParameter("branchId")));

			int i = ps.executeUpdate();
			System.out.println("Query executed");
			if (i != 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Branch updated successfully.')");
				out.println("window.location.href='AdminHome.jsp'");
				out.println("</script>");
			}

		} catch (Exception e) {

		}

	}

}
