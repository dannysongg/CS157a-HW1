<%@ page import="java.sql.*"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection example</h1>
<%
    String db = "cs157a"; //or root
    String user = "root"; // assumes database name is the same as username
    try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?useTimezone=true&serverTimezone=UTC","root","root");
    out.println (db+ " database successfully opened.");
    Statement stmt = con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from classes");
    while(rs.next())
    {
%>
         <tr><td><br/><%=rs.getString(1)+" "+rs.getString(2) %></td></tr>
<%
    }
    con.close();
    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
}
%>
</body>
</html> 