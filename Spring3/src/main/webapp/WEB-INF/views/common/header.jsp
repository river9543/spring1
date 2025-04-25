<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!-- 메뉴바 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${contextPath}/">river9543의 홈페이지</a>
    </div>

    <!-- 왼쪽 메뉴 -->
    <ul class="nav navbar-nav">
      <li class="active"><a href="${contextPath}/">Home</a></li>
      <li><a href="${contextPath}/boardMain.do">게시판</a></li>
    </ul>

    <!-- 오른쪽 메뉴 -->
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">접속하기 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="joinForm.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
        </ul>
      </li>
    </ul>

  </div>
</nav>
