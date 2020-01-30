<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Details</title>
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
<center><h2>Account Information</h2></center>

    
  <%@page import ="com.bank.db.Connect" %>
<%@page import="java.sql.*"%>  


<% 
Connection con=null;
ResultSet rs=null;
String email;
try
{

	
	con = Connect.connectDb();
	
	 
	
	int user_id=(int) session.getAttribute("user_id");

	String u_email="";
	String sql1="select email from user where user_id=?";
	PreparedStatement stmt=con.prepareStatement(sql1);
	stmt.setInt(1, user_id);
	rs=stmt.executeQuery();
	if(rs.next())
	{
		u_email=rs.getString(1);
	}
	
	String sql="select user_name,account_id,ifsc_code,account_type,branch_name,contact,email from user,account,branch,user_account where user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and account.branch_id_fk=branch.branch_id and user_id=?";
	
	stmt =con.prepareStatement(sql);
	stmt.setInt(1, user_id);
	rs=stmt.executeQuery();
	
	if(rs.next())
	{
		System.out.println("YEs");
	}
	else
	{
		System.out.println("NOO");
	}
	
}catch(Exception e)
{
System.out.println(e);
}
%>

<table>
<col width="200px">
<col width="200px">
  
  
  <tr>
    <td><b>Account Holder :</b></td>
    <td><%=rs.getString(1) %></td>
    </tr>
    
   
  </tr>
  <tr>
    <td><b>Account Number :</b></td>
    <td><%=rs.getInt(2) %></td>
   
   
  </tr>
  <tr>
    <td><b>IFSC Code :</b></td>
   <td><%=rs.getString(3) %></td>
    </tr>
    
    </tr>
  <tr>
    <td><b>Account Type :</b></td>
   <td><%=rs.getString(4) %></td>
    </tr>
    
    <tr>
    <td><b>Branch :</b></td>
   <td><%=rs.getString(5) %></td>
    </tr>
    
    <tr>
    <td><b>Contact No :</b></td>
   <td><%=rs.getString(6) %></td>
    </tr>
    
    <tr>
    <td><b>Email :</b></td>
   <td><%=rs.getString(7) %></td>
    </tr>
    
    
    
    </table>





</body>
</html>
