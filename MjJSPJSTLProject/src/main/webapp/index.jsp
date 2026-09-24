<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="sl314.myclasses.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Records Management</title>
<style>
  :root {
    --bg: #f4f6f8;
    --card-bg: #ffffff;
    --border: #d7dde3;
    --accent: #2563eb;
    --accent-hover: #1d4ed8;
    --text: #1f2937;
    --label: #4b5563;
  }

  * {
    box-sizing: border-box;
  }

  body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: var(--bg);
    color: var(--text);
    margin: 0;
    padding: 40px 20px;
  }

  h1 {
    text-align: center;
    margin-bottom: 32px;
    padding-right: 150px; 
    font-size: 1.rem;
  }

  main {
    max-width: 640px;
    margin: 0 auto;
  }

  fieldset {
    background: var(--card-bg);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 26px 26px 26px;
    margin-bottom: 24px;
  }

  legend {
    font-weight: 600;
    padding: 0 8px;
    color: var(--accent);
  }

  form {
    display: grid;
    grid-template-columns: 140px 1fr;
    align-items: center;
    gap: 14px 12px;
    margin-top: 8px;
  }

  form label {
    font-size: 0.9rem;
    color: var(--label);
    font-weight: 500;
  }

  form input[type="text"],
  form input[type="datetime-local"] {
    padding: 10px 140px;
    border: 1px solid var(--border);
    border-radius: 6px;
    font-size: 0.9rem;
    width: 100%;
    transition: border-color 0.15s ease;
  }

  form input[type="text"]:focus,
  form input[type="datetime-local"]:focus {
    outline: none;
    border-color: var(--accent);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
  }

  form input[type="submit"] {
    grid-column: 1 / -1;
    justify-self: end;
    background: var(--accent);
    color: #fff;
    border: none;
    padding: 9px 22px;a
    border-radius: 6px;
    font-size: 0.9rem;
    cursor: pointer;
    transition: background 0.15s ease;
    margin-top: 4px;
  }

  form input[type="submit"]:hover {
    background: var(--accent-hover);
  }

  @media (max-width: 480px) {
    form {
      grid-template-columns: 1fr;
    }
  }
</style>
</head>
<body>

<h1>Record Management</h1>

<main>
    <form action="insert.jsp" method="post">
<fieldset>
<legend>Insert Record</legend>
      <label for="insert-firstName">First Name</label>
      <input type="text" id="insert-firstName" name="firstname">

      <label for="insert-lastName">Last Name</label>
      <input type="text" id="insert-lastName" name="lastname">

      <label for="insert-age">Age</label>
      <input type="text" id="insert-age" name="age">

      <label for="insert-phone">Phone Number</label>
      <input type="text" id="insert-phone" name="phonenumber">

      <label for="insert-joinDate">Join Date</label>
      <input type="datetime-local" id="insert-joinDate" name="join_date">

      <input type="submit" value="Insert">
      </fieldset>
    </form>
  
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/java_schema" user="root" password="1120"/>
<sql:query dataSource="${myDB}" var="ids">
select id from java1
</sql:query>
  
    
    <form action="Welcome.jsp" method="POST">
    
    <fieldset>
    <legend>Update Record</legend>
          
      <label for="insert-id">ID:</label>
      <select name="myId">

<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select>
<br>

<label for="insert-firstName">First Name</label>
      <input type="checkbox" name="myField" value="firstname">
      <input type="text" id="insert-firstName" name="firstnameInput">
      
      <label for="insert-lastName">Last Name</label>
      <input type="checkbox" name="myField" value="lastname">
      
      <input type="text" id="insert-lastName" name="lastnameInput">

      <label for="insert-age">Age</label>
      <input type="checkbox" name="myField" value="age">
      <input type="text" id="insert-age" name="ageInput">

      <label for="insert-phone">Phone Number</label>
      <input type="checkbox" name="myField" value="phonenumber">
      <input type="text" id="insert-phone" name="phonenumberInput">

      <label for="insert-joinDate">Join Date</label>
      <input type="checkbox" name="myField" value="join_date">
      <input type="datetime-local" id="insert-joinDate" name="join_dateInput">

      <input type="submit" value="Update">
      </fieldset>
    </form>
      
    <form action="DeleteEmployees.jsp" method="get">
    <fieldset>
    <legend>Delete Record</legend>
      <label for="insert-id">ID:</label>
      <select name="myDeleteId">

<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select>
<br>

      <input type="submit" value="Delete">
      </fieldset>
    </form>
   <form action="ListEmployees.jsp" method="get">
    <fieldset>
    <legend>Select Record</legend>
      

      <input type="submit" value="SelectAll">
      </fieldset>
    </form>
  

</main>

</body>
</html>
