<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
   $(document).ready(function(){
      $('#sbtn').click(function(){
         var str = $('#body').val();
         // 로그인이 안된경우는 로그인 폼으로 보낸다.
         if(${SID eq null}){
            alert('로그인 창으로 전환됩니다.');
            $(location).attr('href', '/clsProj/member/login.cls');
         }
         if(!str || str.length > 50){
            // 입력내용이 없거나 입력내용의 길이가 50을 넘어가여 다시 입력하게 한다.
            $('#body').val(str.substr(0,50));
            return;
         }
         $('#frm').submit();
      });
   });
</script>
</head>
<body>
   <div class="w3-content mxw">
      <div class="w3-col">
         <h2 class="w3-indigo w3-center w3-card">방명록 작성</h2>
         <div class="w3-col w3-padding w3-card">
            <div class="w3-col">
               <label for="id" class="w3-col m4">아이디 : </label>
               <h6 class="w3-col m8">${SID}</h6>
            </div>
            <form class="w3-col w3-margin-bottom" method="post" action="/gBoard/gBoardProc.cls" id="frm">
               <input type="hidden" id=${SID} />
               <label for="body" class="w3-col">글내용 : </label>
               <textarea class="w3-col w3-border" name="body" id="body" cols="50" rows="5" style="resize: none;"></textarea>
            </form>
            <div class="w3-col">
               <div class="w3-half w3-button w3-red" id="hbtn">home</div>
               <div class="w3-half w3-button w3-blue" id="sbtn">submit</div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>