<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<head>
    <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><spring:message code="registration.title"/></title>
</head>
<body>
<header>
    <a href="/"><img alt="Логотип" id="top-image" src="/resources/images/main_logo.jpg"/></a>
</header>

<div id="main">
    <aside class="leftAside">
        <h2><spring:message code="registration.head"/></h2>
        <p><spring:message code="registration.how"/></p>
    </aside>
    <section>
        <article>
            <h1><spring:message code="registration.h1"/></h1>

            <form name="frm" action="<c:url value='login'/>" method="post">


            <%--<form method="POST"--%>
                  <%--action="<%=request.getContextPath()%>/j_spring_security_check"--%>
                  <%--class="box login">--%>


                <fieldset class="boxBody">
                    <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>

                    <label> Username </label> <input type='text' name='user_login' value=''>

                    <label> Password </label> <input type='password' name='password_login' />

                    <c:if test="${not empty error}">
                        <div class="error" style="text-align: right;">${error}</div>
                    </c:if>
                </fieldset>

                <label>Remember me</label><input type="checkbox" name="remember-me-parameter">




                <%--<input type="checkbox" class="checkAdmin" />--%>

                <%--<label for="remember_me">Запомнить</label>--%>

                <input type="submit" value="Sign In">

            </form>

        </article>
    </section>
</div>

<jsp:include page="fragments/footer.jsp"/>
