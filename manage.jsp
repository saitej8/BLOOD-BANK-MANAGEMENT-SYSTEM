
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Stock</title>
</head>
<style>
h2
{
color:red;}
table
{
height:400px;
width:400px;
}
th, td {
            text-align: center;
        }
</style>
<body> 

<%
    String msg = request.getParameter("msg");
    if ("invalid".equals(msg)) {
%>
    <center>
        <font color="red" size="7">
            Something went wrong, try again.
        </font>
    </center>
<%
    }
%>

<%
    if ("valid".equals(msg)) {
%>
    <center><font color="green" size="7">Successfully updated</font></center>
<%
    }
%>

<form action="managestock.jsp" method="post">
    <center><h2>Select a blood group</h2>
        <select name="bloodgroup">
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="A-">A-</option>
            <option value="A+">A+</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="AB-">AB-</option>
            <option value="AB+">AB+</option>
        </select>
    </center>

    <center><h2>Increase/Decrease</h2>
        <select name="incdec">
            <option value="inc">Increase</option>
            <option value="dec">Decrease</option>
        </select>
    </center>
    <br><br>
    <center>
        Units
        <input type="text" placeholder="Enter Units" name="units">
        <br><br>
        <button type="submit">Save</button>
    </center>
</form>

<br>
<center>
<table border="1" cellspacing="0">
    <tr>
        <th>Blood groups</th>
        <th>Units</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM manage");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
    </tr>
<%
        }
        rs.close();
        st.close();
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>

</table>
<a href="Main.html" style='color:red'>HOME</a>
</center>

</body>
</html>
