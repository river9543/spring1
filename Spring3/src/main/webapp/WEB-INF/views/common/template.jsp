<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Board</title>
</head>
<body>

<div class="container">
  <jsp:include page="../common/header.jsp"></jsp:include>
  <h2>spring 03 ver</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Spring 03 ver</div>
    <div class="panel-body">
    <button onclick="loadList()">게시글 보기</button>
    
    
    </div>

   

    <div class="panel-footer">2025 river9543</div>
  </div>
</div>



</body>
</html>
