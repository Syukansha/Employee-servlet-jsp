<%-- 
    Document   : viewemp
    Created on : Jun 27, 2021, 3:17:04 AM
    Author     : NewUser
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
        <title>View Staff</title>
    </head>
    <body>
        <h1>View Staff</h1>
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT *  FROM APP.staff
        </sql:query>
    
        <table border="1">
            <!-- column headers -->
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>SALARY</th>
                <th>DESIGNATION</th>
                <th>UPDATE</th>
            </tr>
            <!-- column data -->
            <c:forEach var="column" items="${result.rows}">
                    <tr>
                        <td><c:out value="${column.ID}"/></td>
                        <td><c:out value="${column.NAME}"/></td>
                        <td><c:out value="${column.SALARY}"/></td>
                        <td><c:out value="${column.DESIGNATION}"/></td>
                       
                        
                        
                        <c:set var="id" value="${column.ID}"/>
                        
                        <td><a href="editForm.jsp?id=${id}">Edit</a></td>
                        
                    </tr>
                </c:forEach>
               
        </table>
    </body>
</html>
