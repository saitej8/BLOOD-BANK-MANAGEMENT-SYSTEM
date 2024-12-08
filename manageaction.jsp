 <%@page import="java.sql.*" %>
        <%
        String bloodgroup=request.getParameter("bloodgroup");
        String incdec=request.getParameter("incdec");
        String units=request.getParameter("units");
        int units1=Integer.parseInt(units);
        try
        {
        	
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbms","root","tiger"); //step-2

        Statement st=con.createStatement();
        if(incdec.equals("inc"))
        	st.executeUpdate("update manage set units=units+'"+units1+"' where bloodgroup='"+bloodgroup+"'");
        else
        	st.executeUpdate("update manage set units=units-'"+units1+"' where bloodgroup='"+bloodgroup+"'");
         response.sendRedirect("manage.jsp?msg.valid");
        }
        catch(Exception e)
        {
            response.sendRedirect("manage.jsp?msg.invalid");
        }
        %>
        
