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


@WebServlet("/AdminReg")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class AdminReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
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
	       
	        String savePath="F:\\Project Exam\\To send\\bank\\WebContent\\Images" + File.separator + fileName;
	           
	     
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
			stmt.setString(6,"Admin");
			stmt.setString(7,savePath);
			stmt.setString(8,aadhar);
			stmt.setString(9,savePath1);
			stmt.setString(10,pan);
			
			int i=stmt.executeUpdate();
			if(i!=0)
				
			{
				out.println("<script>");
				out.println("alert('Admin registered succesfully')");
				out.println("window.parent.location.reload();");
				out.println("</script>");
			}
				
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


	public static void main(String[] args) {
		
	}
		
		
	}

