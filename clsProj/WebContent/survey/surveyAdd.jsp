<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 조사 페이지</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<link rel="stylesheet" href="/clsProj/css/user.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/clsProj/js/survey.js"></script>
<style>
   label {
      margin-top: 10px;
   }

</style>
<script type="text/javascript">
    $(function() {
      $('.frm2').css('display', 'none');
   }); 
    
    
</script>
</head>
<body>
     <div class="w3-content mxw">
        <h2 class="w3-indigo w3-card w3-padding w3-center w3-margin-bottom">설문 정보 입력</h2>
        <form action="/clsProj/survey/surveyInfoProc.ck" method="post" class="w3-col w3-card w3-padding frm1" id="frm1">
        <div class="w3-row w3-padding">
           <label class="w-150 w3-col w3-right-align" for="title">설문 주제 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="title" name="title">
           </div>
        </div>
        <div class="w3-row w3-padding">
           <label class="w-150 w3-col w3-right-align" for="start">설문 시작 시간 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="date" id="start" name="start">
           </div>
        </div>
        <div class="w3-row w3-padding"">
           <label class="w-150 w3-col w3-right-align" for="end">설문 종료 시간 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="date" id="end" name="end">
           </div>
        </div>
        </form>
        <div class="w3-col w3-margin-top w3-card frm1">
           <div class="w3-half w3-green w3-hover-lime w3-button" id="hbtn">Home</div>
           <div class="w3-half w3-blue w3-hover-aqua w3-button" id="addIbtn">설문정보등록</div>
        </div>
        
        <!-- 설문 문항 등록  -->
        <h4 class="w3-center w3-lime w3-padding w3-margin-bottom frm2 w3-card" id="">* ${TITLE}</h4>
        <input type="hidden" name="sino" id="sino" value="${SINO}"> 
        <form action="/clsProj/survey/surveyInfoProc.cls" method="post" class="w3-col w3-card w3-padding frm2" id="frm2">
        <div class="w3-row w3-padding"">
           <label class="w-150 w3-col w3-right-align" for="sq">설문 문항 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="sq" name="sq">
           </div>
        </div>
        <div class="w3-row w3-padding">
           <label class="w-150 w3-col w3-right-align" for="sa1">보기 1 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="sa1" name="sa1">
           </div>
        </div>
        <div class="w3-row w3-padding"">
           <label class="w-150 w3-col w3-right-align" for="sa2">보기 2 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="sa2" name="sa2">
           </div>
        </div>
        <div class="w3-row w3-padding"">
           <label class="w-150 w3-col w3-right-align" for="sa3">보기 3 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="sa3" name="sa3">
           </div>
        </div>
        <div class="w3-row w3-padding"">
           <label class="w-150 w3-col w3-right-align" for="sa4">보기 4 : </label>
           <div class="w3-rest pd-left-10">
              <input class="w3-rest w3-input w3-border" type="text" id="sa4" name="sa4">
           </div>
        </div>
        </form>
        <div class="w3-col w3-margin-top w3-card frm2">
           <div class="w3-half w3-green w3-hover-lime w3-button" id="hbtn">Home</div>
           <div class="w3-half w3-blue w3-hover-aqua w3-button" id="addQA">설문보기등록</div>
        </div>
     </div>
</body>
</html>