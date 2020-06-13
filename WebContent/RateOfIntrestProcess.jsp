<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.bank.db.Connect"%>
	<%@page import="java.sql.*"%>


	<%
		Connection con = null;
		ResultSet rs = null;
		String Result="";
		try {
			String loantype=request.getParameter("loantype");  

			con = Connect.connectDb();

			String sql1 ="select no_of_years from loan where loan_type=?";
			PreparedStatement stmt = con.prepareStatement(sql1);
			stmt.setString(1, loantype);
			rs = stmt.executeQuery();
			while(rs.next())
			{
				Result=Result+rs.getInt(1)+":";
			}
		}
		catch(Exception e){}
			
		System.out.println(Result);
		
		out.print(Result);


%>




