<%@ page import="Dao.Company, java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <jsp:include page="/include/header.jsp"/>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
  <jsp:include page="/include/sidebar.jsp"/>
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
      <jsp:include page="/include/toolbar.jsp"/>
      <!-- Begin Page Content -->
      <div class="container-fluid">
        <!-- Begin Page Content 페이지수정할때 요기만 -->
        <a href="company/list">링크1</a><br/>
        <a href="factory/list">링크1</a><br/>
        <a href="material/list">링크1</a><br/>

      </div>
      <!-- /.container-fluid -->
    </div>
    <jsp:include page="/include/footer.jsp"/>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>