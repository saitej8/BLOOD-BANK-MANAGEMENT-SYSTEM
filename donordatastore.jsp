<%@ page import="java.sql.*" %>



<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); //step-1
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","tiger"); //step-2

Statement st=con.createStatement(); //step-3
PreparedStatement ps=con.prepareStatement("insert into donor values(?,?,?,?,?,?,?,?,?)");
                                                                  //1,2,3,4,5,6,7,8,9
	
String id=request.getParameter("id");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String mobilenumber=request.getParameter("mobilenumber");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String address=request.getParameter("address");

ps.setString(1,id);
ps.setString(2,name);
ps.setString(3,father);
ps.setString(4,mother);
ps.setString(5,mobilenumber);
ps.setString(6,gender);
ps.setString(7,email);
ps.setString(8,bloodgroup);
ps.setString(9,address);
ps.executeUpdate();
con.close();
response.sendRedirect("newdonor.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("newdonor.jsp?msg=invalid");
}

%>
