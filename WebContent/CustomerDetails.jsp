<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="com.bank.db.Connect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<style>
* {
  box-sizing: border-box;
}

input[type=text],input[type=date], select, textarea {
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

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 82%;
  margin-left: 10%;
  margin-top: 10%;
}

td, th {
     border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
   
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
<body>
<div class="container">
<center><h2>Customer Details</h2></center>
  
<% Connection con=null; 
	PreparedStatement stmt;
    ResultSet rs;  
    		
    		long accountNumber=Long.parseLong(request.getParameter("accountnumber"));
    		  con=Connect.connectDb();
    		  
    		  stmt=con.prepareStatement("select user_name,account_id,ifsc_code,account_type,branch_name,contact,email,is_active from user,account,branch,user_account where user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and account.branch_id_fk=branch.branch_id and account_id=?");
    		stmt.setLong(1,accountNumber);
    		  rs=stmt.executeQuery();	  
			


%>  
  
  
  <table >
<col width="200px">
<col width="200px">
  
 <%if(rs.next()){ %>
  <tr>
    <td><b>Account Holder :</b></td>
    <td><%=rs.getString(1)%></td>
    </tr>
    
   
  </tr>
  <tr>
    <td><b>Account Number :</b></td>
    <td><%=rs.getLong(2)%></td>
   
   
  </tr>
  <tr>
    <td><b>IFSC Code :</b></td>
   <td><%=rs.getString(3)%></td>
    </tr>
    
    </tr>
  <tr>
    <td><b>Account Type :</b></td>
   <td><%=rs.getString(4)%></td>
    </tr>
    
    <tr>
    <td><b>Branch :</b></td>
   <td><%=rs.getString(5)%></td>
    </tr>
    
    <tr>
    <td><b>Contact No :</b></td>
   <td><%=rs.getString(6)%></td>
    </tr>
    
    <tr>
    <td><b>Email :</b></td>
   <td><%=rs.getString(7)%></td>
    </tr>
    
    <tr>
    <td><b>IsActive :</b></td>
    <%if(rs.getBoolean(8)){%>
   <td>YES</td>
   <% }else{%>
    <td>NO</td><%} %>
    </tr>
    <tr>
    
 <%}else{%>
	 
	 <script>alert("Account details not found");
	 window.parent.location.reload();
	 </script>
	 
 <% } %> 
    </table>
  </div>
  </body>
  </html>
  