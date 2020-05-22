<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
   $(function(){
    /*
	   $('#login').click(function(){
            $(location).attr('href','/clsProj/member/login.cls');
      });
    */
      $('.btn').click(function(){
    	 var tid = $(this).attr('id');
    	 var url = '';
    	 if(tid == 'login'){
    		 url = '/clsProj/member/login.cls';
    	} else if(tid == 'logout'){
    	 	url='/clsProj/member/LogoutProc.cls'
    	} else if(tid == 'join'){
    	 	url='/clsProj/member/joinForm.cls'
    	} else if(tid == 'gBoard'){
    	 	url='/clsProj/gBoard/gBoardList.cls'
    	} else if(tid == 'reBoard'){
    	 	url='/clsProj/reBoard/reBoard.cls'
    	} else if(tid == 'survey'){
    	 	url='/clsProj/survey/survey.cls'
    	} else if(tid == 'surveyAdd'){
    	 	url='/clsProj/survey/surveyAdd.cls'
    	} else if(tid == 'board'){
    	 	url='/clsProj/board/board.cls'
    	} else if(tid == 'empList'){
    	 	url='/clsProj/ajax/empList.cls'
    	}
    	 
    	 $(location).attr('href', url);
      });
   });
</script>
</head>
<body>
   <div class="w3-content mxw2">
   <div class="w3-brown w3-padding w3-margin-bottom w3-center">Cls project Main</div>
      <div class="w3-col">
         <c:if test="${empty SID }">
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="login">login</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="join">Join</div>
         </c:if>
         <c:if test="${not empty SID }">
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="logout">logout</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="gBoard">gBoard</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="survey">survey</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="surveyAdd">surveyAdd</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="board">board</div>
         </c:if>
         
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="reBoard">댓글게시판</div>
         <div class="btn w-150 inblock w3-button w3-green w3-margin" id="empList">사원리스트</div>
         
      </div>
   </div>
</body>
</html>