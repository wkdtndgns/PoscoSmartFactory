<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory" %>
<%@ page import="Dao.Order" %>
<%@ page import="Comm.OrderStatus" %>
<%@ page import="Dao.OrderDao" %>
<%@ page import="Dao.CompanyDao" %>
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
  <jsp:include page="../include/companysidebar.jsp"/>
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
      <jsp:include page="../include/toolbar.jsp"/>

      <div class="container-fluid">
        <!-- DataTales Example -->
        <input type="hidden" id="hidPrevStatus" value="<%= request.getAttribute("status")%>">
        <div class="card shadow mb-4">
          <form id="frm" method="get" action="/company/ordercheck">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary" style="display: contents">주문 목록</h6>
              <div style="float: right; display: flex;">


              </div>
            </div>
          </form>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
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
                  OrderDao orderDao = new OrderDao();
                  CompanyDao companyDao = new CompanyDao();
                  Integer num = companyDao.findCompanyIdByName(nameUser);
                  if (num != null) {
                    List<Order> orderList = orderDao.findAllByCompanyId(num);
                    for (Order o : orderList) {
                %>
                <tr>
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
                <% }
                }%>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>