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

input[type=text] select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}
.IFSC {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}
input[type=password],input[type=text]{
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

input[type=submit],input[type=reset] {
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
	padding: 12px 23px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
<script>
</script>
<body>
	<div class="container">
		<form action="AddBranch" method="post" >
			<div class="row">
				<div class="col-25">
					<label for="Name"><b>Branch Name :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="branch" placeholder="Branch Name"
						required pattern="[A-Za-z_ ]{1,50}" title="It should contain only alphabets">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Mobile No"><b>IFSC Code:</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="ifscInitial" value="BIF"  class="IFSC" style="width: 10%" placeholder="BIFSC"
						>
						<input type="text" name="ifsc" class="IFSC" style="width:50%" placeholder="IFSC CODE"
						required pattern="[A-Z0-9]{}" 
       title="It should contain digits and characters">
						
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Branch Contact"><b>Branch Contact :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="contact" placeholder="Branch Contact"
						required pattern="[0-9]{10}" 
       title="It should contain only digits and length must be 10 digit">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="Address"><b>Address :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="address" placeholder="Address"
						required>
				</div>
			</div>
			<div class="row">

				<table>
				</table>
				<input type="submit" value="AddBranch" class="button" style="margin-right: 60%; margin-top : 10%">
					<input type="reset" value="Cancel" class="button" style="margin-right: -47%; margin-top :10%">
			</div>
		</form>
	</div>
</body>
</html>