<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.bank.db.Connect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<style>
* {
	box-sizing: border-box;
}

body {
	height: 100%;
	overflow: scroll;
}

input[type=text], [type=email], [type=password], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: white;
	padding: 20px;
	width: 80%;
	margin-left: 10%;
	margin-top: 0%;
	font-family: sans-serif;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
	overflow: visible;
	font-size: 12px;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 5px 23px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 50%;
}
</style>
<body>
	<center>
		<h2>Your profile</h2>
	</center>


	<%
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;

		con = Connect.connectDb();
		Integer user_id = (Integer) session.getAttribute("user_id");
		String sql = "select user_name,email,address,contact from user where user_id=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, user_id);
		rs = ps.executeQuery();
		int eid = 0;
		while (rs.next()) {
	%>

	<form action="editProfile" method="post">
		<div class="container">

			<div class="row">

				<div class="col-25">
					<label for="A/cNo"><b>Your Name:</b></label>
				</div>
				<div class="col-75">
					<input type="text" value=<%=rs.getString(1) %> name="name" placeholder="userId"
						>
				</div>
				<!-- 	<div class="col-75">
					<a href="ViewUser"><input type="button" class="button" value="Okay"></a>
				</div> -->

			</div>
			<div class="row">
				<div class="col-25">
					<label for="Email"><b>Your Email :</b></label>
				</div>
				<div class="col-75">
					<input type="text" value=<%=rs.getString(2)%> name="email" >
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Addres"><b>Address :</b></label>
				</div>
				<div class="col-75">
					<input type="text"  value=<%=rs.getString(3)%> name="address" >
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Addres"><b>Contact :</b></label>
				</div>
				<div class="col-75">
					<input type="text"  value=<%=rs.getString(4)%> name="contact" >
				</div>
			</div>
			<%
				}
			%>

			<div class="row">

				<input type="submit" value="Apply" class="button"
					style="margin-right: 60%; margin-top: 10%"> <input
					type="submit" value="Cancel" class="button"
					style="margin-right: -47%; margin-top: 10%">
			</div>
	</form>
	</div>
</body>
</html>