<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextPath}/views/css/Style-signUp.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/jquery-3.4.1.min.js"></script>

<style>
#idCheck {
	text-align: center;
}

#idCheck:hover {
	cursor: pointer;
}

#idCheck, #goMain, #joinBtn {
	background: #d3d3d3;
	color: gray;
	border-radius: 5px;
	width: 80px;
	height: 25px;
	text-align: center;
	color: white;
}

#idCheck:hover, #joinBtn:hover, #goMain:hover {
	cursor: pointer;
	color: red;
}

td {
	text-align: right;
}

#joinBtn {
	background: yellowgreen;
}

#joinBtn, #goMain {
	display: inline-block;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
<div class="container">
		<form id="joinForm" action="${contextPath }/insert.me" method="post" onsubmit="return insertMember()">
			<!--section1-->
			<div class="section1" style="padding-bottom: 90px;">
				<h1 style="color: black;">JOIN</h1>

				<hr style="border: 1px soild black;">
				<span>회원 가입<a style="color: red; font-size: 15px;">*</a></span>
				<hr style="border: 1px soild black;">

				<div class="artregi-infobox">
					<div class="info-box1">
						<label class="labelfirst" id="name">이름<a style="color: red; font-size: 15px;">*</a></label>
						<input class="nomal-text" type="text" id="userName" name="userName" placeholder="NAME" required>
					</div>
					<br>

					<div class="info-box2">
						<label class="labelfirst">아이디<a style="color: red; font-size: 15px;">*</a></label>
						<input class="nomal-text" type="text" id="userId" name="userId" required>
					</div>
					<div id="idresult" style="font-size: 13px; float: right;">영어,숫자
						상관없이 4글자이상 입력하세요.</div>
					<br> <br>
					<div id="idCheck" style="float: right; width: 100px; height: 20px; background-color: gray; text-align: center; color: white;">중복확인</div>
					<br> <br>

					<div class="info-box3">
						<label class="labelfirst">비밀번호<a
							style="color: red; font-size: 15px;">*</a></label> <input
							class="nomal-text" type="password" id="userPwd" name="userPwd"
							placeholder="PASSWORD" required>
					</div>
					<div id="pwdresult" style="font-size: 13px; float: right;">영어,숫자
						포함해서 6글자 이상 입력하세요.</div>


					<br>

					<div class="info-box4">
						<label class="labelfirst">비밀번호 확인<a style="color: red; font-size: 15px;">*</a></label> 
						<input class="nomal-text" type="password" id="userPwd2" name="userPwd2" placeholder="confirm password" required>
					</div>
					<div id="pwdcheck" style="font-size: 13px; float: right;"></div>

					<br> <br>

					<div class="info-box5">
						<label class="labelfirst">닉네임</label><input class="nomal-text" type="text" id="nickName" name="nickName" placeholder="NICKNAME">
					</div>

					<div class="info-box6">
						<label class="labelfirst">휴대폰 번호</label>
						
						<input type="tel" id="phone" name="phone" maxlength="11" autocomplete="off" placeholder="(-)없이 휴대폰 번호 기재" style="height: 25px; width: 280px; float: right;">

					</div>

					<div class="info-box7">
						<div>
							<label class="labelfirst">주소<a style="color: red; font-size: 15px;">*</a></label>
								
							<div style="float:right;">
							<input type="text" id="sample6_postcode" name="sample6_postcode"  placeholder="우편번호" style="width:188px;height:30px;">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="height:30px;"><br> 
							<input type="text" id="sample6_address"  name="sample6_address"  placeholder="주소" style="width:188px;height:30px;"><br> 
							<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소" style="width:188px;height:30px;">
							<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목" style="width:85px;height:30px;">

						
</div>
								
						</div>
						
					</div>

