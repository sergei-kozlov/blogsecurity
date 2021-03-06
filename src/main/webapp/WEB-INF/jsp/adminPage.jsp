<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>Admin page</title>
</head>
<body>

<h1>Page for administrator</h1>

<h3>All new user</h3>
<fieldset>
<form:form method="POST" commandName="users" action="/adminpage/add">
    <table>
        <tr>
            <td><form:label path="username">Username</form:label></td>
            <td><form:input path="username" /></td>
            <td><form:errors path="username" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="password">Password</form:label></td>
            <td><form:input path="password" /></td>
            <td><form:errors path="password" cssClass="error"/></td>
        </tr>
        <tr><br>
            <td colspan="2"><form:button type="submit" name="action">New user</form:button></td>
        </tr>
    </table>
</form:form>
</fieldset>

<h3>All users</h3>
<fieldset>
<c:if test="${!empty usersList}">
    <table class="data">
        <tr>
            <th>Username</th>
            <th>Password</th>
            <th>Enabled</th>
        </tr>
        <c:forEach items="${usersList}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.enabled}</td>

                <td><a href="del/${user.username}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</fieldset>

<h3>All articles</h3>
<fieldset>
<c:if test="${!empty articleList}">
    <table class="data">
        <tr>
            <th>Article title</th>
        </tr>
        <c:forEach items="${articleList}" var="article">
            <tr>
                <td>${article.title}</td>
                <td><a href="delete/${article.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</fieldset>

<footer>
    <form action="/logout">
        <input type="submit" value="Logout" />
    </form>
</footer>

</body>
</html>