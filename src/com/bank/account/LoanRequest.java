package com.bank.account;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bank.db.Connect;

@WebServlet("/LoanRequest")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class LoanRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con;

		response.setContentType("html");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		String rateOfInterest = request.getParameter("rateOfInterest");
		String loanType = request.getParameter("loanType");
		String mob = request.getParameter("mobile");
		String companyname = request.getParameter("companyname");
		String accountnumber = request.getParameter("accountnumber");
		String address = request.getParameter("address");
		String aadhar = request.getParameter("aadharnumber");

		String pan = request.getParameter("pannumber");
		Integer loanId = (Integer) session.getAttribute("loanId");
		Integer user_id = (Integer) session.getAttribute("user_id");
		Long loanAmount = Long.parseLong(request.getParameter("loanamount"));

		Part part = request.getPart("salary");
		String fileName = extractFileName(part);// file name

		String savePath = "F:\\makarand\\projects\\git_Bank\\bank\\WebContent\\Images" + File.separator + fileName;

		File fileSaveDir = new File(savePath);
		part.write(savePath + File.separator);

		try {
			con = Connect.connectDb();
			PreparedStatement stmt1 = con
					.prepareStatement("select * from user_loan where user_id_fk=? and loan_id_fk=?");
			stmt1.setInt(1, user_id);
			stmt1.setInt(2, loanId);

			ResultSet rs1 = stmt1.executeQuery();
			if (rs1.next()) {
				PreparedStatement stmt2 = con.prepareStatement(
						"update user_loan set loan_id_fk=?,user_id_fk,salary_slip_url=?,company_name=?,is_Sanctioned=?,loan_amount=?");
				stmt2.setInt(1, loanId);
				stmt2.setInt(2, user_id);
				stmt2.setString(3, savePath);
				stmt2.setString(4, companyname);
				stmt2.setBoolean(5, Boolean.FALSE);

				int i = stmt2.executeUpdate();
				if (i != 0) {

					out.println("<script>");
					out.println("alert('You have successfully applied for loan.')");
					out.println("window.parent.location.reload();");
					out.println("</script>");

				} else {
					out.println("<script>");
					out.println("alert('Problem in adding data.')");
					out.println("window.parent.location.reload();");
					out.println("</script>");
				}
			} else {
				PreparedStatement stmt = con.prepareStatement(
						"insert into user_loan (loan_id_fk,user_id_fk,salary_slip_url,company_name,is_Sanctioned,loan_amount)values(?,?,?,?,?,?)");

				stmt.setInt(1, loanId);
				stmt.setInt(2, user_id);
				stmt.setString(3, savePath);
				stmt.setString(4, companyname);
				stmt.setBoolean(5, false);
				stmt.setLong(6, loanAmount);

				int i = stmt.executeUpdate();
				if (i != 0) {

					out.println("<script>");
					out.println("alert('You have successfully applied for loan.')");
					out.println("window.parent.location.reload();");
					out.println("</script>");

				} else {
					out.println("<script>");
					out.println("alert('Problem in adding data.')");
					out.println("window.parent.location.reload();");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String extractFileName(Part part) {// This method will print the
												// file name.
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
