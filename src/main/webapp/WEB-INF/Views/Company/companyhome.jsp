<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String nameUser = (String) session.getAttribute("username");
    if (nameUser == null) {
        response.sendRedirect(request.getContextPath() + "/User/Login");
        return; // 리다이렉트 후에 코드 진행 중단
    }

%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <jsp:include page="../include/header.jsp"/>
    <script src="<%=request.getContextPath()%>/js/company/list.js"></script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="../include/companysidebar.jsp"/>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="../include/toolbar.jsp"/>
            <!-- Begin Page Content 수정은 요기서지롱 -->
            <img src="<%=request.getContextPath()%>/img/1.png" width="100%" height="1000px" />
            <img src="<%=request.getContextPath()%>/img/2.png" width="100%" height="1000px" />
            <img src="<%=request.getContextPath()%>/img/4.png" width="100%" height="1000px" />
            <%--            <img src="<%=request.getContextPath()%>/img/5.png" width="100%" height="1000px" />--%>
            <%--            <img src="<%=request.getContextPath()%>/img/6.png" width="100%" height="1000px" />--%>
        </div>
        <jsp:include page="../include/footer.jsp"/>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
</body>
</html>