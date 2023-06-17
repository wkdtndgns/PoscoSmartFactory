<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory, Dao.Material" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String nameUser = (String) session.getAttribute("username");
  if (nameUser == null) {
    response.sendRedirect(request.getContextPath() + "/User/Login");
    return; // 리다이렉트 후에 코드 진행 중단
  }
  System.out.println(nameUser+" 값 체크 ");
%>
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
      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">재료 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>이름</th>
                  <th>내용</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Material> materials = (List<Material>) request.getAttribute("materials");
                  for (Material m : materials) {
                %>
                <tr>
                  <td><%= m.getName() %>
                  </td>
                  <td><%= m.getDescription() %>
                  </td>
                </tr>
                <% } %>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->
    </div>
    <jsp:include page="../include/footer.jsp"/>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>