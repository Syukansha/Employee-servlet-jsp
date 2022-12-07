<%-- 
    Document   : success
    Created on : Jun 27, 2021, 2:18:34 AM
    Author     : NewUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SUCCESS</h1>
        <jsp:useBean id="staff" class="person.bean.Staff" />
        
        <jsp:setProperty name="staff" property="name" />
        <jsp:setProperty name="staff" property="salary"/>
        <jsp:setProperty name="staff" property="designation"/>
        
        <p>Staff Name: <jsp:getProperty name="staff" property="name" /></p>
        <p>Staff Salary: <jsp:getProperty name="staff" property="salary" /></p>
        <p>Designation: <jsp:getProperty name="staff" property="designation" /></p>
       
    </body>
</html>
