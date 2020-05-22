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
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-content mxw">
		<h2 class="w3-center w3-padding w3-pink w3-margin-top w3-margin-bottom w3-card">설문조사</h2>
		<div class="w3-container">
			<div class="w3-col w3-border w3-card w3-margin-bottom w3-lime">
				<h4 class="w3-center ">${TITLE}</h4>
			</div>
			<div class="w3-col w3-border w3-card w3-margin-bottom pv-50" >
				
				<form method="post" action="/clsProj/survey/surveyProc.cls" id="frm">
					<input type="hidden" name="sino" value="${SINO}">
					<c:forEach var="data" items="${LIST}" varStatus="st">
					<!-- 설문 문항 -->
					<input type="hidden" name="sno" value="${data.sno}">
					<h6 class="pd-left-20 w3-margin-bottom ">
						${st.count}. ${data.sq}
					</h6>
					<!-- 설문 보기 -->
						<h6 class="pd-left-80" >
							<input type="radio" name="${data.sno}" value="1">
							<span class="pd-left-10">1) ${data.sa1}</span>
						</h6>
						<h6 class="pd-left-80" >
							<input type="radio" name="${data.sno}" value="2">
							<span class="pd-left-10">2) ${data.sa2}</span>
						</h6>
						<h6 class="pd-left-80" >
							<input type="radio" name="${data.sno}" value="3">
							<span class="pd-left-10">3) ${data.sa3}</span>
						</h6>
						<h6 class="pd-left-80" >
							<input type="radio" name="${data.sno}" value="4">
							<span class="pd-left-10">4) ${data.sa4}</span>
						</h6>
					</c:forEach>
				</form>
			</div>
			<div class="w3-col w3-border w3-card">
				<div class="w3-half w3-button w3-red" id="cbtn">cancel</div>
				<div class="w3-half w3-button w3-blue" id="sbtn">submit</div>
			</div>
		</div>
	</div>
</body>
</html>