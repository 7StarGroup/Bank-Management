<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="com.bank.db.Connect" %>
<%@page import="java.sql.*"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Balance</title>
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

/* tr:nth-child(even) {
  background-color: #dddddd;
} */
</style>
<body>
<center><h2>Account Balance</h2></center>

    
  

<% 
Connection con=null;
PreparedStatement stmt;
ResultSet rs=null;

try
{

	
	con = Connect.connectDb();
	
	 
	
	int user_id=(int) session.getAttribute("user_id");

	String sql="select user_name,avail_bal from user,user_account where user.user_id=user_account.user_id_fk and user_id=?";
	
	stmt =con.prepareStatement(sql);
	stmt.setInt(1, user_id);
	rs=stmt.executeQuery();
	
	if(rs.next())
	{
	
	

%>

<table>
<col width="200px">
<col width="200px">
  
  
  <tr>
    <td><b>Account Holder :</b></td>
    <td><%=rs.getString(1) %></td>
   </tr>
   <tr>
    <td><b>Account Balance :</b></td>
    <td><%=rs.getString(2) %></td>
   </tr>
<%}}catch(Exception e)
{
System.out.println(e);
}%>
</table>	
</body>
</html>