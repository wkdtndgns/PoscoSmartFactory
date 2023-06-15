<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>
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
        const productionNo = []
        const orderNo = []
        const bC = confirm("생산완료 처리 하시겠습니까?")

        if (bC) {
          $.each($('.rowChk:checked'), function (iKey, aRow) {
            productionNo.push($(this).val())
            orderNo.push($(this).data('order_no').toString())
          });

          if (!productionNo.length > 0) {
            alert("선택해주세요.")
            return false;
          }

          console.log()
          $.ajax({
            url: "/production/updateStatus",
            type: "POST",
            data: JSON.stringify({
              orderNo: orderNo,
              productionIds: productionNo,
              status: 20,
            }),
            contentType: "application/json",
            dataType: "json",
            success: function (response) {
              // 서버로부터 받은 응답 데이터를 처리하는 코드
              console.log(response);
              const bSuccess = confirm("성공적으로 처리되었습니다. ")
              if (bSuccess) {
                location.reload();
              }
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
            <h6 class="m-0 font-weight-bold text-primary" style="display: contents">생산 목록</h6>
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
                    String disabled = p.getStatus() == 10 ? "" : "disabled";
                %>
                <tr>
                  <td><input type="checkbox" class="rowChk" value="<%=p.getId()%>" data-order_no="<%= p.getOrderNo()%>" <%=disabled%>/></td>
                  <td><%= p.getOrderNo() %>
                  </td>
                  <td><%= p.getFactoryName() %>
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
