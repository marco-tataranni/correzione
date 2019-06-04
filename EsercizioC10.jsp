<%-- tataranni marco--%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>EsercizioC10</title>
</head>
<body>
    <form>
     <%
        String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=tataranni.marco;password=xxx123#";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection connection = DriverManager.getConnection(connectionUrl);
        Statement st = connection.createStatement();
        String sql = "SELECT distinct citta FROM Appartamento order by citta; ";

    
    	ResultSet rs = st.executeQuery(sql); 	
		
		
		while (rs.next())
		{
	      
	       out.print("<input type=radio name=citta value="+rs.getString("citta")+" >"+rs.getString("citta")+"<br>");
		}
		
		 rs.close();
	        
	     connection.close();
    %>
    </form>
</body>
</html>