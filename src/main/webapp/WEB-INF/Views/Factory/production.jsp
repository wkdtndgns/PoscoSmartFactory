<%--
  Created by IntelliJ IDEA.
  User: w
  Date: 2023/06/16
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="../../favicon.ico">

  <title>광양 공장</title>

  <!-- 부트스트랩 -->
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  <style>
    body {
      padding-top: 40px;
      padding-bottom: 40px;
      background-color: #eee;
    }

    .form-signin {
      max-width: 330px;
      padding: 15px;
      margin: 0 auto;
    }

    .form-signin .form-signin-heading,
    .form-signin .checkbox {
      margin-bottom: 10px;
    }

    .form-signin .checkbox {
      font-weight: normal;
    }

    .form-signin .form-control {
      position: relative;
      height: auto;
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      padding: 10px;
      font-size: 16px;
    }

    .form-signin .form-control:focus {
      z-index: 2;
    }

    .form-signin input[type="email"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }

    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }

    .div {
      margin-bottom: 20px;
    }
  </style>

  <script>
    document.addEventListener("DOMContentLoaded", function () {
      document.getElementById('btnSuccess').addEventListener('click', function () {
        let orderNo = document.getElementById('orderNo').value;
        if (orderNo > 0) {
          fetch('/sse/success/' + orderNo)
          .then(response => response.json())
          .then(data => alert("처리되었습니다."))
          .catch((error) => {
            console.error('Error:', error);
          });
        } else {
          alert("주문번호를 확인해주세요.");
        }
      });

      document.getElementById('btnDanger').addEventListener('click', function () {
        let orderNo = document.getElementById('orderNo').value;
        if (orderNo > 0) {
          fetch('/sse/danger/' + orderNo)
          .then(response => response.json())
          .then(data => alert("처리되었습니다."))
          .catch((error) => {
            console.error('Error:', error);
          });
        } else {
          alert("주문번호를 확인해주세요.");
        }
      });
    });
  </script>

</head>
<body>
<div class="container">

  <div class="form-signin">
    <h2 class="form-signin-heading">생산관리</h2>
    <div class="div">
      <label for="orderNo" class="sr-only">주문번호 </label>
      <input type="number" id="orderNo" class="form-control" placeholder="21" required="" autofocus="">
    </div>
    <div class="div">
      <button id="btnSuccess" class="btn btn-lg btn-success btn-block" type="submit">생산완료</button>
    </div>
    <div class="div">
      <button id="btnDanger" class="btn btn-lg btn-danger btn-block" type="submit">비상!!!</button>
    </div>
  </div>
</div>
</body>
</html>
