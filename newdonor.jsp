<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>New Donor (5)</title>
    <style>
        /* Green color for submit button */
        button[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            margin: 10px 1%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        /* Dark blue color for reset button */
        button[type="reset"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            margin: 15px 1%;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        /* Button hover effects */
        button[type="submit"]:hover {
            background-color: #218838;
        }

        button[type="reset"]:hover {
            background-color: #0056b3;
        }

        /* Styling for the home link */
        .home-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }

        .home-link:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <center>
        <% 
        String msg = request.getParameter("msg");
        if ("valid".equals(msg)) {
        %>
            <center><font color="red" size="5">Successfully updated</font></center>
        <%
        } else if ("invalid".equals(msg)) {
        %>
            <center><font color="red" size="5">Try Again</font></center>
        <% 
        }
        %>

        <h1 style="color:red">ADD DONOR DETAILS</h1>

        <form action="donordatastore.jsp" method="post">
            Donor ID: <input type="text" placeholder="Enter Id" autofocus required name="id"><br><br>
            Name: <input type="text" placeholder="Enter Name" autofocus required name="name"><br><br>
            Father: <input type="text" placeholder="Enter Father Name" autofocus required name="father"><br><br>
            Mother: <input type="text" autofocus required placeholder="Enter Mother Name" name="mother"><br><br>
            Mobile Number: <input type="number" autofocus required placeholder="Enter Mobile Number" name="mobilenumber"><br><br>
            Gender: 
            <select name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="others">Others</option>
            </select><br><br>

            Email: <input type="email" placeholder="Enter Email" name="email"><br><br>
            Blood Group: 
            <select name="bloodgroup">
                <option value="A+">A+</option>
                <option value="A">A</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select><br><br>
            Address: <input type="text" name="address" placeholder="Enter the address"><br><br>
            
            <button type="submit">Submit</button>
            <button type="reset">Reset</button>
        </form>

        <!-- Link to Home page -->
        <a href="Main.html" class="home-link">Go to Home Page</a>

        <% 
        // Database connection and retrieval of donor details
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Step 1
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger"); // Step 2
            Statement st = con.createStatement(); // Step 3
            ResultSet rs = st.executeQuery("SELECT * FROM donor"); // Fetch all donor data

            // Process the result set if necessary
            while (rs.next()) {
                // Example: System.out.println(rs.getString("name")); // Or other operations
            }

            // Close resources
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            // Handle the exception properly
            e.printStackTrace();
            out.println("<center><font color='red' size='5'>Error: " + e.getMessage() + "</font></center>");
        }
        %>
    </center>
</body>
</html>
