<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

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

	String absolutePathToolbar = request.getContextPath();
	String uName = (nameUser != null && nameUser.equals("posco")) ? "주문 관리자" : "기업회원:" + nameUser;
	String uImageURL = ImageURLUser != null ? ImageURLUser : absolutePathToolbar + "/img/undraw_profile.svg";

	if (nameUser == null) {
		// 세션이 없는 경우 로그인 페이지로 매핑
		response.sendRedirect(absolutePathToolbar + "/User/Login.jsp");
	}

%>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<div class="mr-auto"> <!-- 왼쪽 정렬 요소 -->
		<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle">
			<i class="fa fa-bars"></i>
		</button>
	</div>
	<ul class="navbar-nav ml-auto"> <!-- 오른쪽 정렬 요소 -->
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
			   aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= uName %></span>
				<img class="img-profile rounded-circle" src="<%= uImageURL %>">
			</a>
			<!-- Dropdown - User Information -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				 aria-labelledby="userDropdown">
				<!-- 로그아웃 기능 -->
				<a class="dropdown-item" href="LogoutServlet">
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div>
		</li>
	</ul>
</nav>
<!-- End of Topbar -->
