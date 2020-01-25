<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Account</title>
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
	margin-top: -4%;
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
<script>
	function validate() {

		var aadhar = document.getElementById("aadhar");
		if (aadhar.toString().length < 12) {
			alert("Invalid aadhar number");
		}

	}
</script>
<body>
	<form action="save">
		<div class="container">

			<div class="row">

				<div class="col-25">
					<label for="A/cNo"><b>Your A/c Number :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="accountnumber"
						placeholder=<%=session.getAttribute("userId")%> >
				</div>
			<!-- 	<div class="col-75">
					<a href="ViewUser"><input type="button" class="button" value="Okay"></a>
				</div> -->

			</div>
			<div class="row">
				<div class="col-25">
					<label for="Name"><b>Your Name :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="name" pattern="[A-Za-z]"
						placeholder=<%=session.getAttribute("Name")%>
						disabled>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Mobile No"><b>Mobile No :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="moblie" placeholder=<%=session.getAttribute("Mobile")  %>
						disabled>
				</div>
			</div>
			<div class="row"></div>
			<div class="row">
				<div class="col-25">
					<label for="Address"><b>Address :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="address" placeholder=<%=session.getAttribute("Address") %>						required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="aadharnumber"><b>Aadhar number :</b></label>
				</div>
				<div class="col-75">
					<input type="text" id="aadhar" name="aadharnumber" min=12 max=12
						placeholder="Your aadhar number" required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="pannumber"><b>company name :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="companyname" min=15 max=15
						placeholder="your company name" required>
				</div>
			</div>


			<div class="row"></div>
			<div class="row">

				<table>
					<tr>
						<th>Documents</th>
						<th>Upload File</th>
						<th>Save</th>
					</tr>
					<tr>
						<td>Aadhar</td>
						<td>
							<div class="col-75">
								<br> <input type="file" name="document" multiple required><br>
							</div>
						</td>
						<td><form action="viewUser">
								<input type="button" class="button" value="Save" required>
							</form></td>
					</tr>
					<tr>
						<td>Pan</td>
						<td>
							<div class="col-75">
								<form action="savedocument">
									<br> <input type="file" name="document" multiple required><br>
								</form>
							</div>
						</td>
						<form action="savedocument">
							<td><input type="submit" class="button" value="Save"
								required></td>
						</form>
					</tr>
				</table>
				<input type="submit" value="Submit" class="button"
					style="margin-right: 60%; margin-top: 10%"> <input
					type="submit" value="Cancel" class="button"
					style="margin-right: -47%; margin-top: 10%">
			</div>
	</form>
	</div>
</body>
</html>