<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request Blood2</title>

<style>
table {
  border-collapse: collapse;
  margin: 20px auto;
}
h1 {
  color: red;
  margin-top: 2rem;
}
input, select {
  border-radius: 10px;
  margin-bottom: 20px;
  margin-left: 10px;
  width: 400px;
  height: 30px;
  font-size: 20px;
  color: blue;
  padding-left: 10px;
}

label {
  font-size: 18px;
  margin-right: 10px;
  width: 150px;
  display: inline-block;
  text-align: left;
}

#submit {
  margin-left: -20px;
  border-color: green;
  border-radius: 10px;
  width: 120px;
  height: 40px;
  background-color: green;
  color: white;
  font-size: 18px;
  cursor: pointer;
}
#submit:hover {
  background-color: darkgreen;
  border: 1px solid white;
  color: white;
}

#reset {
  border-radius: 10px;
  margin-right: 10px;
  border-color: red;
  width: 120px;
  height: 40px;
  background-color: red;
  color: white;
  font-size: 18px;
  cursor: pointer;
}

#reset:hover {
  background-color: darkred;
  border: 1px solid white;
  color: white;
}

#logo {
  height: 70px;
  width: 70px;
  background-image: url("Logo1.png");
  background-size: cover;
  margin-left: 40px;
}

.center-form {
  text-align: center;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.message {
  color: red;
  font-size: 20px;
}
</style>
</head>

<body>
<% 
String msg = request.getParameter("msg");
if ("valid".equals(msg)) {
%>
<center><div class="message">Form Submitted Successfully. You will get notified within 24 hours.</div></center>
<% 
} 
if ("invalid".equals(msg)) {
%>
<center><div class="message">Invalid Data! Try Again.</div></center>
<%
}
%>

<center class="center-form">
  <h1>Enter Your Details To Request For Blood</h1>
  <form action="Requestdatastores2.jsp" method="post">
    <table>
      <tr>
        <td><label for="name">Name:</label></td>
        <td><input type="text" id="name" name="name" placeholder="Enter Name" required autofocus></td>
      </tr>
      <tr>
        <td><label for="mobilenumber">Mobile:</label></td>
        <td><input type="text" id="mobilenumber" name="mobilenumber" placeholder="Enter Mobile" required autofocus></td>
      </tr>
      <tr>
        <td><label for="email">Email:</label></td>
        <td><input type="email" id="email" name="email" placeholder="Enter Email" required autofocus></td>
      </tr>
      <tr>
        <td><label for="bloodgroup">Blood Group:</label></td>
        <td>
          <select id="bloodgroup" name="bloodgroup" required>
            <option value="" disabled selected>Select Blood Group</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
          </select>
        </td>
      </tr>
      <tr>
        <td><label for="address">Address:</label></td>
        <td><input type="text" id="address" name="address" placeholder="Enter Address" required autofocus></td>
      </tr>
    </table>
    <button id="submit" type="submit">Submit</button>
    <button id="reset" type="reset">Reset</button>
  </form>
</center>

<!-- Link to go back to the homepage -->
<center>
    <a href="Main.html" style="text-decoration: none; font-size: 18px; color: green; font-weight: bold;">Back to Homepage</a>
</center>

</body>
</html>
