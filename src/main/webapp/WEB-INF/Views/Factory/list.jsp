<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory, Dao.Material, Dao.Factory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <jsp:include page="../include/header.jsp"/>
  <script>
    $(document).ready(function() {
      console.log('ddd');
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
            <h6 class="m-0 font-weight-bold text-primary">기업 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>이름</th>
                  <th>위치</th>
                  <th>음극재 생산량</th>
                  <th>양극재 생산량</th>
                  <th>음극재 재고</th>
                  <th>양극재 재고</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Factory> factories = (List<Factory>) request.getAttribute("factories");
                  for (Factory f : factories) {
                %>
                <tr>
                  <td><%= f.getName() %></td>
                  <td><%= f.getLocation() %></td>
                  <td><%= f.getCathodeProduction() %></td>
                  <td><%= f.getAnodeProduction() %></td>
                  <td><%= f.getCathodeStock() %></td>
                  <td><%= f.getAnodeStock() %></td>
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