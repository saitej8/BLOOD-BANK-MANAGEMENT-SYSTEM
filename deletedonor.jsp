<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    <%

String id=request.getParameter("id");
    try
    {
Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","tiger"); //step-2
    Statement st=con.createStatement();
  st.executeUpdate("delete from donor where id='"+id+"'");
    response.sendRedirect("editdelete.jsp?msg=deleted");
    }
    catch(Exception e)
    {
    	response.sendRedirect("editdelete.jsp?msg=invalid");
    }
    
%>
