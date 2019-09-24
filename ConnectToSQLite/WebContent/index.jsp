<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection"%>
    <%@ page import="java.sql.Statement"%>
    <%@ page import="java.sql.ResultSet"%>
    <%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	 Connection con = null; 
	 Statement stmt = null;
	 ResultSet rs = null;
	 String query = "SELECT * from telebeMelumat"; 
	 
	 try{             
         Class.forName("org.sqlite.JDBC");
         con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\PUNHAN\\Desktop\\telebeler.db");
         stmt = con.createStatement(); 
         stmt.execute(query);
         rs = stmt.getResultSet();	   
	%>
	<table border="1">
		<thead>
			<td>Id</td>
			<td>Name</td>
			<td>Surnam</td>			
		</thead>
		<tbody>
		<%
          while(rs.next()){  
               %>  
			<tr>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("surname")%></td>
			</tr>
		</tbody>	
</body>
</html>
		<%                               
          }    
		
       } catch (Exception e) {
             System.out.println(e);         
       } finally {
           	con.close();
           	stmt.close();
           	rs.close();
   } 
        %>