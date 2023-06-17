<%@ page import="Dao.Ratiom, java.util.List" %>
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
            <h6 class="m-0 font-weight-bold text-primary">양극재 비율 목록</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>id</th>
                  <th>리튬 비율</th>
                  <th>니켈 비율</th>
                  <th>코발트 비율</th>
                  <th>망간 비율</th>
                  <th>알루미늄 비율</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Ratiom> ratiomList = (List<Ratiom>) request.getAttribute("ratioms");
                  for (Ratiom r : ratiomList) {
                %>
                <tr>
                  <td><%=r.getId()%>
                  </td>
                  <td><%= r.getLithium() %> %
                  </td>
                  <td><%= r.getNickel() %> %
                  </td>
                  <td><%= r.getCobalt() %> %
                  </td>
                  <td><%= r.getManganese() %> %
                  </td>
                  <td><%= r.getaluminium() %> %
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
