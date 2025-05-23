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
    
    <form action="${contextPath}/join.do" method="post">
    
    <input type="hidden" id="memPassword" name="memPassword" value="">
    
    <table class="table table-bordered" style="text-align:center; border: 1px solid #dddddd">
    <tr>
    <td style="width:110px; vertical-align: middle;">아이디</td>
    <td><input type="text" id="memID" name="memID" class="form-control" placeholder="아이디를 입력하세요." maxlength="20"></td>
    
    <td style="width:110px;">
    <button type="button" onclick="registerCheck()" class="btn btn-sm btn-primary">중복확인</button>
    </td>
    
    <tr>
    <td style="width:110px; vertical-align: middle;">비밀번호</td>
    <td colspan="2"><input onkeyup="passwordCheck()" id="memPassword1" name="memPassword1" type="password" class="form-control" placeholder="비밀번호를 입력하세요."></td>
    </tr>
    
    
    <tr>
    <td style="width:110px; vertical-align: middle;">비밀번호 확인</td>
    <td colspan="2"><input onkeyup="passwordCheck()" id="memPassword2" name="memPassword2" type="password" class="form-control" placeholder="비밀번호를 확인하세요."></td>
    </tr>
    
    <tr>
    <td style="width:110px; vertical-align: middle;">사용자 이름</td>
    <td colspan="2"><input type="text" id="memName" name="memName" class="form-control" placeholder="이름을 입력하세요." maxlength="20"></td>
    </tr>
    
    <tr>
    <td style="width:110px; vertical-align: middle;">나이</td>
    <td colspan="2"><input type="number" id="memAge" name="memAge" class="form-control" placeholder="나이를 입력하세요." maxlength="20"></td>
    </tr>
    
    <tr>
    <td style="width:110px; vertical-align: middle;">성별</td>
    <td colspan="2">
    <div class="form-group" style="text-align: center;margin:0 auto;">
    
    <div class="btn-group" data-toggle="buttons">
    
    
    <label class="btn btn-primary active">
    <input type="radio" id="memGender" name="memGender" autocomplete="off" checked="checked"/>남자
    </label>
    
    <label class="btn btn-primary">
    <input type="radio" id="memGender" name="memGender" autocomplete="off" />여자
    </label>
    
    
    </div>
    
    </div>
    </td>
    </tr>
    
    
     <tr>
    <td style="width:110px; vertical-align: middle;">이메일</td>
    <td colspan="2"><input type="email" id="memEmail" name="memEmail" class="form-control" placeholder="이메일를 입력하세요." maxlength="50"></td>
    </tr>
    
    <tr>
    <td colspan="3" style="text-align: left;">
    <span id="passMessage" style="color: red"></span>
    <input type="submit" class="btn btn-primary btn-sm pull-right" value="등록">
    </tr>
    
 
    </tr>
    </table>
    
    </form>
   
    
    
    </div>

   

    <div class="panel-footer">2025 KIM HYUNGSEO</div>
  </div>
</div>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">메세지 확인</h4>
      </div>
      <div class="modal-body">
        <p id="checkMessage"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

<script type="text/javascript">

function passwordCheck(){
	var memPassword1=$("#memPassword1").val();
	var memPassword2=$("#memPassword2").val();
	
	//console.log(memPassword1+"/"+memPassword2);
	if(memPassword1!=memPassword2){
		$("#passMessage").html("비밀번호가 일치하지 않습니다.");
	}else{
		$("#passMessage").html("");
		$("#memPassword").val(memPassword1);
	}
}



function registerCheck(){
    // 아이디 중복체크 기능 (비동기)
    var memID = $("#memID").val();
    // alert(memID); // 아이디 값 확인용

    $.ajax({
        url: "${contextPath}/registerCheck.do", // 실제 등록 체크 URL로 수정
        type: "get",
        data: { "memID": memID }, // memID를 정확히 전달
        success: function(data) {
            // 중복 유무(data=1: 사용가능, data=0: 사용불가능)
            if (data == 1) {
                $("#checkMessage").text("사용할수있는 아이디입니다.");
            } else if (data == 0) {
                $("#checkMessage").text("사용할수없는 아이디입니다.");
            }
            
            $("#myModal").modal("show");
        },
        error: function() {
            alert("중복 체크 실패. 다시 시도해주세요.");
        }
    });
}
</script>



</body>
</html>
