<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="include/header.jsp"/>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
  <jsp:include page="include/sidebar.jsp"/>
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
      <jsp:include page="include/toolbar.jsp"/>
      <!-- Begin Page Content  페이지 수정할때 여기만!-->
      <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800"></h1>
        </div>

        <div class="row">

          <!-- 개발된 양극재 -->
          <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                      보유중인 양극재 개수</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">40,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 개발된 음극재-->
          <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                     보유중인 음극재 개수</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800">5,000</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 오늘 생산해야될 양: 주문 들어온 개수의 합 -->
          <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">생산해야될 양
                    </div>
                    <div class="row no-gutters align-items-center">
                      <div class="col-auto">
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                      </div>
                      <div class="col">
                        <div class="progress progress-sm mr-2">
                          <div class="progress-bar bg-info" role="progressbar"
                               style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                               aria-valuemax="100"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">

          <div class="col-lg-6 mb-4">
            <div class="card shadow h-100">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">제품 판매 현황</h6>
              </div>
              <div class="card-body">
                그래프를 넣고싶음 양극재 몇개, 음극재 몇개
                <!-- 제품 판매 현황 내용 -->
              </div>
            </div>
          </div>

          <div class="col-lg-6 mb-4">
            <div class="card shadow h-100">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">실시간 모니터링</h6>
              </div>
              <div class="card-body">
                <!-- 실시간 모니터링 내용 -->
                막대 그래프로 얼만큼 생산하고 팔렸는지
              </div>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-lg-12 mb-4">
            <div class="card shadow h-100">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">공정 이동 대상</h6>
              </div>
              <div class="card-body">
                <!-- 공정 이동 대상 내용 -->
              </div>
            </div>
          </div>

        </div>

      </div>
          </div>
        </div>
      </div>
      <!-- End Page Content -->
    </div>
    <!-- End of Main Content -->
  </div>
  <!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->

<jsp:include page="include/footer.jsp" />

<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

</body>
</html>
