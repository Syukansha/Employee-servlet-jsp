<%-- 
    Document   : empForm
    Created on : Jun 26, 2021, 1:38:18 AM
    Author     : KANSHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/emp" user="app"
password="app"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add New Employee</h1>
        <form action="emp.controller" method="POST">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" value=""/></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><input type="text" name="salary" value=""/></td>
                </tr>
                <tr>
                    <td>Designation:</td>
                    <td><input type="text" name="designation" value=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Save"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
