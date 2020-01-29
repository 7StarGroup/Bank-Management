<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ChequeBook</title>
</head>
<body>

<%@page import="com.bank.db.Connect"%>
<%@page import="java.sql.*"%>


<% Connection con=null;
ResultSet rs=null;
PreparedStatement stmt; 

con=Connect.connectDb();

HttpSession ssn=request.getSession(false);
int user_id=(int)ssn.getAttribute("user_id");
try
{
	stmt=con.prepareStatement("select chequebook from user where user_id=?");
	stmt.setInt(1,user_id);
	rs=stmt.executeQuery();
	
	if(rs.next())
	{
		int check=rs.getInt(1);
		if((check==0))
		{	
				
			stmt=con.prepareStatement("update user set chequebook=0 where user_id=?");
			stmt.setInt(1, user_id);
			int res=stmt.executeUpdate();
			System.out.println("checking res value "+res);
			if(res==1)
			{
				out.println("<script>");
				out.println("alert('Applied successfully for CHEQUEBOOK !!!');window.location = 'http://localhost:8080/Bank/HomeScreen.jsp';");
				out.println("</script>");
			}
		}
	}
}
catch(Exception e)
{
	e.printStackTrace();
}



%>

</body>
</html>