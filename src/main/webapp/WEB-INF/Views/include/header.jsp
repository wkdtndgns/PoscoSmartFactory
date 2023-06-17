<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SmartFactory</title>
<!-- Custom fonts for this template-->

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<%--<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
<%
    String nameUser = null;
    String ImageURLUser = null;
    String contextPath = request.getContextPath(); // 현재 컨텍스트 경로 가져오기
    HttpSession nSession = request.getSession(false); // 새로운 세션을 생성하지 않고 현재 세션을 가져옴
    if (nSession != null) {
        // 세션이 유효한 경우 세션 정보 가져오기
        nameUser = (String) nSession.getAttribute("username");
        ImageURLUser = (String) nSession.getAttribute("imageURL");
    }

    if (nameUser == null) {
        // 세션이 없는 경우 로그인 페이지로 매핑
        response.sendRedirect(contextPath + "/User/Login");
    }
%>
<!-- Custom styles for this template-->
<link href="<%= request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
<link href="<%= request.getContextPath()%>/css/table/dataTables.bootstrap4.css" rel="stylesheet">
<script src="<%= request.getContextPath()%>/js/table/jquery.dataTables.js"></script>
<script src="<%= request.getContextPath()%>/js/table/dataTables.bootstrap4.js"></script>
