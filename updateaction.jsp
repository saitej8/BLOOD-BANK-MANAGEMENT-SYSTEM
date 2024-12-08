<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String gender=request.getParameter("gender");
    String email = request.getParameter("email");
    String bloodgroup=request.getParameter("bloodgroup");
    String address = request.getParameter("address");
    System.out.println("hello");
    // Debugging: print parameters to ensure they are received correctly
    System.out.println("ID: " + id);
    System.out.println("Name: " + name);
    System.out.println("Father: " + father);
    System.out.println("Mother: " + mother);
    System.out.println("Mobile: " + mobilenumber);
    System.out.println("Email: " + email);
    System.out.println("Address: " + address);

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish a connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");

        // Update query
        String query = "UPDATE donor SET name=?, fathername=?, mothername=?, mobilenumber=?,gender=?, email=?,bloodgroup=?, address=? WHERE id=?";
        PreparedStatement ps = con.prepareStatement(query);

        // Set parameters for the query
        ps.setString(1, name);
        ps.setString(2, father);
        ps.setString(3, mother);
        ps.setString(4, mobilenumber);
        ps.setString(5,gender);
        ps.setString(6, email);
        ps.setString(7,bloodgroup);
        ps.setString(8, address);
        ps.setString(9, id);

        // Execute the update query
        int rowsAffected = ps.executeUpdate();

        // Debugging: print rows affected
        System.out.println("Rows affected: " + rowsAffected);

        // Close the connection
        con.close();

        // Redirect to a success or failure page based on the result
        if (rowsAffected > 0) {
            response.sendRedirect("editdelete.jsp?msg=valid");
        } else {
            response.sendRedirect("editdelete.jsp?msg=invalid");
        }
    } catch(Exception e) {
        // Redirect to failure page in case of error and print error details
        response.sendRedirect("editdelete.jsp?msg=invalid");
        out.println("Error: " + e);
    }
%>
