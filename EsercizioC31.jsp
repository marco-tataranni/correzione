<%-- tataranni marco--%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=tataranni.marco;password=xxx123#";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection connection = DriverManager.getConnection(connectionUrl);
       
        String sql = "SELECT * FROM Affitto where IDAppartamento=? and(( dataCheckIn<=?) and (dataCheckOut>=?)) ";
		PreparedStatement st = connection.prepareStatement(sql);
    	st.setString(1, request.getParameter("appartamenti"));
    	st.setString(2, request.getParameter("datap"));
    	st.setString(3, request.getParameter("dataa"));
    	ResultSet rs = st.executeQuery(); 	
		
		
		if (rs.next())
		{
		    
		   out.print("l'appartamento è occupato");
    	}else
		{
		    out.print("l'appartamento è libero");
		}
		
		 rs.close();
	        
	     connection.close();
    %>

</body>
</html>