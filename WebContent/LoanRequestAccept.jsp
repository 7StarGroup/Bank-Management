<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cheque Book Request</title>
</head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 82%;
  margin-left: 10%;
}

td, th {
     border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
   
}

input {
      border-top-style: hidden;
      border-right-style: hidden;
      border-left-style: hidden;
      border-bottom-style: groove;
      background-color: #eee;
      }
      
      .no-outline:focus {
      outline: none;
      }

/* tr:nth-child(even) {
  background-color: #dddddd;
} */
</style>
<body>
<center><h2>Cheque Book Requests</h2></center>
<form action="ChequeBookAction" method="post">
<table>
<col width="200px">
<col width="200px">

	<th>Account Holder Name</th>
	<th>Account No</th>
	<th>Company Name</th>
	<th>Salary Slip</th>

<%@page import="com.bank.db.Connect"%>
<%@page import="java.sql.*"%>
  <%Connection con=null;
ResultSet rs=null;
PreparedStatement stmt; 

con=Connect.connectDb();
try
{
	stmt=con.prepareStatement("select user_name,account_id,company_name,salary_slip_url from user,account,user_account,user_loan where user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and chequebook=1");
	
	
	rs=stmt.executeQuery();
	
	while(rs.next())
	{


  %>


	 
  <tr>
    <td><input type="text" name="name" class="no-outline" readonly value="<%= rs.getString(1) %>"></td>
    <td><input type="text" name="acno" class="no-outline" readonly value="<%= rs.getString(2) %>"></td>
     <td><input type="text" name="name" class="no-outline" readonly value="<%= rs.getString(3) %>"></td>
    <td><input type="text" name="name" class="no-outline" readonly value="<%= rs.getString(4) %>"></td>
   
   
    <td><select name="action">
    	<option value=1>Accept</option>
    	<option value=2>Reject</option></select></td>
    	<td><input type="submit" value="Done"></td>
    
    </tr>
    
    <%}} catch(Exception e){}%>
   
</table>
</form>
</body>
</html>
