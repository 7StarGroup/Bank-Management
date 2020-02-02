<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.bank.db.Connect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


</head>


<style>
.bs-example {<!--from ww w .j a v a 2s .co m--> margin:20px;
	
}

table {
	font-family: sans-serif;
	margin-top: 10%;
	border-collapse: collapse;
	width: 100%;
}

th {
	text-align: left;
	padding: 8px;
	background: #6699FF;
	color: white;
	font-weight: bold;
}

td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

#addnew {
	margin-left: 2000%;
	margin-top: -1623%;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
	background-color: #111;
}

select {
	width: 12%;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}

.BankName {
	margin-left: 192px;
	color: darkcyan;
	/* background: yellow;
margin-top: -20px;  */
}
</style>



<body>

<div class="BankName" align="center">
		
			<h2>Admin List</h2>
		
	</div>
	<%
		/* if(session.getAttribute("username")==null)
		{
			response.sendRedirect("index.jsp");
		}
		/* System.out.println(session.getAttribute("username")); */
	%>

	<%
		Connection con = null;
		PreparedStatement ps;
		ResultSet rs;
		con = Connect.connectDb();
		ps = con.prepareStatement("select * from user");
		rs = ps.executeQuery();
		int eid = 0;
	%>


	
	<table id="table" border="2px solid blue">
		<tr>
			<th>User Id</th>
			<th>User Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Contact</th>


			<%
				while (rs.next()) {
					eid = rs.getInt(1);
					String str = "***";
			%>
		
		<tr>
			<td id="myid"><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>

		</tr>
		<%
			}
		%>
	</table>
	<!-- Add modal -->
	<!-- editmodal -->






	<p id="demo"></p>
	<script type="text/javascript">
		var table = document.getElementById('table'), rIndex;

		for (var i = 1; i < table.rows.length; i++) {
			table.rows[i].onclick = function() {
				rIndex = this.rowsIndex;
				document.getElementById("userId").value = this.cells[0].innerHTML;
				document.getElementById("username").value = this.cells[1].innerHTML;
				document.getElementById("email").value = this.cells[2].innerHTML;
				document.getElementById("address").value = this.cells[3].innerHTML;
				document.getElementById("contact").value = this.cells[4].innerHTML;
				//for delete modal Branch code is fetched
				document.getElementById("code").value = this.cells[0].innerHTML;
			}
		}
	</script>
</body>
</html>