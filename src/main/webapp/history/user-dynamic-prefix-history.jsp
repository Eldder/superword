<%--
  ~ APDPlat - Application Product Development Platform
  ~ Copyright (c) 2013, 杨尚川, yang-shangchuan@qq.com
  ~
  ~  This program is free software: you can redistribute it and/or modify
  ~  it under the terms of the GNU General Public License as published by
  ~  the Free Software Foundation, either version 3 of the License, or
  ~  (at your option) any later version.
  ~
  ~  This program is distributed in the hope that it will be useful,
  ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~  GNU General Public License for more details.
  ~
  ~  You should have received a copy of the GNU General Public License
  ~  along with this program.  If not, see <http://www.gnu.org/licenses/>.
  --%>

<%@ page import="org.apdplat.superword.tools.MySQLUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apdplat.superword.model.UserDynamicPrefix" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userName = (String) session.getAttribute("userName");
    List<UserDynamicPrefix> userDynamicPrefixes = MySQLUtils.getHistoryUserDynamicPrefixesFromDatabase(userName);
    StringBuilder htmlFragment = new StringBuilder();
    htmlFragment.append("<table>");
    htmlFragment.append("<tr><th>序号</th><th>动态前缀</th><th>时间</th></tr>");
    int i = 1;
    for (UserDynamicPrefix userDynamicPrefix : userDynamicPrefixes) {
        htmlFragment.append("<tr><td>")
                .append(i++)
                .append("</td><td>")
                .append("<a target=\"_blank\" href=\"../root-affix/dynamic-prefix-rule.jsp?dict=ICIBA&words_type=SYLLABUS&prefixes=")
                .append(userDynamicPrefix.getDynamicPrefix())
                .append("\">")
                .append(userDynamicPrefix.getDynamicPrefix())
                .append("</a>")
                .append("</td><td>")
                .append(userDynamicPrefix.getDateTimeString())
                .append("</td></tr>");
    }
    htmlFragment.append("</table>");
%>

<html>
<head>
    <title>用户动态前缀分析记录</title>
    <link href="<%=request.getContextPath()%>/css/superword.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/superword.js"></script>
</head>
<body id="top">
<jsp:include page="../common/head.jsp"/>
<p>用户 <%=userName%> 动态前缀分析记录</p>
<%=htmlFragment%>
<jsp:include page="../common/bottom.jsp"/>
</body>
</html>
