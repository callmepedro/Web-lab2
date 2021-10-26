<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: callmepedro
  Date: 21.10.2021
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css" type="text/css">
</head>
<body>
    <div id="result-page-header">
        <form action="${pageContext.request.contextPath}/main">
            <input id="go-back-button" type="submit" value="Вернуться на страницу с формой">
        </form>
    </div>
    <table id="result-table">
        <thead>
        <tr class="table-header">
            <th class="coords-col">X</th>
            <th class="coords-col">Y</th>
            <th class="coords-col">R</th>
            <th class="time-col">Текущее время</th>
            <th class="time-col">Время исполнения (мс)</th>
            <th class="hit-res-col">Результат</th>
        </tr>
        </thead>
        <tbody>
        <jsp:useBean id="hitList" scope="session" class="Components.HitList"/>
        <c:forEach var="hit" items="${hitList.hitList}">
            <tr>
                <td>${hit.x}</td>
                <td>${hit.y}</td>
                <td>${hit.r}</td>
                <td>${hit.curTime}</td>
                <td>${hit.execTime}</td>
                <td>${hit.result}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
