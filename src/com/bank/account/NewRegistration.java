package com.bank.account;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bank.db.Connect;


@WebServlet("/NewRegistration")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
       
   
    public NewRegistration() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ResultSet rs1 = null,rs2 = null;
		response.setContentType("html");
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String mob=request.getParameter("mobile");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String aadhar=request.getParameter("aadharnumber");
		
		String pan=request.getParameter("pannumber");
		
		String Type=request.getParameter("Type");
		 Part part = request.getPart("Adocument");
	        String fileName = extractFileName(part);//file name
	       
	        String savePath="G:\\Bank Management\\Bank(Git)\\bank\\WebContent\\Images" + File.separator + fileName;
	           
	     
	        File fileSaveDir = new File(savePath);
	          part.write(savePath + File.separator);
	        
	        
	          Part part1 = request.getPart("Pdocument");
		        String fileName1 = extractFileName(part1);//file name
		       
		        String savePath1="" + File.separator + fileName1;
		           
		     
		        File fileSaveDir1 = new File(savePath1);
		          part1.write(savePath1 + File.separator);
		          
		
		
		
		
		
		try {
			con = Connect.connectDb();
		PreparedStatement stmt = con.prepareStatement("insert into user (user_name,email,password,address,contact,role,aadhar_url,aadhar_no,pan_url,pan_no)values(?,?,?,?,?,?,?,?,?,?)");	
			
	
			stmt.setString(1,name);
			stmt.setString(2,email);
			stmt.setString(3,password);
			stmt.setString(4,address);
			stmt.setString(5,mob);
			stmt.setString(6,"Customer");
			stmt.setString(7,savePath);
			stmt.setString(8,aadhar);
			stmt.setString(9,savePath1);
			stmt.setString(10,pan);
			
			stmt.executeUpdate();
			
			
			
			PreparedStatement stmt2 = con.prepareStatement("insert into account (account_type,min_balance,branch_id_fk) values(?,1500,101)");
			
			stmt2.setString(1,Type);
			
			stmt2.executeUpdate();
			
			
			Statement st=con.createStatement();
			Statement st1=con.createStatement();
			 rs1=st.executeQuery("select max(user_id) from user");
			 rs2=st1.executeQuery("select max(account_id) from account");
			
			while((rs1.next())&&(rs2.next()))
			{
				int a= rs1.getInt(1);
				int b=rs2.getInt(1);
				PreparedStatement stmt3=con.prepareStatement(" insert into user_account(user_id_fk,account_id_fk,is_active,avail_bal,is_deleted) values(?,?,0,1500,0)");
				stmt3.setInt(1,a);
				stmt3.setInt(2,b);
				
				stmt3.executeUpdate();
				
				
				
				
			}
			
			
			

			rs1.close();
			rs2.close();
			
	
			
			
			
		
	}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
	}
	
	
	 private String extractFileName(Part part) {//This method will print the file name.
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length() - 1);
	            }
	        }
	        return "";
	    }
		
		
	}





