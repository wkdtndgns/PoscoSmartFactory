<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>
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
      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">생산 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>주문번호</th>
                  <th>공장이름</th>
                  <th>수량</th>
                  <th>시작일</th>
                  <th>예상 완료일</th>
                  <th>생산 상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Production> productions = (List<Production>) request.getAttribute("productions");
                  for (Production p : productions) {
                %>
                <tr>
                  <td><%= p.getOrderNo() %></td>
                  <td><%= p.getFactoryName() %></td>
                  <td><%= p.getQty() %></td>
                  <td><%= p.getStartDate() %></td>
                  <td><%= p.getExpectedCompletionDate() %></td>
                  <td><%= ProductionStatus.fromInt(p.getStatus()) %></td>
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
