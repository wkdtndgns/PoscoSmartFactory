<%@ page import="Dao.Order, java.util.List, Comm.OrderStatus" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <jsp:include page="../include/header.jsp"/>
  <script>
    $(document).ready(function () {
      $('#dataTable').DataTable({
        "columnDefs": [
          {
            "orderable": false,
            "targets": 0
          }
        ]
      });

      $('.allChk').click(function () {
        const b = $('.allChk').prop("checked");
        $('.rowChk:enabled').prop("checked", b);
      });

      $(document).delegate('.rowChk', 'click', function (e) {
        var bIsAllChecked = ($('.rowChk:checked').length === $('.rowChk').length) ? true : false;
        $('.allChk').prop('checked', bIsAllChecked);
      });

      $('#btnOrderStatus').click(function () {
        const orderId = []
        const bC = confirm("주문완료 처리 하시겠습니까?")

        if (bC) {
          $.each($('.rowChk:checked'), function (iKey, aRow) {
            orderId.push($(this).val())
          });

          if (!orderId.length > 0) {
            alert("주문을 선택해주세요.")
            return false;
          }

          $.ajax({
            url: "/order/updateStatus",
            type: "POST",
            data: JSON.stringify({
              orderId: orderId,
              status: 30,
            }),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
              // 서버로부터 받은 응답 데이터를 처리하는 코드
              console.log(response);
              alert("성공적으로 처리되었습니다. ")

              location.reload();
              // 응답 데이터를 활용하여 필요한 작업 수행
            },
            error: function (xhr, status, error) {
              // AJAX 요청이 실패한 경우의 처리 코드
              alert("요청에 실패했습니다")
              console.error(error);
            }
          });
        }
      });
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
            <h6 class="m-0 font-weight-bold text-primary" style="display: contents">주문 목록</h6>
            <div style="float: right">
              <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="btnOrderStatus">
                <i class="fas fa-download fa-sm text-white-50"></i> 완료
              </a>
            </div>
          </div>
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
                  <td><%= o.getPurchasePrice() %>
                  </td>
                  <td><%= o.getOrderDate() %>
                  </td>
                  <td><%= o.getExpectedDeliveryDate() %>
                  </td>
                  <td><%= OrderStatus.fromInt(o.getStatus()) %>
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
