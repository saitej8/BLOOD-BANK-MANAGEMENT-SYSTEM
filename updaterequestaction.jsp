<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Request</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
    // Step 1: Get the mobilenumber of the request to be deleted
    String mobilenumber = request.getParameter("mobilenumber");

    if (mobilenumber != null && !mobilenumber.isEmpty()) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Step 2: Load the JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");
            
            // Step 3: SQL query to delete the request with the given mobilenumber
            String query = "DELETE FROM request1 WHERE mobilenumber = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, mobilenumber);
            
            // Step 4: Execute the delete query
            int rowsDeleted = ps.executeUpdate();
            
            // Step 5: Redirect to Request.jsp with a status message
            if (rowsDeleted > 0) {
            	out.println("Deleted Successfully");
                response.sendRedirect("Request.jsp?msg=deleted");
            } else {
                response.sendRedirect("Request.jsp?msg=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Request.jsp?msg=error");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        response.sendRedirect("Request.jsp?msg=invalid");
    }
%>

</body>
</html>
