<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Customer</title>
</head>
<style>
* {
	box-sizing: border-box;
}

input[type=text], input[type=date], select, textarea {
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

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: white;
	padding: 20px;
	width: 80%;
	margin-left: 10%;
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
</style>
<body>
	<div class="container">
		<center>
			<h2>Search Customer Here</h2>
		</center>
		<form action="CustomerDetails.jsp">
			<div class="row">
				<div class="col-25">
					<label for="From"><b>Account Number :</b></label>
				</div>
				<div class="col-75">
					<input type="text" name="accountnumber"
						placeholder="Account Number">
				</div>
			</div>


			<div class="row">
				<input type="submit" value="Search">
			</div>
		</form>
	</div>
</body>
</html>