<%--
  Created by IntelliJ IDEA.
  User: kimminju
  Date: 2023/06/15
  Time: 1:20 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="include/header.jsp" />
</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="include/sidebar.jsp" />
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="include/toolbar.jsp" />
            <!-- Begin Page Content -->
            <div class="container">
                <h2>공장관리</h2>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="factory-select">공장</label>
                            <select class="form-control" id="factory-select">
                                <option>양극재 광양공장</option>
                                <option>양극재 구미공장</option>
                                <option>양극재 포항공장</option>
                                <option>음극재 세종1공장</option>
                                <option>음극재 세종2공장</option>
                                <option>음극재 포항공장</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="btn-group" role="group" aria-label="지역 선택">
                            <button type="button" class="btn btn-secondary">구미</button>
                            <button type="button" class="btn btn-secondary">광양</button>
                            <button type="button" class="btn btn-secondary">포항</button>
                            <button type="button" class="btn btn-secondary">세종</button>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="product-type" id="product-type-1" value="양극재" checked>
                            <label class="form-check-label" for="product-type-1">
                                양극재
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="product-type" id="product-type-2" value="음극재">
                            <label class="form-check-label" for="product-type-2">
                                음극재
                            </label>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="date-picker">생성일시</label>
                            <input type="date" class="form-control" id="date-picker">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h4>자원목록</h4>
                        <div class="table-responsive">
                            <table class="table table-striped table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">공장</th>
                                    <th scope="col">지역</th>
                                    <th scope="col">품목</th>
                                    <th scope="col">생성일시</th>
                                    <th scope="col">지시수량</th>
                                    <th scope="col">생산수량</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>random</td>
                                    <td>data</td>
                                    <td>placeholder</td>
                                    <td>text</td>
                                    <td>지시수량</td>
                                    <td>생산수량</td>
                                </tr>
                                <!-- 다른 데이터 행 추가 -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<jsp:include page="include/footer.jsp" />
</body>

</html>
