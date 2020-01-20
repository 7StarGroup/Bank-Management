package com.bank.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/LoanRequest")
public class LoanRequest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long accountNo=Long.parseLong(request.getParameter("accountnumber"));
		String name,address;
		Long mobileNo,aadharNo,panNo;
		
		
		PreparedStatement ps;ResultSet rs;
		
		
	}

}
