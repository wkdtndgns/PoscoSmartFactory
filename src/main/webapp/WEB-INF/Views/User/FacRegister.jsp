<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nameUser = (String) session.getAttribute("username");
    if (nameUser == null) {
        response.sendRedirect(request.getContextPath() + "/User/Login");
        return; // 리다이렉트 후에 코드 진행 중단
    }
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <jsp:include page="../include/header.jsp" />
</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="../include/sidebar.jsp" />
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="../include/toolbar.jsp" />
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">공장 아이디 발급</h1>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <form id="factoryForm">
                            <div class="form-group">
                                <label for="factoryName">공장 이름</label>
                                <input type="text" id="factoryName" name="factoryName" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="factoryLocation">공장 위치</label>
                                <input type="text" id="factoryLocation" name="factoryLocation" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="positiveMaterial">음극재</label>
                                <input type="text" id="positiveMaterial" name="positiveMaterial" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="positiveMaterialProduction">음극재 월 생산량</label>
                                <input type="text" id="positiveMaterialProduction" name="positiveMaterialProduction" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="negativeMaterial">양극재</label>
                                <input type="text" id="negativeMaterial" name="negativeMaterial" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="negativeMaterialProduction">양극재 월 생산량</label>
                                <input type="text" id="negativeMaterialProduction" name="negativeMaterialProduction" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="negativeMaterialStock">양극재 재고</label>
                                <input type="text" id="negativeMaterialStock" name="negativeMaterialStock" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="positiveMaterialStock">음극재 재고</label>
                                <input type="text" id="positiveMaterialStock" name="positiveMaterialStock" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary">발급하기</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center mt-4" id="generatedIdSection" style="display: none;">
                <div class="col-md-6">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">아이디 발급 완료!</h4>
                        <p>입력한 정보로 아래와 같이 공장 아이디가 발급되었습니다.</p>
                        <hr>
                        <p class="mb-0"><strong>공장 이름:</strong> <span id="generatedFactoryName"></span></p>
                        <p class="mb-0"><strong>아이디:</strong> <span id="generatedId"></span></p>
                        <p class="mb-0"><strong>비밀번호:</strong> <span id="generatedPassword"></span></p>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../include/footer.jsp" />
    </div>
    <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<jsp:include page="../include/footer.jsp" />
<script>
    $(document).ready(function () {
        // 현재 메뉴 활성화
        var menuItems = document.getElementsByClassName("nav-item");
        var $menu = $(".nav");
        for (var i = 0; i < menuItems.length; i++) {
            var menuItem = menuItems[i];
            var $menuItem = $(menuItem);

            // 클래스 추가
            if (window.location.pathname === menuItem.href) {
                $menuItem.addClass("active");
            }

            $menu.append($menuItem);
        }

        // 공장 아이디 발급 폼 제출 이벤트 처리
        $("#factoryForm").submit(function (event) {
            event.preventDefault();
            var factoryName = $("#factoryName").val();
            var factoryLocation = $("#factoryLocation").val();
            var positiveMaterial = $("#positiveMaterial").val();
            var positiveMaterialProduction = $("#positiveMaterialProduction").val();
            var negativeMaterial = $("#negativeMaterial").val();
            var negativeMaterialProduction = $("#negativeMaterialProduction").val();
            var negativeMaterialStock = $("#negativeMaterialStock").val();
            var positiveMaterialStock = $("#positiveMaterialStock").val();

            // 모든 필드가 채워졌는지 확인
            if (
                factoryName === "" ||
                factoryLocation === "" ||
                positiveMaterial === "" ||
                positiveMaterialProduction === "" ||
                negativeMaterial === "" ||
                negativeMaterialProduction === "" ||
                negativeMaterialStock === "" ||
                positiveMaterialStock === ""
            ) {
                alert("모든 필드에 입력하세요.");
                return;
            }

            // 공장 이름이 10자 이상인지 확인


            // 랜덤 아이디 생성
            var randomId = generateRandomId(factoryName);

            // 랜덤 비밀번호 생성
            var randomPassword = generateRandomPassword();

            // 발급된 정보 표시
            $("#generatedFactoryName").text(factoryName);
            $("#generatedId").text(randomId);
            $("#generatedPassword").text(randomPassword);

            // 폼 숨기고 발급 정보 영역 표시
            $("#factoryForm").hide();
            $("#generatedIdSection").show();
        });

        // 랜덤 아이디 생성 함수
        function generateRandomId(factoryName) {
            var randomString = Math.random().toString(36).substr(2, 4);
            return factoryName + randomString;
        }

        // 랜덤 비밀번호 생성 함수
        function generateRandomPassword() {
            var randomPassword = Math.random().toString(36).substr(2, 8);
            return randomPassword;
        }
    });
</script>
</body>

</html>