<br><br><br><br>
					<div class="info-box7">
						<label class="labelfirst">이메일<a style="color: red; font-size: 15px;">*</a></label>
						<input class="nomal-text" type="email" id="email" name="email" placeholder="@ 포함한 이메일 기재" required>
					</div>	
					</div>
				<!-- infobox 끝 -->
				<br> <br>
				<div class="submit-box" align="center">
					<div id="goMain" onclick="goMain();">메인으로</div>
					<input type="submit" value="가입하기" style="width: 280px; height: 30px; color: white; background: #cc0000">
				</div>
				<input type="hidden" id="checkTest" value="0">
				<!-- submit-box 끝 -->
			</div>
			<!-- section 끝-->
		</form>
	</div>
	<!-- container 끝-->
	
	<script>
	function goMain(){
		location.href="${contextPath}/index.jsp";
	}
	function insertMember(){
		      //아이디 중복 확인
		       if($("#checkTest").val() != "0"){
		         return true;
		      }else{
		         alert("중복확인 버튼을 체크해 주세요");
		         return false;
		      }
		   }
	
	   $(function(){
	          $("#userId").change(function(){
	             $("#checkTest").val(0);
	             $("#idCheck").css("background-color","gray");
	          });
	     
	          $("#idCheck").click(function(){
	             $("#checkTest").val(1);
	             var userId = $("#userId").val();
	
	             if(!userId || userId.length < 4){
	                alert("아이디는 최소 4자리 이상이어야합니다.");
	                userId.focus();
	             }else{
	                $.ajax({
	                   url: "${contextPath}/idCheck.me",
	                  type : "post",
	                  data : {userId:userId},
	                  success : function(data) {
	                	  if (data == 'fail') {
		                        alert("아이디가 중복 됩니다.");
		                        userId.focus();
		                     } else {
		                        alert("아이디가 사용가능합니다.");
		                        idCheck = 1;
		                        $("#idCheck").css("background-color","red");   //색을 빨간색으로 바꿔줌
		                     }
		                    
	                  },
	                  error : function(data) {
	                     console.log("서버 통신 안됨");
	                  }

	               })
	            }
	         })

	      });// ajax 중복
	      
	      //아이디 정규식
	      $(function(){
	    	  var idJ = /^[a-z0-9_]{4,20}$/;
	          var emailJ = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+$/;
	          var pwdJ = /^[a-z0-9_]{6,20}$/;
	    	  
	    	  $("#userId").change(function(){

                  if (idJ.test($(this).val())) {
                     $("#idresult").html("정상입력").css('color', 'green');
                     $(this).focus().css("background", "white");
                  } else {
                     $("#userId").val('');
                     $("#idresult").html("영어,숫자 사용해서 4글자이상 입력하세요.").css('color', 'red');
                     $(this).focus().css("background", "white");
                  }
               });
	    	  
	    	  //비밀번호 정규식
	    	  $("#userPwd").change(
	                  function() {
	                     if (pwdJ.test($(this).val())) {
	                        $("#pwdresult").html("정상입력").css('color', 'green');
	                        $(this).focus().css("bakcground", "white");
	                     } else {
	                        $("#userId").val('');
	                        $("#pwdresult").html("영어,숫자 사용해서 6글자 이상 입력하세요.")
	                              .css('color', 'red');
	                        $(this).focus().css("background", "white");
	                     }
	                  });
	    	  
	    	  //비밀번호 일치 확인
	    	  $("#userPwd2").change(function() {

	              if ($('#userPwd').val() != $(this).val()) {
	                 $('#pwdcheck').html('비밀번호 일치 x').css("color", 'red');
	                 $('#userPwd2').val('');
	                 $(this).focus();
	              } else {
	                 $("#pwdcheck").html('비밀번호 일치').css("color", 'green');
	              }
	           })
	           $("#userPwd").change(function() {
	              if ($('#userPwd2').val() != $(this).val()) {
	                 /*                 $('#pwdcheck').html('비밀번호 일치 x').css("color", 'red');
	                  */$('#userPwd2').val('');
	                 $('#userPwd2').focus();
	              } else {
	                 $('#pwdcheck').html('비밀번호 일치').css("color", 'green');
	              }
	           });

	        });
	</script>
	
	
	 <script
      /*주소 api*/
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>