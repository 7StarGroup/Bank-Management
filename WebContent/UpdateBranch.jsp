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
</style>



<body>
	<% 

/* if(session.getAttribute("username")==null)
{
	response.sendRedirect("index.jsp");
}
/* System.out.println(session.getAttribute("username")); */
 


%>

	<%
  Connection con=null;
  PreparedStatement ps;
  ResultSet rs;
 	 con=Connect.connectDb();
				ps=con.prepareStatement("select * from branch");
			rs=ps.executeQuery();	
			int eid=0;
				 %>



	<table id="table" border="2px solid blue">






		<tr>
			<th>Branch Code</th>
			<th>Name</th>
			<th>Address</th>
			<th>Contact</th>
			<th>IFSC</th>
			<th>Edit</th>
			<th>Delete</th>

			<%while(rs.next()){ eid=rs.getInt(1);
  String str="***";
%>
		
		<tr>
			<td id="myid"><%=rs.getInt(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>

			<td><a href="#myModal1" class="button" data-toggle="modal"
				style="text-decoration: none;">Edit</a></td>
			<td><a href="#myModal2" class="button" data-toggle="modal"
				style="text-decoration: none;"><i class="fa fa-trash"></i>Delete</a></td>
		</tr>
		<%
}
%>
	</table>
	<!-- Add modal -->
	<!-- editmodal -->

	<form action="UpdateBranch" method="post" >
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
									
								</div>
								<div class="modal-body">

									<div class="form-group">
										<label for="email">Branch ID</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="branchId"
												name="branchId" placeholder=<%=eid+1%>> <span
												class="input-group-addon"><span
												class="glyphicon glyphicon-user"></span></span>
										</div>
									</div>
									<div class="form-group">
										<label for="password">Branch Name</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="branchname"
												name="branchname" placeholder="Name" required="required">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>



									<div class="form-group">
										<label for="password">Branch Address</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="branchaddress"
												name="branchaddress" placeholder="Address"
												required="required"> <span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>


									<div class="form-group">
										<label for="password">Branch Contact</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="branchcontact"
												name="branchcontact" placeholder="Contact" required="required">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span>
										</div>
									</div>
									<div class="form-group">
										<label for="IFSC">Branch IFSC</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="branchIfsc"
												name="branchIfsc" placeholder="IFSC" required="required">
											<span class="input-group-addon"><span
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


	<!-- Delete -->
	<form action="DeleteBranch" method="post" >
		<div class="container pb-modalreglog-container">
			<div class="row">
				<div class="col-xs-12 col-md-4 col-md-offset-4">
					<div class="input-group pb-modalreglog-input-group"></div>
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">Delete Branch</h4>
								</div>
								<div class="modal-body">

									<div class="form-group">
										<label for="email">Do You want to delete Branch Code</label>
										<div class="input-group pb-modalreglog-input-group">
											<input type="text" class="form-control" id="code"
												name="branchId"> <span class="input-group-addon"><span
												class="glyphicon glyphicon-user"></span></span>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<input type="submit" value="Delete" class="btn btn-primary">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form>



	<p id="demo"></p>
	<script type="text/javascript">
	var table = document.getElementById('table'), rIndex;

	for (var i = 1; i < table.rows.length; i++) {
		table.rows[i].onclick = function() {
			rIndex = this.rowsIndex;
			document.getElementById("branchId").value = this.cells[0].innerHTML;
			document.getElementById("branchname").value = this.cells[1].innerHTML;
			document.getElementById("branchaddress").value = this.cells[2].innerHTML;
			document.getElementById("branchcontact").value = this.cells[3].innerHTML;
			document.getElementById("branchIfsc").value = this.cells[4].innerHTML;
			//for delete modal Branch code is fetched
			document.getElementById("code").value = this.cells[0].innerHTML;
		}
	}
</script>
</body>
</html>