<!-- Topbar -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
<% String absolutePathToolbar = request.getContextPath();%>
  <!-- Sidebar Toggle (Topbar) -->
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
    <i class="fa fa-bars"></i>
  </button>

  <!-- Topbar Search -->
  <form
      class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
  </form>
	<%
	String nameUser = null;
	String ImageURLUser = null;

	HttpSession nSession = request.getSession(false); // 새로운 세션을 생성하지 않고 현재 세션을 가져옴

	// 세션이 null이거나 무효화되었는지 확인
	if (nSession != null) {
		// 세션이 유효한 경우 세션 정보 가져오기
		nameUser = (String) nSession.getAttribute("username");
		ImageURLUser = (String) nSession.getAttribute("imageURL");
	}
//	String uName = nameUser.equals("posco") ? "주문 관리자" : "기업회원:" + nameUser;

	String uName = (nameUser != null && nameUser.equals("posco")) ? "주문 관리자" : "기업회원:" + nameUser;
	String uImageURL = ImageURLUser != null ? ImageURLUser : absolutePathToolbar + "/img/undraw_profile.svg";
	%>
	<li class="nav-item dropdown no-arrow" style="list-style: none;">
    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

      <span class="mr-2 d-none d-lg-inline tex
      t-gray-600 small"><%=uName %></span>
      <img class="img-profile rounded-circle"
        	src="<%=uImageURL %>">
    </a>
    <!-- Dropdown - User Information -->
    <!-- <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
         aria-labelledby="userDropdown">
      <a class="dropdown-item" href="#">
        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
        Profile
      </a>
      <a class="dropdown-item" href="#">
        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
        Settings
      </a>
      <a class="dropdown-item" href="#">
        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
        Activity Log
      </a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
        Logout
      </a>
    </div> -->
  </li>
</nav>
<!-- End of Topbar -->