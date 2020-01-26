<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.bank.db.Connect" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http//www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>

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
.profileDiv {
	width: 450px;
    height: 300px;
    border: 1px solid #1890ff;
    border-top-width: 40px;
    border-radius: 20px;
}

#title {
	color: white;
	margin-top: -40px;
	font: bold;
	font-family: sans-serif;
}

table {
	font-family: sans-serif;
	font: bold;
}

.button {
	background-color: #1890ff /* #4CAF50 */; /* Green */
	border: none;
    color: white;
    padding: 10px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
        margin-top: 39px
    text-decoration: none;
    border-radius: 8px;

}

td {
	padding-top: .5em;
	padding-bottom: .5em;
}
</style>

</head>
<body>
	<center>
		
				<div class="profileDiv">
			<h1 id="title">Profile</h1>

<!-- writing java code for getting current user details from database and displaying on this jsp  -->
<% 
Connection con=null;
ResultSet rs=null;
String email;
try
{	
	
	
	con=Connect.connectDb();
	if(con==null)
	{
		System.out.println("Not Connedted");
	}
	else
	{
		System.out.println("Connected");
	}
	
	int user_id=(int) session.getAttribute("user_id");

	String sql="select user_name,email,address,contact from user where user_id=?";
	
	PreparedStatement stmt =con.prepareStatement(sql);
	stmt.setInt(1, user_id);
	rs=stmt.executeQuery();
	
	rs.next();
	
}catch(Exception e)
{
System.out.println(e);
}
%>


			<table id="table">
				<tr>
					<td><b>Name :</b></td>
					<td><b><%=rs.getString(1) %> </b></td>
				</tr>
				<br>
				<tr></tr>
				<tr>
					<td><b>Email :</b></td>
					<td><b><%=rs.getString(2) %> </b></td>
				</tr>
				<tr></tr>
				<tr>
					<td><b>Address :</b></td>
					<td><b><%=rs.getString(3) %> </b></td>
				</tr>
				<tr></tr>
				<tr>
					<td><b>Contact :</b></td>
					<td><b><%=rs.getString(4) %> </b></td>
				</tr>


			</table>
			<a href="#myModal1" class="button" data-toggle="modal">Edit</a>
		</div>
				
			
				
		
		

	</center>
	<!-- Pending work for student class nd etc -->
	<form action="editProfile" method="POST" autocomplete="on">
		<div class="container pb-modalreglog-container">
			<div class="row">
				<div class="col-xs-12 col-md-4 col-md-offset-4">
					<div class="input-group pb-modalreglog-input-group"></div>
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Profile Updation form</h4>
								</div>
								<div class="modal-body">


									<div class="form-group">
										<label for="name">Name</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="adminname"
												name="adminname" placeholder="Name" required="required" value="<%=rs.getString(1)%>">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>

									<div class="form-group">
										<label for="email">Email</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="email" class="form-control" id="adminemail"
												name="adminemail" placeholder="Email" required="required" value="<%=rs.getString(2)%>">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>

									
									<div class="form-group">
										<label for="Address">Address</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="adminaddress"
												name="adminaddress" placeholder="address" required="required" value="<%=rs.getString(3)%>">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>
									
									<div class="form-group">
										<label for="contact">Contact</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="admincontact"
												name="admincontact" placeholder="Contact"
												required="required" value="<%=rs.getString(4)%>"> <span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>

								


								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-primary">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>




<!-- 

	<script type="text/javascript">
		var table = document.getElementById('table'), rIndex;

		for (var i = 1; i < table.rows.length; i++) {
			table.rows[i].onclick = function() {
				rIndex = this.rowsIndex;
				document.getElementById("adminid").value = this.cells[1].innerHTML;
				document.getElementById("adminname").value = this.cells[1].innerHTML;

			}
		}
	</script>
-->
</body>
</html>