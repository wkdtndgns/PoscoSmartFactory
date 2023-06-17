<%--
  Created by IntelliJ IDEA.
  User: holid
  Date: 2023-06-17
  Time: 오후 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<%
  String nameUser = (String) session.getAttribute("username");
  if (nameUser == null) {
    response.sendRedirect(request.getContextPath() + "/User/Login");
    return; // 리다이렉트 후에 코드 진행 중단
  }
%>
<body>

</body>
</html>
