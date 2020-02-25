package com.bank.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;

@WebServlet("/ViewUser")
public class ViewUser extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accountNo = request.getParameter("accountnumber");
		String name, address;
		Long mobileNo, aadharNo, panNo;

		PreparedStatement ps=null;
		ResultSet rs;

		
		try {
			Connection con = Connect.connectDb();
			ps=con.prepareStatement(
					"select * from user,user_account where user.user_id=user_account.user_id_fk and account_id_fk=?");
			ps.setInt(1,Integer.parseInt(accountNo));
			rs=ps.executeQuery();
			HttpSession session=request.getSession();
			if(rs.next())
			{
				System.out.println(rs.getInt(6));
				session.setAttribute("Name",rs.getString(2));
				session.setAttribute("Mobile", rs.getInt(6));
				session.setAttribute("Address", rs.getString(5));
				session.setAttribute("Aadhar", rs.getString(9));
				PrintWriter pw=response.getWriter();
				pw.println("<script type='text/javascript'>");
				pw.println("location='LoanRequst.jsp';");
				pw.print("</script>");
			}
			else
			{
				//no user
				session.setAttribute("Error","No user found");
				System.out.println("ERROR");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
