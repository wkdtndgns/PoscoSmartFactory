<!-- Sidebar -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
  $(document).ready(function () {
    var menuData = [
      {text: "Home", href: "/company/companyhome"},
      {text: "주문 내역", href: "/company/ordercheck"},
      {text: "양극재 주문", href: "/order/cathodorder"},
      {text: "음극재 주문", href: "/order/anodeorder"},
      {text: "문의하기", href: "https://open.kakao.com/o/s7D4s6pf"},
    ];

    var $menu = $("#accordionSidebar");
    // 메뉴 데이터를 기반으로 메뉴 아이템을 동적으로 생성하고 링크 및 active 클래스를 설정
    for (var i = 0; i < menuData.length; i++) {
      var menuItem = menuData[i];
      var $menuItem = document.createElement('li');
      $menuItem.classList.add('nav-item');

      var $link = document.createElement('a');
      $link.classList.add('nav-link');
      $link.href = menuItem.href;

      var $icon = document.createElement('i');
      $icon.classList.add('fas', 'fa-fw', 'fa-tachometer-alt');

      var $text = document.createElement('span');
      $text.textContent = menuItem.text;

      $link.appendChild($icon);
      $link.appendChild($text);

      $menuItem.appendChild($link);

      // 현재 URL 경로와 링크 경로를 비교하여 active 클래스 추가
      if (window.location.pathname === menuItem.href) {
        $menuItem.classList.add('active');
      }

      $menu.append($menuItem);
    }
  });
</script>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  <!-- Sidebar - Brand -->
  <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
    <div class="sidebar-brand-icon rotate-n-15">
      <i class="fas fa-laugh-wink"></i>
    </div>
    <div class="sidebar-brand-text mx-3">Smart Factory<sup></sup></div>
  </a>
  <!-- Divider -->
  <hr class="sidebar-divider my-0">
  <!-- Nav Item - Dashboard -->
</ul>
