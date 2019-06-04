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
     <form method="post" action="/EsercizioC31.jsp">
    <%
        String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=tataranni.marco;password=xxx123#";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection connection = DriverManager.getConnection(connectionUrl);
       
        String sql = "SELECT * FROM Appartamento where citta=? order by prezzoPerNotte DESC; ";
		PreparedStatement st = connection.prepareStatement(sql);
    	st.setString(1, request.getParameter("citta"));
    
    	ResultSet rs = st.executeQuery(); 	
		
	      out.print("<select name=appartamenti>");
	     while (rs.next())
		{
		   out.print("<option value="+rs.getInt("ID")+"> "+rs.getString("nome")+" "+rs.getDouble("prezzoPerNotte")+"€</option>");
		}
		out.print("</select>");
		out.print("Data arrivo");
		out.print("<input type=date name=dataa><br>");
		out.print("Data partenza");
		out.print("<input type=date name=datap><br>");
		
		 rs.close();
	        
	     connection.close();
    %>
     <input type="submit" value="Submit">
    </form>

</body>
</html>