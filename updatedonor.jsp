<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update/Delete</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 20px;
        }
        .form-container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .form-row h4 {
            font-size: 18px;
            margin-right: 20px;
            width: 25%;
        }
        .form-row input, .form-row select {
            width: 70%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 120px;
            padding: 12px;
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        h2 {
            color: red;
        }
        .home-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .home-link a {
            font-size: 18px;
            color: #4CAF50;
            text-decoration: none;
            padding: 10px 20px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
        }
        .home-link a:hover {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>

<body>
    <form action="updateaction.jsp" method="post" class="form-container">
        <br>
        <br>
        <h2>Update/Edit Details of Donor</h2>
        <br>
        <br>
        <%
            String id = request.getParameter("id");
            try {
                // Use a prepared statement to avoid SQL injection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms", "root", "tiger");

                String query = "SELECT * FROM donor WHERE id=?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
        %>
        <input type="hidden" name="id" value="<%= id %>">

        <div class="form-row">
            <h4>Name</h4>
            <input type="text" value="<%= rs.getString(2) %>" name="name">
        </div>

        <div class="form-row">
            <h4>Father Name</h4>
            <input type="text" value="<%= rs.getString(3) %>" name="father">
        </div>

        <div class="form-row">
            <h4>Mother Name</h4>
            <input type="text" value="<%= rs.getString(4) %>" name="mother">
        </div>

        <div class="form-row">
            <h4>Mobile Number</h4>
            <input type="number" value="<%= rs.getString(5) %>" name="mobilenumber">
        </div>

        <div class="form-row">
            <h4>Gender</h4>
            <select name="gender">
                <option value="Male" <%= rs.getString(6).equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= rs.getString(6).equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= rs.getString(6).equals("Other") ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <div class="form-row">
            <h4>Email</h4>
            <input type="email" value="<%= rs.getString(7) %>" name="email">
        </div>

        <div class="form-row">
            <h4>Blood Group</h4>
            <select name="bloodgroup">
                <option value="A+" <%= rs.getString(8).equals("A+") ? "selected" : "" %>>A+</option>
                <option value="A-" <%= rs.getString(8).equals("A-") ? "selected" : "" %>>A-</option>
                <option value="B+" <%= rs.getString(8).equals("B+") ? "selected" : "" %>>B+</option>
                <option value="B-" <%= rs.getString(8).equals("B-") ? "selected" : "" %>>B-</option>
                <option value="O+" <%= rs.getString(8).equals("O+") ? "selected" : "" %>>O+</option>
                <option value="O-" <%= rs.getString(8).equals("O-") ? "selected" : "" %>>O-</option>
                <option value="AB+" <%= rs.getString(8).equals("AB+") ? "selected" : "" %>>AB+</option>
                <option value="AB-" <%= rs.getString(8).equals("AB-") ? "selected" : "" %>>AB-</option>
            </select>
        </div>

        <div class="form-row">
            <h4>Address</h4>
            <input type="text" value="<%= rs.getString(9) %>" name="address">
        </div>

        <center>
            <button type="submit">Save</button>
        </center>
        &nbsp

        <div class="home-link">
            <a href="Main.html">Go to Home Page</a>
        </div>
        <%
                }
                // Close resources
                rs.close();
                pst.close();
                con.close();
            } catch (Exception e) {
                System.out.println(e);
                out.println(e);
            }
        %>
    </form>
</body>
</html>
