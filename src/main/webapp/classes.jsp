<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.servlet.jsp.JspException"%>
<%@ page import ="java.sql.Connection;"%>
<%@ page import ="java.sql.DriverManager;"%>
<%@ page import ="java.sql.ResultSet;"%>
<%@ page import ="java.sql.ResultSetMetaData;"%>
<%@ page import ="java.sql.SQLException;"%>
<%@ page import ="java.sql.Statement;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classes</title>
    </head>

    <body>
        <h1>classes list:</h1>
        <h2 align="center"><font color="#AAAAAA"><strong>Table</strong></font></h2>
        <table align="center" cellpadding="4" cellspacing="4">
            <tr bgcolor="#FFF056">
                <td>classname</td>
                <td>classleader</td>
                <td>average</td>
                <td>pupilscount</td>
            </tr>

            <%
                String connectionUrl = "jdbc:postgresql://localhost:5433/";
                String dbName = "school";
                String userId = "postgres";
                String password = "0000";

                Connection connection = null;
                Statement statement = null;
                connection = DriverManager.getConnection(
                        connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM class";
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    String className = resultSet.getString("classname");
            %>
            <tr bgcolor="#DFE2DB">
                        

                <td>
                    
                    <form name="Classname Input Form" action="pupilslist.jsp">
            <input type="submit" value=<%=className%> />
                        
                </td>
                <td><%=resultSet.getString("classleader")%></td>
                <td><%=resultSet.getDouble("average")%></td>
                <td><%=resultSet.getInt("pupilscount")%></td>
            </tr>
            <%}%>
        <form name="Name Input Form" action="pupilslist.jsp">
            Enter classname
            <input type="text" name="name" />
            <input type="submit" value="OK" />
        </form>
        

    </body>
</html>
