<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.servlet.jsp.JspException"%>
<%@ page import ="java.sql.Connection;"%>
<%@ page import ="java.sql.DriverManager;"%>
<%@ page import ="java.sql.ResultSet;"%>
<%@ page import ="java.sql.ResultSetMetaData;"%>
<%@ page import ="java.sql.SQLException;"%>
<%@ page import ="java.sql.Statement;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h2 align="center"><font color="#AAAAAA"><strong>Pupils table</strong></font></h2>
        <jsp:useBean id="mybean" scope="session" class="com.mycompany.schooldb.NameHandler"  />
        <jsp:setProperty name="mybean" property="name"  />
        <h1>pupils list for <jsp:getProperty name="mybean" property="name" />:</h1> 

        <table align="center" cellpadding="4" cellspacing="4">
            <tr bgcolor="#FFF056">
                <td>fullname</td>
                <td>classname</td>
                <td>mark</td>
                <td>studiesstarts</td>
                <td>studiesends</td>
            </tr>

            <%
                String connectionUrl = "jdbc:postgresql://localhost:5433/school";
                String userId = "postgres";
                String password = "0000";

                Connection connection = null;
                Statement statement = null;
                String str = "";
                Class.forName("org.postgresql.Driver");
                connection = DriverManager.getConnection(
                        connectionUrl, userId, password);
                statement = connection.createStatement();
                
                String classname = "5a";//=pageContext.getAttribute("classname"); 
                String sql = "SELECT * FROM pupil where className = '" + classname + "'";
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {

            %>
            <tr bgcolor="#DFE2DB">
                <td><%=resultSet.getString("fullname")%></a></td>
                <td><%=resultSet.getString("classname")%></td>
                <td><%=resultSet.getDouble("mark")%></td>
                <td><%=resultSet.getDate("studiesstarts")%></td>
                <td><%=resultSet.getDate("studiesends")%></td>
            </tr>
            <%}%>
    </body>
</html>
