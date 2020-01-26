<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction History</title>
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

/* tr:nth-child(even) {
  background-color: #dddddd;
} */
</style>
<body>
	<center>
		<h2>Transaction Information</h2>
	</center>
	<table>
		<%@page import="com.bank.db.Connect"%>
		<%@page import="java.sql.*"%>
		<%
			Connection con = null;
			ResultSet rs = null;
			String email;
			try {

				con = Connect.connectDb();
				int user_id = (int) session.getAttribute("user_id");

				String sql = "select tran_type, user_name from transactions,user where transactions.user_id_fk=user.user_id and user_id=?";

				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setInt(1, user_id);
				rs = stmt.executeQuery();

			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		<col width="200px">
		<col width="200px">
		<tr>
			<th>Transaction</th>
			<th>Amount</th>
		</tr>


		<%
			while (rs.next()) {
		%>
		<tr>

			<!-- here wants to display data in table from above querys output.. ex.  instead akshay kamble rs.getString  -->

			<td><%=rs.getString(2)%></td>
			<td>300 Rs</td>

		</tr>
		<tr>
			<td>Nisarga Misal :</td>
			<td>65 Rs</td>

		</tr>
		<%
			}
		%>

	</table>

</body>
</html>