package com.bank.account;

import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.db.Connect;


@WebServlet("/TransferMoney")
public class TransferMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		String account_number=request.getParameter("account_number");
		String ifsc=request.getParameter("ifsc");
		String FullName=request.getParameter("FullName");
		int Amount=Integer.parseInt(request.getParameter("Amount"));
		try
		{
			
			System.out.println("Screen called");
			Class.forName("com.mysql.jdbc.Driver");
			 con=Connect.connectDb();
			if(con==null)
			{
				System.out.println("Database Not Connected");
			}
			else
			{
				System.out.println("DB Connected");
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
				
			
		 HttpSession session=request.getSession(false);  
	        int UEmail=(int)session.getAttribute("user_id");
	        
	        
	        boolean bIfsc=ChkIfsc(account_number,ifsc);
	        
	        if(bIfsc==false)
	        {
	        	out.println("<script>");
				out.println("alert('Ifsc Does Not Match');window.location = 'http://localhost:8080/Bank/MoneyTransfer.jsp';");
				out.println("</script>");
	        }
	        
	        String bName=ChkName(account_number,FullName);
	        
	        if(bName==null)
	        {
	        	out.println("<script>");
				out.println("alert('Name Does Not Match');window.location = 'http://localhost:8080/Bank/MoneyTransfer.jsp';");
				out.println("</script>");
	        }
	        
	        
	        String bAcc=ChkBal(UEmail,Amount);
	        
	        if(bAcc==null)
	        {
	        	out.println("<script>");
				out.println("alert('Insufficent Funds');window.location = 'http://localhost:8080/Bank/MoneyTransfer.jsp';");
				out.println("</script>");
	        }
	        
	        if((bIfsc==true)&&(bName!=null)&&(bAcc!=null))
	        {
	        	
	        	try
	    		{
	    		PreparedStatement ps;
	    		ps=con.prepareStatement("update user_account set avail_bal=avail_bal+? where account_id_fk=?");
	    		ps.setInt(1, Amount);
	    		ps.setString(2,account_number);
	    		ps.executeUpdate();
	    		
	    		PreparedStatement ps1;
	    		ps1=con.prepareStatement("update user_account set avail_bal=avail_bal-? where user_id_fk=?");
	    		ps1.setInt(1, Amount);
	    		ps1.setString(2,bAcc);
	    		ps1.executeUpdate();
	    		
	    		//getting date for saving date in transaction table
	    		SimpleDateFormat frmt=new SimpleDateFormat("dd/MM/yyyy");
	    		Date date=new Date();
	    		String current_date= frmt.format(date);
	    		
	    		PreparedStatement ps2;
	    		ps2=con.prepareStatement("insert into transactions(tran_type,user_id_fk,transac_date,amount)values(?,?,current_date(),?)");
	    		ps2.setString(1,"DEBIT");
	    		ps2.setString(2,bAcc);
	    	//	ps2.setString(3, current_date);
	    		ps2.setInt(3,Amount);
	    		ps2.executeUpdate();
	    		
	    		PreparedStatement ps3;
	    		ps3=con.prepareStatement("insert into transactions(tran_type,user_id_fk,transac_date,amount)values(?,?,current_date(),?)");
	    		ps3.setString(1,"CREDIT");
	    		ps3.setString(2,bName);
	    		//ps3.setString(3, current_date);
	    		ps3.setInt(3,Amount);
	    		ps3.executeUpdate();
	    		
	    		
	    		out.println("<script>");
				out.println("alert('Transaction successful');");
				out.println("window.parent.location.reload();");
				out.println("</script>");
	    		
			
	    		}
	    		
	    		
	    		catch(Exception e)
	    	{
	    		System.out.println(e+"in transation");
	    	}
	        }
	}
	        	
	        	
	        	

	private String ChkBal(int UEmail, int amount) {
	
		try
		{
		PreparedStatement ps;
		ps=con.prepareStatement("select * from user,account,user_account where user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and user_id=?");
		ps.setInt(1,UEmail);
		
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			int bal=Integer.parseInt(rs.getString("avail_bal"));
			
			if(bal>=amount)
			{
				return rs.getInt("user_id")+"";
			}
			
			
				
		}
		
		}
		catch(Exception e)
	{
		System.out.println(e+"in bal check");
	}
		
		return null;
		
	}


	private String ChkName(String account_number, String fullName) {
		
		try
		{
		PreparedStatement ps;
		ps=con.prepareStatement(" select * from user,account,user_account where user.user_id=user_account.user_id_fk and account.account_id=user_account.account_id_fk and account_id=? and user_name=?");
		ps.setString(1,account_number);
		ps.setString(2,fullName);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			
				return rs.getInt("user_id")+"";
		}
		
		}
		catch(Exception e)
	{
		System.out.println(e+"in name check");
	}
		
		return null;
		
	}
	


	private boolean ChkIfsc(String account_number, String ifsc) 
	{
		try
		{
		PreparedStatement ps;
		ps=con.prepareStatement("select * from branch,account where branch.branch_id=account.branch_id_fk and account_id=? and ifsc_code=?");
		ps.setString(1,account_number);
		ps.setString(2,ifsc);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			
				return true;
		}
		
		}
		catch(Exception e)
	{
		System.out.println(e+"in ifsc check");
	}
		
		return false;
		
	}

}
