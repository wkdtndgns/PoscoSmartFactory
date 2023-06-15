<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <jsp:include page="../include/header.jsp" />
    <style>
        /* 아이디/패스워드 로그인 폼 스타일링 */
        .login-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form .form-group {
            margin-bottom: 20px;
        }

        .login-form label {
            font-weight: bold;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .login-form button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
        }

        .login-form button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Smart Factory<sup></sup></div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Nav Item - Dashboard -->
    </ul>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="../include/toolbar.jsp" />
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="login-form">
                            <h2>회사 아이디 발급</h2>
                            <form id="companyForm">
                                <div class="form-group">
                                    <label for="companyName">회사 이름</label>
                                    <input type="text" class="form-control" id="companyName" placeholder="회사 이름을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="category">기업 분류</label>
                                    <select id="category" class="form-control">
                                        <option value="10">자동차 배터리 기업</option>
                                        <option value="20">에너지 기업/ESS</option>
                                        <option value="30">전자제품 기업</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="companyIntro">기업 소개</label>
                                    <textarea class="form-control" id="companyIntro" rows="4"
                                              placeholder="기업 소개를 입력하세요"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">아이디 발급</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mt-4" id="generatedIdSection" style="display: none;">
                    <div class="col-md-6">
                        <div class="alert alert-success" role="alert">
                            <h4 class="alert-heading">아이디 발급 완료!</h4>
                            <p>
                                회사 이름: <span id="generatedCompanyName"></span>
                                <br>
                                발급된 아이디: <span id="generatedId"></span>
                                <br>
                                발급된 비밀번호: <span id="generatedPassword"></span>
                            </p>
                            <hr>
                            <p class="mb-0">최종 승인 신청 버튼을 눌러주세요.</p>
                            <button id="finalApprovalBtn" class="btn btn-primary mt-3">최종 승인 신청</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <jsp:include page="../include/footer.jsp" />
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    $(document).ready(function () {
        var menuData = [
            { text: "Login Page", href: "/User/Login" },
            { text: "문의하기", href: "https://open.kakao.com/o/s7D4s6pf" },
        ];

        var $menu = $("#accordionSidebar");
        // 메뉴 데이터를 기반으로 메뉴 아이템을 동적으로 생성하고 링크 및 active 클래스를 설정
        for (var i = 0; i < menuData.length; i++) {
            var menuItem = menuData[i];
            var $menuItem = document.createElement("li");
            $menuItem.classList.add("nav-item");

            var $link = document.createElement("a");
            $link.classList.add("nav-link");
            $link.href = menuItem.href;

            var $icon = document.createElement("i");
            $icon.classList.add("fas", "fa-fw", "fa-tachometer-alt");

            var $text = document.createElement("span");
            $text.textContent = menuItem.text;

            $link.appendChild($icon);
            $link.appendChild($text);

            $menuItem.appendChild($link);

            // 현재 URL 경로와 링크 경로를 비교하여 active 클래스 추가
            if (window.location.pathname === menuItem.href) {
                $menuItem.classList.add("active");
            }

            $menu.append($menuItem);
        }

        // 아이디 발급 폼 제출 이벤트 처리
        $("#companyForm").submit(function (event) {
            event.preventDefault();
            var companyName = $("#companyName").val();
            var category = $("#category").val();
            var companyIntro = $("#companyIntro").val();

            // 기업 소개가 10자 이상인지 확인
            if (companyIntro.length < 10) {
                alert("기업 소개는 10자 이상 입력해야 합니다.");
                return;
            }

            // 랜덤 아이디 생성
            var randomId = generateRandomId(companyName);

            // 랜덤 비밀번호 생성
            var randomPassword = generateRandomPassword();

            // 발급된 정보 표시
            $("#generatedCompanyName").text(companyName);
            $("#generatedId").text(randomId);
            $("#generatedPassword").text(randomPassword);

            // 폼 숨기고 발급 정보 영역 표시
            $("#companyForm").hide();
            $("#generatedIdSection").show();
        });

        // 랜덤 아이디 생성 함수
        function generateRandomId(companyName) {
            var randomString = Math.random().toString(36).substr(2, 4);
            return companyName + randomString;
        }

        // 랜덤 비밀번호 생성 함수
        function generateRandomPassword() {
            var randomPassword = Math.random().toString(36).substr(2, 8);
            return randomPassword;
        }

        // 최종 승인 신청 버튼 클릭 이벤트 처리
        $("#finalApprovalBtn").click(function () {
            // 최종 승인 신청 로직 처리
            alert("최종 승인 신청이 완료되었습니다.");
        });
    });
</script>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
