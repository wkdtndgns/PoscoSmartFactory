<%@ page import="Dao.Company, java.util.List, Comm.CompanyCategory" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                                <div id="pricePositive" class="font-weight-bold text-danger">가격: ${cathoprice}</div>(원)
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">음극재</h6>
                            </div>
                            <div class="card-body">
                                <div id="priceNegative" class="font-weight-bold text-danger">가격: ${anodeprice}</div> (원)
                                <input id="anodeprice" type="hidden" value="${anodeprice}">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card shadow">
                            < class="card-body">
                                <div class="font-weight-bold">실시간 환율:</div>
                                <div id="exchangeRate" class="font-weight-bold">${rate}</div>
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
<script>
    function calculateOrderPrice() {
    var quantityNegative = document.getElementById('quantityNegativeOrder').value;
    var anodeprice = document.getElementById('anodeprice').value;
    var totalNegative = quantityNegative * anodeprice;
    var totalPrice = totalNegative;
    var orderPriceElement = document.getElementById('orderPrice');
    orderPriceElement.innerHTML = '총 주문 가격: ' + totalPrice.toLocaleString() + '원';


}
    function placeOrder() {
        var factoryOption = document.getElementById('factoryOption').value;
        var quantityNegative = document.getElementById('quantityNegativeOrder').value;
        var anodeprice = document.getElementById('anodeprice').value;

        var totalPrice = quantityNegative * anodeprice; // 음극재 1개 가격

        // Create a form element
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = 'orderAction'; // Replace with the actual action URL

        // Create an input element for total order price
        var totalPriceInput = document.createElement('input');
        totalPriceInput.type = 'hidden';
        totalPriceInput.name = 'totalPrice';
        totalPriceInput.value = totalPrice;

        // Create an input element for anode quantity
        var quantityNegativeInput = document.createElement('input');
        quantityNegativeInput.type = 'hidden';
        quantityNegativeInput.name = 'quantityNegative';
        quantityNegativeInput.value = quantityNegative;

        // Create an input element for selected factory
        var factoryOptionInput = document.createElement('input');
        factoryOptionInput.type = 'hidden';
        factoryOptionInput.name = 'factoryOption';
        factoryOptionInput.value = factoryOption;

        var factoryIdInput = document.createElement('input');
        factoryIdInput.type = 'hidden';
        factoryIdInput.name = 'factoryId';
        factoryIdInput.value = getFactoryId(factoryOption); // factoryOption에 따라 factory_id를 설정합니다.

        // Append the input elements to the form
        form.appendChild(totalPriceInput);
        form.appendChild(quantityNegativeInput);
        form.appendChild(factoryOptionInput);
        form.appendChild(factoryIdInput);

        // Append the form to the document body and submit it
        document.body.appendChild(form);
        form.submit();
    }
     function getFactoryId(factoryOption) {
        var factoryId;
        switch (factoryOption) {
            case '광양':
                factoryId = 1;
                break;
            case '포항':
                factoryId = 2;
                break;
            case '구미':
                factoryId = 3;
                break;
            default:
                factoryId = 0;
                break;
        }
        return factoryId;
    }

</script>
</body>
</html>
