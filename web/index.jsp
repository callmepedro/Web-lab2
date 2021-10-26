<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Components.HitData" %>
<%@ page import="Components.HitList" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: callmepedro
  Date: 14.10.2021
  Time: 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>второй</title>
    <link rel="icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</head>

<body>
<div id="header">
    <div id="author-info">
        <div class="author-name">Соловьев Петр Викторович</div>
        <div class="author-group">группа: P3211</div>
        <div class="author-variant">вариант: 11018</div>
    </div>
</div>

<div id="container">
    <div id="leftbar">

        <div class="dec-bar"></div>
        <table class="dec-table">
            <tr></tr>
        </table>

        <form id="main-form" method="post" action="${pageContext.request.contextPath}/main">
            <div id="left-container">
                <div id="input-bar">
                    <div id="x-values-bar">
                        <label class="x-label">Значение X</label>

                        <table class="x-values-table">
                            <tr>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value-3" value="-3" onchange="checkboxHandler(this)">
                                    <label for="x-value-3" class="x-num-negative">-3</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value-2" value="-2" onchange="checkboxHandler(this)">
                                    <label for="x-value-2" class="x-num-negative">-2</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value-1" value="-1" onchange="checkboxHandler(this)">
                                    <label for="x-value-1" class="x-num-negative">-1</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+0" value="0" onchange="checkboxHandler(this)">
                                    <label for="x-value+0" class="x-num-positive">0</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+1" value="1" onchange="checkboxHandler(this)">
                                    <label for="x-value+1" class="x-num-positive">1</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+2" value="2" onchange="checkboxHandler(this)">
                                    <label for="x-value+2" class="x-num-positive">2</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+3" value="3" onchange="checkboxHandler(this)">
                                    <label for="x-value+3" class="x-num-positive">3</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+4" value="4" onchange="checkboxHandler(this)">
                                    <label for="x-value+4" class="x-num-positive">4</label>
                                </td>
                                <td>
                                    <input type="checkbox" class="custom-checkbox" id="x-value+5" value="5" onchange="checkboxHandler(this)">
                                    <label for="x-value+5" class="x-num-positive">5</label>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="y-values-bar">
                        <label class="y-label">Значение Y</label>
                        <input type="text" placeholder="(-5..3)" maxlength="7" name="y-value" id="y-value">
                    </div>

                    <div id="r-values-bar">
                        <label class="r-label">Значение R</label>
                        <input type="text" placeholder="(1..4)" maxlength="7" name="r-value" id="r-value">
                    </div>

                    <input type="hidden" name="x-value" id="x-value">
                    <input type="hidden" name="redirect" id="redirect" value="true">

                    <div id="button-bar">
                        <input type="submit" id="submit-button" value="submit">
                        <input type="button" id="clear-button" value="clear">
                    </div>
                </div>

                <div class="interactive-element">
                    <svg id="svg-graph" width="260" height="260">
                        <line class="svg-axis" x1="0" y1="130" x2="260" y2="130"></line>
                        <polygon points="260,130 250,125 250,135"></polygon>

                        <line class="svg-axis" x1="130" y1="260" x2="130" y2="0"></line>
                        <polygon points="130,0 125,10 135,10"></polygon>

                        <!-- X-axis coordinates-->
                        <line class="svg-coordinate-line" x1="30" y1="125" x2="30" y2="135"></line>
                        <text class="svg-coordinate-text" x="24" y="123">-R</text>

                        <line class="svg-coordinate-line" x1="80" y1="125" x2="80" y2="135"></line>
                        <text class="svg-coordinate-text" x="74" y="123">-R/2</text>

                        <line class="svg-coordinate-line" x1="180" y1="125" x2="180" y2="135"></line>
                        <text class="svg-coordinate-text" x="178" y="123">R/2</text>

                        <line class="svg-coordinate-line" x1="230" y1="125" x2="230" y2="135"></line>
                        <text class="svg-coordinate-text" x="228" y="123">R</text>

                        <!-- Y-axis coordinates-->
                        <line class="svg-coordinate-line" x1="125" y1="230" x2="135" y2="230"></line>
                        <text class="svg-coordinate-text" x="136" y="234">-R</text>

                        <line class="svg-coordinate-line" x1="125" y1="180" x2="135" y2="180"></line>
                        <text class="svg-coordinate-text" x="136" y="184" >-R/2</text>

                        <line class="svg-coordinate-line" x1="125" y1="80" x2="135" y2="80"></line>
                        <text class="svg-coordinate-text" x="136" y="84">R/2</text>

                        <line class="svg-coordinate-line" x1="125" y1="30" x2="135" y2="30"></line>
                        <text class="svg-coordinate-text" x="136" y="34">R</text>

                        <!-- Triangle polygon-->
                        <polygon class="svg-triangle-polygon"
                                 points="130,130 130,180 30,130"></polygon>

                        <!-- Rectangle polygon-->
                        <polygon class="svg-rectangle-polygon"
                                 points="130,130 180,130 180,230 130,230"></polygon>

                        <!-- Sector Polygon-->
                        <path class="svg-sector-polygon"
                              d="M 180 130 A 50 50 0 0 0 130 80 L 130 130 Z"></path>
                    </svg>
                </div>

            </div>
        </form>
    </div>

    <div id="spacer"></div>

    <div id="rightbar">
        <div class="dec-bar"></div>

        <div class="outer-scroll-container">
            <div class="inner-scroll-container">
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
            </div>
        </div>

    </div>

    <div id="clear"></div>

</div>
</body>
</html>
