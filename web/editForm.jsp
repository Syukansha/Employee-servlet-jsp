<%-- 
    Document   : editForm
    Created on : Jun 26, 2021, 2:45:47 AM
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
        <title>Edit Employee</title>
    </head>
    <body>
        <h1>Edit Employee</h1>
        
        
        
        <form action="emp.controller" method="POST">
            <table>
                <c:set var="id" value="${param.id}"/>
                <tr>
                    <td>ID:</td>
                    <td><input name="id" value="${id}" ></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT NAME FROM staff where ID=?
                            <sql:param value="${id}"/>
                        </sql:query>
                             
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <input name="name" value="${column}">
                                </c:forEach>
                            </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td>
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT SALARY FROM staff where ID=?
                            <sql:param value="${id}"/>
                        </sql:query>
                             
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <input name="salary" value="${column}">
                                </c:forEach>
                            </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td>Designation:</td>
                    <td>
                        <sql:query var="result" dataSource="${myDatasource}">
                             SELECT DESIGNATION FROM staff where ID=?
                            <sql:param value="${id}"/>
                        </sql:query>
                             
                            <c:forEach var="row" items="${result.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <input name="designation" value="${column}">
                                </c:forEach>
                            </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Save"/></td>
                </tr>
            </table>
        </form>
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
