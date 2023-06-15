<%@ page import="Dao.Order, java.util.List, Comm.OrderStatus" %>
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
            <h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>회사</th>
                  <th>공장</th>
                  <th>재료</th>
                  <th>수량</th>
                  <th>가격</th>
                  <th>주문일</th>
                  <th>주문 예상일</th>
                  <th>주문 상태</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Order> orders = (List<Order>) request.getAttribute("orders");
                  for (Order o : orders) {
                %>
                <tr>
                  <td><%= o.getCompanyName() %></td>
                  <td><%= o.getFactoryName() %></td>
                  <td><%= o.getMaterialName() %></td>
                  <td><%= o.getQty() %></td>
                  <td><%= o.getPurchasePrice() %></td>
                  <td><%= o.getOrderDate() %></td>
                  <td><%= o.getExpectedDeliveryDate() %></td>
                  <td><%= OrderStatus.fromInt(o.getStatus()) %></td>
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
