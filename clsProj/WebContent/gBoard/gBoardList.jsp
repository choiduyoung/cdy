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
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#lbtn').click(function(){
		$(location).attr('href','/clsProj/gBoard/gBoardWrite.cls');
	});
	$('#hbtn').click(function(){
		$(location).attr('href','/clsProj/main/main.cls');
	});
});
</script>
</head>
<body>
   <div class="w3-content mxw2 ">
      <div class="w3-col">
         <h2 class="w3-blue w3-center ">방명록 리스트</h2>
         <div class="w3-col  ">
            <div class="w3-col m2 w3-right  w3-button w3-tiny w3-blue w3-center" id="lbtn">글쓰기</div>
            <div class="w3-col m2 w3-right w3-button w3-tiny w3-green w3-center" id='hbtn'>Home</div>
         </div>
         <c:if test="${not empty LIST}">
            <c:forEach var="data" items="${LIST}">
               <div class="w3-col w3-border w3-margin-bottom">
                  <div class="w3-col m2 h-100p w3-center pd-10 w3-border-right">
                     <img class="h-80p w-auto" src="/clsProj/img/${vo.avatar}"/>
                  </div>
                  <div class="w3-rest pdh-10">
                     <div class="w3-col w3-border-bottom" id="${vo.gno}">
                        <h5 class="w3-half w3-left-align" style="margin: 0px; padding-left: 10px;">${vo.id}</h5>
                        <h6 class="w3-half w3-right-align" style="margin: 0px; padding-right: 10px;">${vo.gdate}</h6>
                     </div>
                     <div class="w3-col">
                        <h6 class="w3-padding">${vo.body}</h6>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </c:if>
         <c:if test="${empty LIST}">
            <div class="w3-col w3-border w3-margin-bottom w3-card" id="gmsg">
               <h3 class="w3-padding w3-center">아직 작성된 글이 없습니다.</h3>
            </div>
         </c:if>
		</div>
      </div>
</body>
</html>