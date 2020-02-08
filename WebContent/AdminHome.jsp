<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<!-- for icons -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Bank Management</title>
</head>
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
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
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.BankName
{
margin-left:192px;
color: darkcyan;
/* background: yellow;
margin-top: -20px;  */
}

iframe
{
margin-left:19%;
height:800px;
width: 81%;
border:none;



} 
</style>
</head>
<body>



<div class="BankName">
 <center><h1>||Welcome to online banking||</h1></center>
</div>

<div class="container">

<iframe  src="Images/bank5.jpg" name="iframe_a" scrolling="auto"></iframe>
</div>



<div class="sidenav">
<a href="#"><img style="height: 40px; width: 80px;" src="Images/logo.jpg"></a>
<a href="profile.jsp" target="iframe_a"><b><i class="fas fa-user"></i> PROFILE</b></a>

<a class="active" href="AdminHome.jsp"><b><i class="fa fa-home" style="font-size:22px"></i> HOME</b></a>
<a href="SearchCustomer.jsp" target="iframe_a"><b><i class="fa fa-address-card"></i> CUSTOMER DETAILS</b></a>
    <button class="dropdown-btn"><b><i class="fa fa-bank"></i> BRANCHES</b>

    <i class="fa fa-caret-down"></i>
  </button>
  
  <div class="dropdown-container">
    <a href="AddBranch.jsp" target="iframe_a">Add Branches</a>
    <a href="UpdateBranch.jsp" target="iframe_a">Update Branch</a>
  </div>
   <button class="dropdown-btn"><b><i class="fa fa-check"></i> REQUEST</b>
    <i class="fa fa-caret-down"></i>
  </button>
  
  <div class="dropdown-container">
    <a href="LoanRequest.jsp" target="iframe_a">Loan Request</a>
    <a href="CancelRequest.jsp" target="iframe_a">Close Account Request</a>
     <a href="ChequebookRequest.jsp" target="iframe_a">Chequebook request</a>
     <a href="PassbookRequest.jsp" target="iframe_a">Passbook request</a>
  </div>
   <button class="dropdown-btn"><b><i class="fa fa-check"></i> ADMIN</b>
    <i class="fa fa-caret-down"></i>
  </button>
  
  <div class="dropdown-container">
    <a href="AdminReg.jsp" target="iframe_a">Add Admin</a>
    <a href="ViewAdmins.jsp" target="iframe_a">View Admin</a>
  </div>
  
  <a href="Login.jsp"><b><i class="fa fa-sign-out"></i> LOGOUT</b></a>
</div>



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
