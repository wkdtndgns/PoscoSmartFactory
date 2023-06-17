<%@ page import="Dao.Ratiom, java.util.List, org.bson.Document" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="../include/header.jsp"/>
  <script>
    $(document).ready(function() {
      $('#dataTable').DataTable();
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
            <h6 class="m-0 font-weight-bold text-primary">로그 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>메세지</th>
                  <th>시간</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Document> list = (List<Document>) request.getAttribute("list");
                  for (Document d : list) {
                %>
                <tr>
                  <td><%=d.get("message")%>
                  </td>
                  <td><%=d.get("timestamp")%>
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
  </div>
</div>
</div>
<jsp:include page="../include/footer.jsp"/>
</div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
</body>
</html>
