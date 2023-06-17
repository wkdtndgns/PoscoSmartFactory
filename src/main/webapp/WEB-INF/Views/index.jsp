<%@ page import="Dao.Company, java.util.List, Controller.Factory.Vo.FactoryProduction, java.text.DecimalFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <jsp:include page="./include/header.jsp"/>
  <!-- Page level plugins -->
  <script src="<%=request.getContextPath()%>/js/index/index.js"></script>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
  <jsp:include page="./include/sidebar.jsp"/>
  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">
      <jsp:include page="./include/toolbar.jsp"/>
      <%
        FactoryProduction factoryProduction = (FactoryProduction) request.getAttribute("factoryProduction");
        List<FactoryProduction> factoryProductionList = (List<FactoryProduction>) request.getAttribute("factoryProductionById");
        float totalCost = (float) request.getAttribute("totalCost");
        DecimalFormat formatter = new DecimalFormat("#,###");
      %>
      <!-- Begin Page Content -->
      <div class="container-fluid">
        <!-- Page Heading -->
        <!-- Content Row -->
        <div class="row">
          <!-- Earnings (Monthly) Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                      총 거래액
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=formatter.format(totalCost)%>원</div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Earnings (Monthly) Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                      양극재 총 생산량
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%= formatter.format(factoryProduction.getTotalCathodeProduction())%></div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Pending Requests Card Example -->
          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                      음극재 총 생산량
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%= formatter.format(factoryProduction.getTotalAnodeProduction())%></div>
                  </div>
                  <div class="col-auto">
                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">목표달성
                    </div>
                    <div class="row no-gutters align-items-center">
                      <div class="col-auto">
                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                      </div>
                      <div class="col">
                        <div class="progress progress-sm mr-2">
                          <div class="progress-bar bg-info" role="progressbar"
                               style="width: 50%" aria-valuenow="80" aria-valuemin="0"
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
          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div
                  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary"><%= factoryProductionList.get(0).getFactoryName()%></h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-pie pt-4 pb-2">
                  <input type="hidden" class="gFactoryCh" value="<%= factoryProductionList.get(0).getTotalCathodeProduction()%>" >
                  <input type="hidden" class="gFactoryAn" value="<%= factoryProductionList.get(0).getTotalAnodeProduction()%>" >
                  <canvas id="gFactory"></canvas>
                </div>
                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 양극재
                                        </span>
                  <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 음극재
                                        </span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div
                  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary"><%= factoryProductionList.get(1).getFactoryName()%></h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-pie pt-4 pb-2">
                  <input type="hidden" class="pFactoryCh" value="<%= factoryProductionList.get(1).getTotalCathodeProduction()%>" >
                  <input type="hidden" class="pFactoryAn" value="<%= factoryProductionList.get(1).getTotalAnodeProduction()%>" >
                  <canvas id="pFactory"></canvas>
                </div>
                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 양극재
                                        </span>
                  <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 음극재
                                        </span>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
              <!-- Card Header - Dropdown -->
              <div
                  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary"><%= factoryProductionList.get(2).getFactoryName()%></h6>
              </div>
              <!-- Card Body -->
              <div class="card-body">
                <div class="chart-pie pt-4 pb-2">
                  <input type="hidden" class="guFactoryCh" value="<%= factoryProductionList.get(2).getTotalCathodeProduction()%>" >
                  <input type="hidden" class="guFactoryAn" value="<%= factoryProductionList.get(2).getTotalAnodeProduction()%>" >
                  <canvas id="guFactory"></canvas>
                </div>
                <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 양극재
                                        </span>
                  <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 음극재
                                        </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row divMessage">

        </div>
        <!-- Content Row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <jsp:include page="./include/footer.jsp"/>
  </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Page level custom scripts -->
<script src="<%=request.getContextPath()%>/js/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/demo/chart-area-demo.js"></script>
<%--<script src="<%=request.getContextPath()%>/js/demo/chart-bar-demo.js"></script>--%>
<script src="<%=request.getContextPath()%>/js/demo/chart-pie-demo.js"></script>
</body>
</html>