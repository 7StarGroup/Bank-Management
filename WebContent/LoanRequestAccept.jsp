<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cheque Book Request</title>
</head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 82%;
	margin-left: 10%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

input {
	border-top-style: hidden;
	border-right-style: hidden;
	border-left-style: hidden;
	border-bottom-style: groove;
	background-color: #eee;
}

.no-outline:focus {
	outline: none;
}

/* tr:nth-child(even) {
  background-color: #dddddd;
} */
</style>
<body>
	<center>
		<h2>Loan Book Requests</h2>
	</center>
	<form action="LoanRequestAction" method="post">
		<table>
			<col width="200px">
			<col width="200px">

			<th>Account Holder Name</th>
			<th>Account No</th>
			<th>Company Name</th>
			<th>Salary Slip</th>
			<th>Accept/Reject</th>
			<th>Action</th>
			<%@page import="com.bank.db.Connect"%>
			<%@page import="java.sql.*"%>
			<%
				Connection con = null;
				ResultSet rs = null;
				PreparedStatement stmt;

				con = Connect.connectDb();
				try {
					String sql = "select account_id,user_id,user_name,company_name,salary_slip_url,loan_amount from account,user_account,user_loan,user where account.account_id=user_account.account_id_fk and user_loan.user_id_fk=user_account.user_id_fk and user_loan.user_id_fk=user.user_id and is_Sanctioned=0";

					stmt = con.prepareStatement(sql);
					
					rs = stmt.executeQuery();

					
					while (rs.next()) {
						session.setAttribute("userId",rs.getInt(2));
			%>

					

			<tr>
				<td><input type="text" name="name" class="no-outline" readonly
					value="<%=rs.getString(3)%>"></td>
				<td><input type="text" name="acno" class="no-outline" readonly
					value="<%=rs.getString(1)%>"></td>
				<td><input type="text" name="name" class="no-outline" readonly
					value="<%=rs.getString(4)%>"></td>
				<td><a href="Images\<%=new File(rs.getString(5)).getName()%>"
					download=''>Click Here To Download</a></td>


				<td><select name="action">
						<option value=1>Accept</option>
						<option value=2>Reject</option>
				</select></td>
				<td><input type="submit" value="Done"></td>

			</tr>

			<%
				}
				} catch (Exception e) {
				}
			%>

		</table>
	</form>
</body>
</html>
