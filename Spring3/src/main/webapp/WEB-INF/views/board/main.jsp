<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <div class="panel-heading">게시판</div>

    <!-- 게시글 목록 -->
    <div class="panel-body" id="listForm">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회수</td>
          </tr>
        </thead>

        <tbody id="view">
          <!-- 게시글 목록 비동기로 출력됨 -->
        </tbody>

        <tbody>
          <tr>
            <td colspan="5">
              <button class="btn btn-primary btn-sm" onclick="goForm()">글쓰기</button>
            </td>
          </tr>
        </tbody>
      </table>

      <button onclick="loadList()">게시글 보기</button>
    </div>

    <!-- 게시글 작성하는 곳 -->
    
    <div class="panel-body" id="wform" style="display: none">
      <form id="frm">
        <table class="table table-bordered table-hover">
          <tr>
            <td>제목</td>
            <td><input type="text" name="title" class="form-control" required></td>
          </tr>

          <tr>
            <td>내용</td>
            <td><textarea name="content" rows="7" class="form-control" required></textarea></td>
          </tr>

          <tr>
            <td>작성자</td>
            <td><input type="text" name="writer" class="form-control" required></td>
          </tr>

          <tr>
            <td colspan="2" align="center">
              <button type="button" onclick="goInsert()" class="btn btn-primary">등록</button>
              <button type="reset" id="fclear" class="btn btn-default" onclick="cancelForm()">취소</button>
              <button type="button" onclick="goList()" class="btn btn-info">목록</button>
            </td>
          </tr>
        </table>
      </form>
    </div>

    <div class="panel-footer">2025</div>
  </div>
</div>

<!-- 자바스크립트 영역 -->
<script type="text/javascript">

$(document).ready(function() {
  loadList();
});

function goForm() {
  $("#listForm").hide();
  $("#wform").show();
}

function goContent(idx){
  if ($("#c" + idx).css("display") == "none") {
	  
	  $.ajax({
		  url:"board/"+idx,
		  type:"get",
		  //data:{"idx":idx},
		  success:function(data){
			 //console.log(data);
			 $("#ta"+idx).val(data.content);
			 
			  
		  },
		  error: function() {
		      alert("데이터를 불러오는 데 실패했습니다.");
		    }
		  
	  });
	  
	  
    $("#c" + idx).css("display", "table-row");
    $("#ta"+idx).attr("readonly",true);
  } else {
    $("#c" + idx).css("display", "none");
    
    $.ajax({
    	url:"board/count/"+idx,
    	type:"put",
    	//data:{"idx":idx},//보내야하는 매개변수
    	success:loadList,
    	error: function() {
		      alert("데이터를 불러오는 데 실패했습니다.");
		    }
    	
    });
  }
}

function goInsert() {
  var fData = $("#frm").serialize();
  
  $.ajax({
    url: "board/new",
    type: "post",
    data: fData,
    success: loadList,
    error: function() {
      alert("데이터를 불러오는 데 실패했습니다.");
    }
  });

  $("#fclear").trigger("click");
}

function cancelForm() {
  // 이 함수는 현재 빈 함수지만 나중에 취소 관련 처리 추가 가능
}

function goList(){
  $("#listForm").css("display", "block");
  $("#wform").css("display", "none");
}

function loadList() {
  $.ajax({
    url: "board/all",/*어디로 요청할 것인지*/
    type: "get",/*어떤 방식으로 요청할것인지(get,post)*/
    dataType: "json",/*어떤 방식으로 데이터를 가져올것인지(xml,text,json)*/
    success: makeView,/*요청 성공시 실행할 함수입력(콜백함수)*/
    error: function() {
      alert("데이터를 불러오는 데 실패했습니다.");
    }
  });
}

function goUpdateForm(idx){
	$("#ta"+idx).attr("readonly",false);
	
	var title=$("#t"+idx).text();
	var writer=$("#w"+idx).text();
	
	var newTitle="<input id='nt"+idx+"' type='text' class='form-control' value='"+title+"'>";
	var newWriter="<input id='nw"+idx+"' type='text' class='form-control' value='"+writer+"'>";

    $("#t"+idx).html(newTitle);
    $("#w"+idx).html(newWriter);
    
    var newButton="<button onclick='goUpdate("+idx+")' class='btn btn-sm btn-primary'>수정하기</button>";
    $("#ub"+idx).html(newButton);
}

function goUpdate(idx){
	//게시글 수정하기(비동기)
	//인자 없이 호출: getter 역할 (현재 값을 가져옵니다)
    //인자와 함께 호출: setter 역할 (값을 설정합니다)
	var title=$("#nt"+idx).val();
	var writer=$("#nw"+idx).val();
	var content=$("#ta"+idx).val();
	
	$.ajax({
		url:"board/update",
		type:"put",//어떤 방식으로 요청할것인지
		contentType:"application/json;charset=utf-8",//서버에 보낼 데이터의 형식을 지정
		data:JSON.stringify({"idx":idx,"title":title,"content":content,"writer":writer}),////보내야하는 매개변수
		success:loadList,
		error: function() {
		      alert("데이터를 불러오는 데 실패했습니다.");
		    }
	});
	
}

function goDelete(idx) {
  $.ajax({
    url: "board/"+idx,//controller/board/delete?idx=9이 아닌 controller/board/9
    type: "delete",//어떤 방식으로 요청할것인지
   //data: { "idx": idx },
    success: loadList,
    error: function() {
      alert("데이터를 불러오는 데 실패했습니다.");
    }
  });
}

function makeView(data) {
  var listHtml = "";

  $.each(data, function(index, obj) {
    listHtml += "<tr>";
    listHtml += "<td>" + (index + 1) + "</td>";
    listHtml += "<td id='t"+obj.idx+"'><a href='javascript:goContent(" + obj.idx + ")'>" + obj.title + "</a></td>";
    listHtml += "<td id='w"+obj.idx+"'>" + obj.writer + "</td>";
    listHtml += "<td>" + obj.indate + "</td>";
    listHtml += "<td>" + obj.count + "</td>";
    listHtml += "</tr>";

    listHtml += "<tr id='c" + obj.idx + "' style='display:none'>";
    listHtml += "<td>내용</td>";
    listHtml += "<td colspan='4'>";
    listHtml += "<textarea id='ta"+obj.idx+"' readonly rows='7' class='form-control'></textarea>";
    
    //수정 삭제 버튼 추가
    listHtml += "<br>";
    listHtml += "<span id='ub"+obj.idx+"'>";
    listHtml += "<button class='btn btn-sm btn-success' onclick='goUpdateForm("+obj.idx+")'>수정</button> &nbsp;";
    listHtml += "</span>";
    listHtml += "<button class='btn btn-sm btn-warning' onclick='goDelete(" + obj.idx + ")'>삭제</button> &nbsp;";
    listHtml += "</td>";
    listHtml += "</tr>";
  });

  $("#view").html(listHtml);
  goList();
}
</script>

</body>
</html>
