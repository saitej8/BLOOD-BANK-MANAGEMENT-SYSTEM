<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
        <h1 style="color:red"><center>Details of Requested For Blood</center></h1>
        <center>
        <table border="1" cellspacing="0">
        
        <tr>
        <td>Name</td>
         <td>Mobile Number</td>
          <td>Email</td>
           <td>Blood Group</td>
                      <td>Edit</td>
                                 <td>Delete</td>
        </tr>
         <%

    try
    {
Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","tiger"); //step-2
    Statement st=con.createStatement();
 ResultSet rs=st.executeQuery("select * from request1 where status='pending'");
  while(rs.next())
  {
	  %>
	 <tr >
<th><%=rs.getString(1) %></th>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><a href="updaterequested.jsp?mobilenumber=<%=rs.getString(2)%>">Edit</a></td>
<td><a href="deleterequested.jsp?mobilenumber=<%=rs.getString(2)%>">Delete</a></td> 
</tr>
 
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}%>
 </table></center>
     
