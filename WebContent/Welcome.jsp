<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Management</title>

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
<Style>
body{
	margin:0;
	padding:0;
	background:#fafafa;
	color:#fff;
	
	
}
.main{
	position: relative;
	height:100vh;
	width:100%;
	top:0;
	left:0;
	right:0;
	background-image: url("Images/bank6.jpg");
}
.main .overlay{
	position: absolute;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background:rgba(0, 0, 0, 0.5);
	z-index: 0;
}

.main .navbar{
	position: absolute;
	height:auto;
	width:100%;
	margin:2% 0;
	display: flex;
	align-items: center;
	overflow: hidden;
	padding:10px 0;
}
.main .navbar .logo{
	position: relative;
	height:auto;
	width:20%;
	left:10%;
	float:left;
	font-family:'Lato',sans-serif;
	font-size:35px;
	font-weight:600;
	cursor: pointer;
	text-shadow:0px 0.5px 5px rgba(0, 0, 0, 0.2);
	transition: 0.1s ease-in-out;
}
.main .navbar .logo:hover{
	color:rgba(0, 0, 0, 0.4);
}
.main .navbar  ul{
	position: relative;
	float:right;
	width:50%;
	right:-14%;
	height:auto;
	margin:auto;
}
.main .navbar ul li{
	list-style-type: none;
	display: inline-block;
	height:100%;
	width:auto;
	border:1px solid rgba(255, 255, 255, 0.88);
	border-radius:2px ;
	cursor: pointer;
	padding:10px;
	box-shadow:0px 0.5px 5px rgba(0, 0, 0, 0.2);
	transition: 0.1s ease-in-out;
	box-sizing: border-box;
	margin-left: 65%;
}
.main .navbar ul li a{
	color:#fff;
	text-align: center;
	text-decoration: none;
	font-family:'cinzel',sans-serif;
	font-size:15px;
	font-weight:300;
	display: block;
}
.main .navbar ul li:hover{
	background:rgba(0, 0, 0, 0.4);
}
.main .heading{
	position: absolute;
	height:auto;
	width:100%;
	top:50%;
	transform: translateY(-50%);
	text-align: center;
	text-shadow:0px 0.5px 5px rgba(0, 0, 0, 0.2);
}
.main .heading .head{
	position: relative;
	font-family: 'RacingSansOne',sans-serif;
	font-size:48px;
	font-weight: 600; 
	color:#fff;
}
.main .heading .head span{
	color:#017fb5;
}
.main .heading  .sub{
	position: relative;
	font-family: 'cinzel',sans-serif;
	font-size:22px;
	font-weight: 300; 
	color:#fff;
	margin:-2% 0 2% 0;
}
.main .heading .btns{
	height:auto;
	width:100%;
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	position: relative;
	top: 40px;
}
.main .heading .btns a{
	color:#fff;
	text-align: center;
	text-decoration: none;
	font-family:'cinzel',sans-serif;
	font-size:15px;
	font-weight:300;
	display:block;
	border:1px solid rgba(255, 255, 255, 0.5);
	height:auto;
	width:auto;
	padding:10px;
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: center;
	margin-left:1%;
	border-radius: 2px;
	transition: 0.5s ease-in-out;
}
.main .heading .btns a:hover{
	background:#017fb5;
	border:1px solid #017fb5;
}
.main .heading .btns .btn1{
	background:#017fb5;
	border:1px solid #017fb5;
}
.main .heading .btns .btn1:hover{
	background:#017fb5;
	border:1px solid #017fb5 ;
	color:rgba(255, 255, 255, 0.95);
}
label
{
color : black;}
h4
{

color : black;
}

/* Footer */
.site-footer
{
  background-color: #26272b;
    padding: 5px 0 8px;
    font-size: 15px;
    line-height: 24px;
    color: #737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}

.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}
</Style>
<body>
 <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);%>
<div class="main" >

		<div class="overlay"></div>
		<div class="navbar">
			<div class="logo"><img src="Images/logo.jpg" style="height: 80px; width: 100px;"></div>
			<ul>
				
				<li><a href="NewAccount.jsp">Create New Account</a></li>
			</ul>
			
		</div>
		<div class="heading">
				<h1 class="head">WELCOME TO ONLINE BANKING<span> PORTAL</span></h1><br>
				
				<div class="btns">
					<a class="btn1" href="Login.jsp">Click Here To Login</a>
					<!-- <a class="btn2" href="#">SUBSCRIBE US</a> -->
				</div>	
		</div>
	</div>
	

<!-- Footer -->
  <footer class="site-footer" id="foot">
      
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text"><!-- Copyright &copy; 2019 All Rights Reserved  -->
        		Designed And Developed By 7Star.
            </p>
          </div>

        </div>
      </div>
</footer>
	
	
</body>
</html>