<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
</head>
<style>
body {
	background: black;
}



#reset {
	background-color: white;
	height: 305px;
	width: 500px;
	margin-left: 300px;
	margin-top: 200px;
	border-radius: 8px;
}

input[type=button]:hover {
	background-color: #006400;
}

.button:active {
	background-color: #3e8e41;
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
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 98px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
h1
{
margin-left: 50%;
color : white;
}
.forgot {
	margin-left: 41%;
}
</style>
<body>

	<div id="reset">
	<h1 class="fonts">Reset Password</h1>
	<form action="UpdatePassword" method="post">
		<table class="fonts" align="center" cell>
		
		
			<input type="hidden" name="username" placeholder="New Password" value="<%= request.getParameter("username") %>">
			
				<tr>
				<td>New password</td>
				<td><input type="text" name="Newpassword" placeholder="New Password" required>
				</td>
			</tr>
			<tr>
				<td>Confirm password</td>
				<td><input type="text" name="Confirmpassword" placeholder="Confirm password" required>
				</td>
			</tr>
			<tr>
				<td><input type="submit" class="button" value="Reset"></td>
				<td><a href="login.jsp"><input type="button" class="button" value="Cancel"></a></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>