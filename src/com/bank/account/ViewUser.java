package com.bank.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;

import java.sql.*;

@WebServlet("/ViewUser")
public class ViewUser extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Long accountNo = Long.parseLong(request.getParameter("accountnumber"));
		String name, address;
		Long mobileNo, aadharNo, panNo;

		PreparedStatement ps=null;
		ResultSet rs;

		
		try {
			Connection con = Connect.connectDb();
			con.prepareStatement(
					"select * from user,account,user_account where  user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and account_id=100");
			rs=ps.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				
				session.setAttribute("Name", rs.getString(2));
				session.setAttribute("Mobile", rs.getString(3));
				session.setAttribute("Address", rs.getString(5));
				session.setAttribute("Aadhar", rs.getString(9));
			}
			else
			{
				//no user
				session.setAttribute("Error","No user found");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
