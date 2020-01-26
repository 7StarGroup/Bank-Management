<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passbook</title>
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
  margin-left: 25%;
}

td, th {
     border: 0px solid #dddddd;
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
  <form action="#">
  <div class="row">
    <div class="col-25">
      <label for="From"><b>From :</b></label>
    </div>
    <div class="col-75">
      <input type="date" name="from" placeholder="From" required>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="To"><b>To :</b></label>
    </div>
    <div class="col-75">
      <input type="date"  name="to" placeholder="to" required>
    </div>
  </div>

  <div class="row">
    <input type="submit" value="GO">													
  </div>
  </form>
  
  

<table>
<col width="200px">
<col width="200px">
  <tr>
  	<th>Transaction</th>
  	<th>Amount</th>
  </tr>	
  
  
  
  <!-- HERE YOU NEED TO ADD FOR LOOP TO CREATE THIS TABLE I HAVE CREATED JUST FROM SAMPLE PURPOSE -->
  <tr>
    <td>Dipak Desai :</td>
    <td>1000 RS</td>
   
  </tr>
  <tr>
    <td>Akshay Kamble :</td>
    <td>300 Rs</td>
   
  </tr>
  <tr>
    <td>Niraga Misal :</td>
    <td>65 Rs</td>
  
  </tr>
 
  
</table>
  
</div>
</body>
</html>