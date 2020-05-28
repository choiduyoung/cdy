<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<link rel="stylesheet" href="/clsProj/css/member/user.css">
<link rel="stylesheet" href="/clsProj/css/bootstrap.min.css">
<link rel="stylesheet" href="/clsProj/css/member/text.css">
<link rel="stylesheet" href="/clsProj/css/nav.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>

</style>
<script type="text/javascript">
$(document).ready(function () {
	
	$('#dd').css('display', 'none');
	$('#cbtn').click(function(){
		$('#ee').css('display', 'none');
		$('#dd').css('display', '');
	});
	
	//패스워드 수정 
	$('#sbtn').click(function(){
		$("#curPwd").val($("#v_curPwd").val());
		$("#newPwd").val($("#v_newPwd").val());
		$("#chkNewPwd").val($("#v_chkNewPwd").val());
		$("#gb").val("1");
		
		$('#frm').attr("action", "/clsProj/member/change.cls");
		$('#frm').submit();
	});
	
	//회원탈퇴
	$('#mbr_out').click(function(){
		$("#gb").val("2");
		
		$('#frm').attr("action", "/clsProj/member/change.cls");
		$('#frm').submit();
	});
	
});

</script>
</head>
<body>
<form method="post" id="frm">
	<input type="hidden" name="mno" id="mno" value="${memberInfo.mno}">
	<input type="hidden" name="mname" id="mname" value="${memberInfo.mname}">
	<input type="hidden" name="mid" id="mid" value="${memberInfo.mid}">
	<input type="hidden" name="mtel" id="mtel" value="${memberInfo.mtel}">
	<input type="hidden" name="memail" id="memail" value="${memberInfo.memail}">
	
	<input type="hidden" name="curPwd" id="curPwd">
    <input type="hidden" name="newPwd" id="newPwd">
    <input type="hidden" name="chkNewPwd" id="chkNewPwd">
    
    <input type="hidden" name="gb" id="gb">
                     	
</form>
      <!-- nav 영역입니다-->
<div class="bg-white border-bottom fixed-top nav-body">
   <div class=" mt-2 nav-btn">
       <div class="member_nav text-right mt-3">
           <div class="ctQZg">
               <div class="_47KiJ">
                   <div class="XrOey"><a class="_0ZPOP kIKUG _4700r " href="#"><svg aria-label="활동 피드"
                               class="_8-yf5 " fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                               <path
                                   d="M34.6 6.1c5.7 0 10.4 5.2 10.4 11.5 0 6.8-5.9 11-11.5 16S25 41.3 24 41.9c-1.1-.7-4.7-4-9.5-8.3-5.7-5-11.5-9.2-11.5-16C3 11.3 7.7 6.1 13.4 6.1c4.2 0 6.5 2 8.1 4.3 1.9 2.6 2.2 3.9 2.5 3.9.3 0 .6-1.3 2.5-3.9 1.6-2.3 3.9-4.3 8.1-4.3m0-3c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5.6 0 1.1-.2 1.6-.5 1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z">
                               </path>
                           </svg></a>
                       <div class="_0Sl_t">
                           <div class="poA5q" style="margin-left: -423px;"></div>
                       </div>
                   </div>
                   <div class="XrOey"><a href="#"><svg aria-label="프로필" class="_8-yf5 " fill="#262626" height="24"
                               viewBox="0 0 48 48" width="24">
                               <path
                                   d="M24 26.7c7.4 0 13.4-6 13.4-13.4S31.4 0 24 0 10.6 6 10.6 13.4s6 13.3 13.4 13.3zM24 3c5.7 0 10.4 4.6 10.4 10.4S29.7 23.7 24 23.7s-10.4-4.6-10.4-10.4S18.3 3 24 3zm9.1 27.1H14.9c-7.4 0-13.4 6-13.4 13.4v3c0 .8.7 1.5 1.5 1.5s1.5-.7 1.5-1.5v-3c0-5.7 4.6-10.4 10.4-10.4h18.3c5.7 0 10.4 4.6 10.4 10.4v3c0 .8.7 1.5 1.5 1.5s1.5-.7 1.5-1.5v-3c-.1-7.4-6.1-13.4-13.5-13.4z">
                               </path>
                           </svg></a></div>
               </div>
               <!-- <a href="#" class="badge badge-light nav-item" id="join">Join</a>-->
               <a href="#" class="badge badge-light nav-item" id="login">LOGIN</a>
               <a href="#" class="badge badge-light nav-item" id="logout">LOGOUT</a>
           </div>
       </div>
   </div>
   <a class="navbar-brand tcolor logo" href="#" id="">
       YUMMY MAP
   </a>
   <div class="b-subtitle text-left"><p class="pt-3">마이페이지</p></div>
   <div class=" nav-item-1 d-flex justify-content-end">
       <a class="navbar-brand nav-item-size" href="#" id="">
           <i class="fas fa-gamepad"></i>
       </a>
       <a class="navbar-brand nav-item-size" href="#">
           <i class="far fa-clipboard"></i>
       </a>
   </div>
 </div>
 <!-- nav 마지막 입니다-->
 
 <!-- body 시작 입니다-->
   <div class="main-body por text-right">
      <div class="row">
         <div class="col-2 bor-bottom-top bor-right padd-right"> 
         <div class="padd-text mt-4">
            <a href="http://localhost/clsProj/member/member.cls">회원정보 변경</a>
         </div>
         <div class="padd-text">
            <a href="http://localhost/clsProj/member/text.cls">내가 쓴글 보기</a>
         </div>
         <div class="mar-top bor-bottom-or padd-text">
            <a href="#" id="mbr_out">회원탈퇴</a>
         </div>
         </div>
         <div class="col-8 text-center bor-bottom-top bor-bottom-or">
         <div class="mt-3">
            <h3>회원정보 변경</h3>
         </div>
            <div class="container">
               <div class="row mt-5 ">
                  <div class="col h90 border">
                  		<div class="col mt-3 text-left"><h5>이름 : ${memberInfo.mname}</h5></div>
                  		<div class="col mt-4 text-left"><h5>아이디 : ${memberInfo.mid}</h5></div>
                  </div>
                  <div class="col h90 border">
                  	<div id="ee">
                     <span>비밀번호 변경시 <br>수정버튼을 눌러주세요</span>
                     <div class="por-button">
                        <button type="button" class="btn btn-outline-dark"id="cbtn">수정</button>
                     </div>
                  	</div>
                     <div class=" por-input " id="dd" >
                     <div class="mt-2">
                     	<input type="password" id="v_curPwd" placeholder="현재비밀번호">
                     	<input type="password" id="v_newPwd" placeholder="변경비밀번호">
                     	<input type="password" id="v_chkNewPwd" placeholder="확인비밀번호">
                     </div>
                        <div class=" col por-button">
                        <button type="button" class="btn btn-outline-dark"id="sbtn">확인</button>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                <div class="border h90 col  text-left"><h5 class="mt-3">휴대전화 :${memberInfo.mtel}</h5></div>
                <div class="border  h90 col text-left"><h5 class="mt-3">이메일 :${memberInfo.memail}</h5 ></div>
               </div>

            </div>
         </div>
      </div>
   </div>
 <!-- body 마지막 입니다-->
</body>
</html>