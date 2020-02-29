package com.bank.account;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bank.db.Connect;

@WebServlet("/NewRegistration")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;

	public NewRegistration() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ResultSet rs1 = null, rs2 = null;
		response.setContentType("html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String mob = request.getParameter("mobile");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String aadhar = request.getParameter("aadharnumber");
		String branchName = request.getParameter("branchName");
		String pan = request.getParameter("pannumber");

		String Type = request.getParameter("Type");
		Part part = request.getPart("Adocument");
		String fileName = extractFileName(part);// file name

		String savePath = "C:\\Users\\Dolby\\Desktop\\Bank_Management_Mak\\bank\\WebContent\\Images" + File.separator
				+ fileName;

		File fileSaveDir = new File(savePath);
		part.write(savePath + File.separator);

		Part part1 = request.getPart("Pdocument");
		String fileName1 = extractFileName(part1);// file name

		String savePath1 = "" + File.separator + fileName1;

		File fileSaveDir1 = new File(savePath1);
		part1.write(savePath1 + File.separator);

		try {
			con = Connect.connectDb();
			PreparedStatement userStatement, accountStatement;
			System.out.println("Branch Name" + branchName);
			PreparedStatement ps = con.prepareStatement("select branch_id from branch where branch_name=?");
			ps.setString(1, branchName);
			ResultSet rs = ps.executeQuery();

			PreparedStatement preparedStatemen = con.prepareStatement("select * from user where pan_no=?");
			preparedStatemen.setString(1, pan);
			ResultSet resultSet = preparedStatemen.executeQuery();
			if (resultSet.next()) {
				out.println("<script>");
				out.println("alert('Account already exists please login!!')");
				out.println("window.location='Login.jsp'");
				out.println("</script>");
			}
			userStatement = con.prepareStatement(
					"insert into user (user_name,email,password,address,contact,role,aadhar_url,aadhar_no,pan_url,pan_no)values(?,?,?,?,?,?,?,?,?,?)");

			userStatement.setString(1, name);
			userStatement.setString(2, email);
			userStatement.setString(3, password);
			userStatement.setString(4, address);
			userStatement.setString(5, mob);
			userStatement.setString(6, "Customer");
			userStatement.setString(7, savePath);
			userStatement.setString(8, aadhar);
			userStatement.setString(9, savePath1);
			userStatement.setString(10, pan);

			userStatement.executeUpdate();

			accountStatement = con
					.prepareStatement("insert into account (account_type,min_balance,branch_id_fk) values(?,1500,?)");
			accountStatement.setString(1, Type);
			while (rs.next()) {
				accountStatement.setInt(2, rs.getInt(1));
			}
			int i = accountStatement.executeUpdate();
			if (i != 0) {
				System.out.println("Inserted in account");
			}

			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			rs1 = st.executeQuery("select max(user_id) from user");
			rs2 = st1.executeQuery("select max(account_id) from account");
			PreparedStatement stmt3 = null;
			while ((rs1.next()) && (rs2.next())) {
				int a = rs1.getInt(1);
				int b = rs2.getInt(1);
				stmt3 = con.prepareStatement(
						" insert into user_account(user_id_fk,account_id_fk,is_active,avail_bal,is_deleted) values(?,?,0,1500,0)");
				stmt3.setInt(1, a);
				stmt3.setInt(2, b);

			}
			int j = stmt3.executeUpdate();
			if (i != 0) {
				out.println("<script>");
				out.println("alert('Account created successfully.')");
				out.println("window.parent.location.reload();");
				out.println("</script>");

			}
			rs1.close();
			rs2.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String extractFileName(Part part) {// This method will print the file name.
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
