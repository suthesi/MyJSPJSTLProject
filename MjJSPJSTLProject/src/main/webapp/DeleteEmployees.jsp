<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#output
{
height:200px;
width:80%;
border:2px solid black;
text-align:center;
background-color:white;
margin:auto;
}
</style>

</head>
<body>

<%
int id=Integer.parseInt(request.getParameter("myDeleteId"));
%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/java_schema" user="root" password="1120"/>
<sql:update dataSource="${myDB}" var="count">
delete from java1 where id=?
<sql:param value="<%=id%>"></sql:param>
</sql:update>

<div id="output">
<H1>Record deleted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>