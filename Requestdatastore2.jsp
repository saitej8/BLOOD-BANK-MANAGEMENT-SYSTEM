<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Requestdatastores3 jdbc</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String mobilenumber=request.getParameter("mobilenumber");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String status="pending";
Class.forName("com.mysql.cj.jdbc.Driver"); //step-1
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","tiger"); //step-2
Statement st=con.createStatement(); //step-3
PreparedStatement ps=con.prepareStatement("insert into request1 values(?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,mobilenumber);
ps.setString(3,email);
ps.setString(4,bloodgroup);
ps.setString(5,status);
ps.executeUpdate();
response.sendRedirect("Request.jsp?msg=valid");
%>
</body>
</html>
