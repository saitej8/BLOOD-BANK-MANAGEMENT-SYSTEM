<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display Table CRUD Operation</title>
</head>
<body>

<%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
%>
        <center><font color="red" size="5">Successfully updated</font></center>
<%
    } else if ("invalid".equals(msg)) {
%>
        <center><font color="red" size="5">Something Went Wrong, Try Again!</font></center>
<%
    } else if ("deleted".equals(msg)) {
%>
        <center><font color="red" size="5">Deleted Successfully!!</font></center>
<%
    }
%>

<h1 style="text-align: center; color: red;">Details of Blood Donors</h1>

<table border="1" align="center" cellpadding="5" cellspacing="0" width="80%">
    <tr align="center">
        <th>ID</th>
        <th>Name</th>
        <th>Father Name</th>
        <th>Mother Name</th>
        <th>Mobile Number</th>
        <th>Gender</th>
        <th>Email</th>
        <th>Blood Group</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");

        st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM donor");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td><%= rs.getString(6) %></td>
        <td><%= rs.getString(7) %></td>
        <td><%= rs.getString(8) %></td>
        <td><%= rs.getString(9) %></td>
        <td><a href="updatedonor.jsp?id=<%= rs.getString(1) %>">Edit</a></td>
        <td><a href="deletedonor.jsp?id=<%= rs.getString(1) %>">Delete</a></td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</table>

<!-- Link to go back to the homepage -->
<center>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
    <a href="Main.html" style="text-decoration: none; font-size: 18px; color: green; font-weight: bold;">Back to Homepage</a>
</center>

</body>
</html>
