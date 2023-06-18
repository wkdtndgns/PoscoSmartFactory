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
  <!-- 추가된 부분: 부트스트랩 CSS 링크 -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* 추가된 부분: 메시지를 위한 스타일 */
    .message-container {
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 5px;
      font-size: 18px;
    }

    .message-container.success {
      background-color: #d4edda;
      color: #155724;
    }

    .message-container.warning {
      background-color: #fff3cd;
      color: #856404;
    }
  </style>
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

      <% int stockOrder = (Integer) request.getAttribute("stockOrder");
      %>

      <!-- 추가된 부분: 메시지 표시 -->
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <% if (stockOrder == 1) { %>
            <div class="message-container success">
              공장에 주문하신 제품의 재고가 있습니다. 바로배송 출발합니다.
            </div>
            <% } else if (stockOrder == 0) { %>
            <div class="message-container warning">
              제품 주문이 완료 되었습니다. 감사합니다.
            </div>
            <% } %>
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
