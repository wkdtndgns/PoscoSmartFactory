<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory" %>
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
    <script src="<%=request.getContextPath()%>/js/company/list.js"></script>
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
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 mb-4">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">양극재</h6>
                            </div>
                            <div class="card-body">
                                <div id="pricePositive" class="font-weight-bold text-danger">가격: 450,000</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">음극재</h6>
                            </div>
                            <div class="card-body">
                                <div id="priceNegative" class="font-weight-bold text-danger">가격: 352,000</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 주문 화면 -->
                <div id="orderScreen">
                    <div class="form-group">
                        <label for="factoryOption">공장옵션 선택</label>
                        <select id="factoryOption" class="form-control">
                            <option value="포항">포항</option>
                            <option value="광양">광양</option>
                            <option value="구미">구미</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="quantityPositiveOrder">양극재 주문 수량</label>
                        <input type="number" id="quantityPositiveOrder" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="quantityNegativeOrder">음극재 주문 수량</label>
                        <input type="number" id="quantityNegativeOrder" class="form-control" />
                    </div>
                    <button class="btn btn-primary" onclick="calculateOrderPrice()">실시간 가격 계산</button>
                    <div id="orderPrice"></div>
                    <button class="btn btn-success mt-3" onclick="placeOrder()">최종 주문하기</button>
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
<script>function calculateOrderPrice() {
    var quantityPositive = document.getElementById('quantityPositiveOrder').value;
    var quantityNegative = document.getElementById('quantityNegativeOrder').value;
    var pricePositive = 450000; // 양극재 1개 가격
    var priceNegative = 352000; // 음극재 1개 가격

    var totalPositive = quantityPositive * pricePositive;
    var totalNegative = quantityNegative * priceNegative;
    var totalPrice = totalPositive + totalNegative;

    var orderPriceElement = document.getElementById('orderPrice');
    orderPriceElement.innerHTML = '총 주문 가격: ' + totalPrice.toLocaleString() + '원';
}</script>
</body>
</html>
