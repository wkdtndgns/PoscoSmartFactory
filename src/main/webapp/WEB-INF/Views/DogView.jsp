<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.LinkedList, Pack01.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>

<h1>DogView.jsp</h1>
<%
  int num = (int) request.getAttribute("num");
  String str = (String) request.getAttribute("str");
  int[] ar = (int[]) request.getAttribute("ar");
  for (int v : ar) {
    out.println(v);
  }
  out.println("<br/>");

  Person person = (Person) request.getAttribute("p");
  out.println(person.getId());
  out.println(person.getPw());
  out.println("<br/>");
  @SuppressWarnings("unchecked")
  LinkedList<Integer> li = (LinkedList<Integer>) request.getAttribute("list");

  out.println(li.get(0));
  out.println(li.get(1));
  out.println(li.get(2));
  out.println("<br/>");
  @SuppressWarnings("unchecked")
  LinkedList<Person> li2 = (LinkedList<Person>) request.getAttribute("list2");

  out.println(li2.get(0).getId() + li2.get(0).getPw());
%>
<%= num%><br/>
<%= str%><br/>
<c:forEach var="a" items="${list2}" varStatus="b">
  ${b.index} : ${a.getId()} ${a.getPw()} <br/>
</c:forEach>
</body>
</html>

<%--${name} : jsp 의 EL식--%>