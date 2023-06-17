<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

<style>

	.btn-group-sm>.btn, .btn-sm {
		padding: .25rem .5rem;
		font-size: 0.875rem;
		line-height: 3.5;
		border-radius: .2rem;
	}
</style>

<%

	String nameUser = null;
	String ImageURLUser = null;
	String contextPath = request.getContextPath(); // 현재 컨텍스트 경로 가져오기

	HttpSession nSession = request.getSession(false); // 새로운 세션을 생성하지 않고 현재 세션을 가져옴

	// 세션이 null이거나 무효화되었는지 확인
	if (nSession != null) {
		// 세션이 유효한 경우 세션 정보 가져오기
		nameUser = (String) nSession.getAttribute("username");
		ImageURLUser = (String) nSession.getAttribute("imageURL");
	}

	String uName = (nameUser != null && nameUser.equals("posco")) ? "주문 관리자" : "기업회1원:" + nameUser;
	String uImageURL = ImageURLUser != null ? ImageURLUser : contextPath + "/img/undraw_profile.svg";
	if (nameUser == null) {
		System.out.println("세션이 없어요");
		System.out.println(contextPath+"체크해줘");
		// 세션이 없는 경우 로그인 페이지로 매핑
		response.sendRedirect(contextPath + "/User/Login");
	}


	// 로그아웃 처리
	String logoutURL = contextPath + "/User/Login";
	if (nSession != null) {
		nSession.invalidate(); // 세션 초기화
	}
%>

<!-- Topbar -->
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	<button id="sidebarToggleTop" class="btn btn-link rounded-circle">
		<i class="fa fa-bars"></i>
	</button>
	<ul class="navbar-nav ml-auto"> <!-- 오른쪽 정렬 요소 -->
		<li class="nav-item" style="line-height: 40px;">
			<a href="<%= logoutURL %>" class="btn btn-outline-none btn-sm" style="margin-top: 5px;">Logout</a>
		</li>

		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
			   aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small" style="line-height: 40px;"><%= uName %></span>
				<img class="img-profile rounded-circle" src="<%= uImageURL %>" style="height: 40px; width: 40px;">
			</a>
		</li>
	</ul>
</nav>
<!-- End of Topbar -->

<!-- End of Topbar -->
