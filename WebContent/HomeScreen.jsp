<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<!-- for icons -->
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Bank Management</title>
</head>
<style>
body {
	margin: 0;
	font-family: "Lato", sans-serif;
		overflow:auto;
}

.sidenav {
	height: 100%;
	width: 250px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 15px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: white;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #818181;
}

.active {
	background-color: blueviolet;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: #262626;
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.BankName {
	margin-left: 192px;
	color: darkcyan;
	/* background: yellow;
margin-top: -20px;  */
}

iframe {
	margin-left: 19%;
	height: 700px;
	width: 81%;
	overflow:scroll;
	border: none;
}
</style>
</head>
<body>

<!-- 	<div class="BankName">
		<center>
			<h2>Welcome To Online Bank...!</h2>
		</center>
	</div> -->

	<div class="container">

		<iframe src="Images/bank5.jpg" name="iframe_a" scrolling="no"></iframe>
	</div>



	<div class="sidenav">
		<a href="#"><b><i class="fas fa-user"></i> PROFILE</b></a> <a
			href="AccountDetails.jsp" target="iframe_a"><b><i
				class="fa fa-table"></i> ACCOUNT DETAILS</b></a> <a href="Passbook.jsp"
			target="iframe_a"><b><i class="fa fa-book"></i> E-PASSBOOK</b></a> <a
			href="#"><b><i class="fas fa-wallet"></i> BALANCE</b></a> <a
			href="MoneyTransfer.jsp" target="iframe_a"><b><i
				class="fa fa-money"></i> TRANSFER MONEY</b></a> <a
			href="TransactionHistory.jsp" target="iframe_a"><b><i
				class="fa fa-history"></i> TRANSACTION HISTORY</b></a>
		<button class="dropdown-btn">
			<b><i class="fa fa-bank"></i> OTHER SERVICES</b> <i
				class="fa fa-caret-down"></i>
		</button>
		<div class="dropdown-container">
			<a href="NewAccount.jsp" target="iframe_a">Apply for new account</a>
			<a href="LoanRequst.jsp" target="iframe_a">Apply for loan</a> <a href="#">Apply for new passbook</a>
			<a href="#">Apply for new cheque book</a> <a href="#">Close
				account</a>
		</div>
		<a href="#"><b><i class="fa fa-sign-out"></i> LOGOUT</b></a>
	</div>

	<!-- <div style="margin-left:19%;padding:1px 16px;height:1000px;">
  <center><h2>Welcome To Online Bank...!</h2></center>
  
</div> -->


	<script>
		/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}
	</script>



</body>
</html>
