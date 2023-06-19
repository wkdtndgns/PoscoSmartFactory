<%@ page import="Dao.Order, java.util.List, Comm.OrderStatus" %>
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
  <script src="<%=request.getContextPath()%>/js/order/list.js"></script>
  <script src="<%=request.getContextPath()%>/js/order/comm.js"></script>
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
        <input type="hidden" id="hidPrevStatus" value="<%= request.getAttribute("status")%>">
        <div class="card shadow mb-4">
          <form id="frm" method="get" action="/order/list">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary" style="display: contents">주문 목록</h6>
              <div style="float: right; display: flex;">
                <div style="margin-right: 15px;">
                  <select class="form-control" name="status" id="selStatus">
                    <option value="">전체</option>
                    <option value="10">진행중</option>
                    <option value="20">발송</option>
                    <option value="30">완료</option>
                  </select>
                </div>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnOrderStatus" style="line-height:normal;">
                  <i class="fas fa-download fa-sm text-white-50"></i> 완료
                </a>
              </div>
            </div>
          </form>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th><input type="checkbox" class="allChk"/></th>
                  <th>주문번호</th>
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
                    String disabled = o.getStatus() == 20 ? "" : "disabled";
                %>
                <tr>
                  <td><input type="checkbox" class="rowChk" value="<%=o.getId()%>" <%=disabled%>/></td>
                  <td><%= o.getId()%>
                  </td>
                  <td><%= o.getCompanyName() %>
                  </td>
                  <td><%= o.getFactoryName() %>
                  </td>
                  <td><%= o.getMaterialName() %>
                  </td>
                  <td><%= o.getQty() %>
                  </td>
                  <td><%= o.getPurchasePriceToString() %>
                  </td>
                  <td><%= o.getOrderDate() %>
                  </td>
                  <td><%= o.getExpectedDeliveryDate() %>
                  </td>
                  <td class="tdStatus"><%= OrderStatus.fromInt(o.getStatus()) %>
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
