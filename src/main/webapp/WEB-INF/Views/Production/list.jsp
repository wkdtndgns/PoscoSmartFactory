<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <jsp:include page="../include/header.jsp"/>
  <script src="<%=request.getContextPath()%>/js/production/list.js"></script>
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

        <input type="hidden" id="hidPrevStatus" value="<%= request.getAttribute("status")%>">
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <form id="frm" method="get" action="/production/list">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary" style="display: contents">생산 목록</h6>
              <div style="float: right; display: flex;">
                <div style="margin-right: 15px;">
                  <select class="form-control" name="status" id="selStatus">
                    <option value="">전체</option>
                    <option value="10">진행중</option>
                    <option value="20">완료</option>
                  </select>
                </div>
                <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnOrderStatus">
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
                  <th>공장</th>
                  <th>기업</th>
                  <th>재료</th>
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
                    String disabled = p.getStatus() == 10 ? "" : "disabled";
                %>
                <tr>
                  <td><input type="checkbox" class="rowChk" value="<%=p.getId()%>" data-order_no="<%= p.getOrderNo()%>" <%=disabled%>/></td>
                  <td><%= p.getOrderNo() %>
                  </td>
                  <td><%= p.getFactoryName() %>
                  </td>
                  <td><%= p.getCompanyName() %>
                  </td>
                  <td><%= p.getMaterialName() %>
                  </td>
                  <td><%= p.getQty() %>
                  </td>
                  <td><%= p.getStartDate() %>
                  </td>
                  <td><%= p.getExpectedCompletionDate() %>
                  </td>
                  <td><%= ProductionStatus.fromInt(p.getStatus()) %>
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
