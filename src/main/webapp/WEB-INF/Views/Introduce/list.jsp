<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory, Dao.Material" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <jsp:include page="../include/header.jsp"/>
    <script>
        $(document).ready(function() {

            $('#dataTable').DataTable();
        });
    </script>

</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="../include/sidebar.jsp"/>
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
        <!-- /.container-fluid -->

        <jsp:include page="../include/footer.jsp"/>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
</body>
</html>