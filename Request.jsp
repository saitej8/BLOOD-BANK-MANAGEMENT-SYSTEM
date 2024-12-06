
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reuest Blood2</title>

<style>
table {
  border-collapse: collapse;
}
h2
{
margin-top:2rem;
}
input
{
border-radius:10px;
margin-bottom:20px;
margin-left:10px;
width:400px
height:30px;
font-size:20px;
color:blue;c
}
#submit
{
margin-left:-20px;
border-color:green;
border-radius:10px;
width:100px;
}
#reset
{
border-radius:10px;
margin-right:10px;
border-color:red;
width:100px;
}
#submit:hover
{
    border: 1px solid white;
   background-color:green;
    
    cursor:pointer;
    color:white;
}
#reset:hover
{
    border: 1px solid white;
   background-color:red;
    
    cursor:pointer;
    color:white;
}
.home
{
margin-bottom:10px;
}
.logout:hover
{
     border: 1px solid green;

    background:red;
    cursor:pointer;
   
}
.home:hover
{
    border: 1px solid red;
   background:red;
    
    cursor:pointer;
    color:white;
}
#logo
{
    height: 70px;
    width: 70px;
        background-image: url("Logo1.png");
    background-size: cover;
  margin-left:40px;
   
}

</style>
</head>

<body>
<br>
<%

String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="red" size="5">Form Submited SuccessFully.You will get notified within 24 hours</center>
<%
}

%>
<%
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5">Invalid Data! Try Again</center>
<%
}

%>
</font>

<div class="a">
<div id="logo"></div>
   <a class="logout" style="margin-left:1100px"><button>Logout</button></a>
<a class="home" href="home.html" style="float:right"><button>Home</button></a>

&nbsp

</div>
<center>
 <form action="Requestdatastores2.jsp" method="post">
<h1 style="color:red">Enter Your Details To Request For Blood</h1>
<table>
<tr>

<td><input type="text" name="name" placeholder="Enter Name" required autofocus"></td>
</tr>
<tr>
<td><input type="text" name="mobilenumber" placeholder="Enter Mobile" required autofocus"></td>
</tr>
<tr>
<td><input type="email" name="email" placeholder="Enter Email" required autofocus"></td>
</tr>
<tr>
<td><input type="text" name="bloodgroup" placeholder="Enter Bloodgroup" required autofocus"></td>
</tr>

</table>
<tr>

<button id="submit" type="submit" >Submit</button>
&nbsp
&nbsp
&nbsp
&nbsp
<button  id="reset" type="reset">Reset</button>
</tr>
</form>
</center>
</body>
</html>
