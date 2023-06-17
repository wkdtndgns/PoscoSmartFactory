<%@ page import="Dao.Production, java.util.List, Comm.ProductionStatus" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session.removeAttribute("username");
%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <jsp:include page="../include/header.jsp"/>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 버튼 클릭 시 아이디와 비밀번호 자동 입력
            $("#autoFillBtn").click(function() {
                $("#username").val("posco");
                $("#password").val("password");
            });

            $("#companyMemberBtn").click(function() {
                $("#username").val("ssg");
                $("#password").val("1234");
            });
        });
    </script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="../include/loginsidebar.jsp"/>
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 mb-4">
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">아이디/패스워드 로그인</h6>
                            </div>
                            <div class="card-body">
                                <form class="login-form" action="/User/LoginAction" method="post">
                                    <div class="form-group">
                                        <label for="username">아이디</label>
                                        <input type="text" id="username" name="username" class="form-control" placeholder="아이디를 입력하세요">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">패스워드</label>
                                        <input type="password" id="password" name="password" class="form-control" placeholder="패스워드를 입력하세요">
                                    </div>
                                    <button type="submit" class="btn btn-primary">로그인</button>
                                </form>
                                <button type="button" id="autoFillBtn" class="btn btn-secondary">자동 입력</button>
                                <button type="button" id="companyMemberBtn" class="btn btn-secondary">기업 회원</button>
                                <% if (request.getAttribute("errorMessage") != null) { %>
                                <script>
                                    $(document).ready(function() {
                                        alert("<%= request.getAttribute("errorMessage") %>");
                                    });
                                </script>
                                <% } %>
                            </div>
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

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
