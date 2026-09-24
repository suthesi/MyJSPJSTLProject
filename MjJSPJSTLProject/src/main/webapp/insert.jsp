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
border:2px solid black ;
text-align:center;
background-color:#white;
margin:auto;
}
</style>
</head>
<body>

<%
String firstName=request.getParameter("firstname");
String lastName=request.getParameter("lastname");
int age=Integer.parseInt(request.getParameter("age"));
String phone_number=request.getParameter("phonenumber");
String jDate=request.getParameter("join_date");
java.util.Date join_date=null;
SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
try
{
	join_date=sd.parse(jDate);
}
catch(ParseException pe)
{
	pe.printStackTrace();
}



%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/java_schema" user="root" password="1120"/>
<sql:update dataSource="${myDB}" var="count">
insert into java1(firstName,lastName,phonenumber,age,join_date) values(?,?,?,?,?)

<sql:param value="<%=firstName%>"></sql:param>
<sql:param value="<%=lastName%>"></sql:param>
<sql:param value="<%=phone_number%>"></sql:param>
<sql:param value="<%=age%>"></sql:param>
<sql:param value="<%=join_date%>"></sql:param>

</sql:update>

<div id="output">
<H1>Record inserted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>