<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Con`tent-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<style>
body {
	background-color: black;
	
}

.login {
	background-color: white;
	height: 262px;
	width: 500px;
	    margin-left: 390px;
	margin-top: 200px;
	border-radius: 8px;
}

input[type=button]:hover {
	background-color:  #2e86c1 ;
}

.button:active {
	background-color:  #2e86c1 ;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

.fonts {
	font-family: Courier;
	color: black;
	
}

input[type=text],input[type=password]{
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

.button {
	background-color: #1890ff;
	border: none;
	color: white;
	padding: 15px 98px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

h1 {
	margin-left: 50%;
	color: white;
}

.forgot {
    
}
</style>
<body>
 
	<div class="login">
		<h1 class="fonts" style="margin-left:40% ">Login</h1>

		

		<form action="Login" method="POST">

			<table class="fonts" align="center" cell>

				<tr>
					<td>Username</td>
					<td><input type="text" name="username" placeholder="username"
						required pattern="[A-Za-z_ ]{1,50}" title="It should contain only alphabets"></td>
				</tr>
				<tr></tr>

				<tr>
					<td>Password</td>
					<td><input type="password" name="password" placeholder="password"
						required pattern=".{4,10}" required title="password should be of min 5 or max 10 characters"></td>
				</tr>
				<tr>
					<td><input type="submit" class="button" value="Login"></td>
					<td><a href="Welcome.jsp"><input type="button" class="button" value="Cancel"></a></td>
				</tr>
			</table>
		</form>
		<a class="fonts" style="margin-left: 65%" href="forgotPassword.jsp">forgot
			Password?</a>
	</div>
</body>
</html>