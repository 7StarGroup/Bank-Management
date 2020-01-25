<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<style>
body {
	background: black;
}

#forgot {
	background-color: white;
	height: 262px;
	width: 500px;
	margin-left: 350px;
	margin-top: 200px;
	border-radius: 8px;
}
input[type=button]:hover {
	background-color:  #006400 ;
}
input[type=submit]:hover {
	background-color:  #006400 ;
}
.button:active {
	background-color:  #2e86c1 ;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
.fonts {
	font-family: sans-serif;
}

input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin-left: 35%;
	margin-top: 15%;
}

h1 {
	margin-left: 50%;
	color: white;
}

.forgot {
	margin-left: 41%;
}
</style>
<body>

	<div id="forgot">
		<form action="ForgetPassword" method="POST">
			<h1 class="fonts">Send mail</h1>
			<table class="fonts" align="center" cell>

				<tr>
					<td>Email Id</td>
					<td></td>
					<td><input type="text" name="emailId"
						placeholder="Registered emailId" required ></td>
				</tr>
			</table>
		
		<input type="submit" class="button" value="Send mail">
		</form>
	</div>
</body>
</html>