<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Request</title>
</head>
<body>
<center>
<%@ page import="java.sql.*" %>

<%
    // Step 1: Get the mobile number (or any unique field) from the request
    String mobilenumber = request.getParameter("mobilenumber");
    
    if (mobilenumber != null && !mobilenumber.isEmpty()) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        
        try {
            // Step 2: Load the JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");
            
            // Step 3: Query to get the current data for the given mobilenumber
            String query = "SELECT * FROM request1 WHERE mobilenumber = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, mobilenumber);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                // Step 4: Retrieve the data and display it in a form
                String name = rs.getString("name");
                String email = rs.getString("email");
                String bloodgroup = rs.getString("bloodgroup");
                String status = rs.getString("status");
%>
        <form action="updateRequestAction.jsp" method="post">
            <input type="hidden" name="mobilenumber" value="<%= mobilenumber %>">

            <label>Name:</label>
            <input type="text" name="name" value="<%= name %>" required><br><br>

            <label>Email:</label>
            <input type="email" name="email" value="<%= email %>" required><br><br>

            <label>Blood Group:</label>
            <select name="bloodgroup" required>
                <option value="O+" <%= bloodgroup.equals("O+") ? "selected" : "" %>>O+</option>
                <option value="O-" <%= bloodgroup.equals("O-") ? "selected" : "" %>>O-</option>
                <option value="A+" <%= bloodgroup.equals("A+") ? "selected" : "" %>>A+</option>
                <option value="A-" <%= bloodgroup.equals("A-") ? "selected" : "" %>>A-</option>
                <option value="B+" <%= bloodgroup.equals("B+") ? "selected" : "" %>>B+</option>
                <option value="B-" <%= bloodgroup.equals("B-") ? "selected" : "" %>>B-</option>
                <option value="AB+" <%= bloodgroup.equals("AB+") ? "selected" : "" %>>AB+</option>
                <option value="AB-" <%= bloodgroup.equals("AB-") ? "selected" : "" %>>AB-</option>
            </select><br><br>

            <label>Status:</label>
            <input type="text" name="status" value="<%= status %>" required><br><br>

            <button type="submit">Update</button>
        </form>
<%
            } else {
                out.println("No record found with this mobilenumber.");
            }
            
            // Close resources
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("Mobilenumber is required.");
    }
%>
</center>
</body>
</html>
