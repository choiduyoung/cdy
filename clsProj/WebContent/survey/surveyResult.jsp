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
				<div>
					<c:forEach var="data" items="${LIST}" varStatus="st">
						<input type="hidden" name="sino" value="${SINO}">
						<!-- 설문 문항 -->
						<input type="hidden" name="sno" value="${data.sno}">
						<h6 class="pd-left-20 w3-margin-bottom ">
							${st.count}. ${data.sq}
						</h6>
						<!-- 설문 보기 -->
						<div>
							<div class="w3- col w-100 w3-center">
								<h2>보기1</h2>
								<h4 class="w3-blue">${Math.floor(data.sack1 * 100 / data.satotal)} %</h4>
							</div>
							<div class="w3-rest">
								<div class="pd-left-80" >
									<h5 class="pd-left-10">${data.sa1}</h5>
									<div class="w3-col pd-left-10">
										<div class="w3-blue" style="width: ${data.sack1 * 100/data.satotal}%;"></div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="w3- col w-100 w3-center">
								<h3>보기2</h3>
								<h3 class="w3-blue">${Math.floor(data.sack2 * 100 / data.satotal)} %</h3>
							</div>
							<div class="w3-rest">
								<div class="pd-left-80" >
									<h5 class="pd-left-10">${data.sa2}</h5>
									<div class="w3-col pd-left-10">
										<div class="w3-blue" style="width: ${Math.floor(data.sack2 * 100/data.satotal)}%;"></div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="w3- col w-100 w3-center">
								<h3>보기3</h3>
								<h3 class="w3-blue">${Math.floor(data.sack3 * 100 / data.satotal)} %</h3>
							</div>
							<div class="w3-rest">
								<div class="pd-left-80" >
									<h5 class="pd-left-10">${data.sa3}</h5>
									<div class="w3-col pd-left-10">
										<div class="w3-blue" style="width: ${Math.floor(data.sack3 * 100/data.satotal)}%;"></div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<div class="w3- col w-100 w3-center">
								<h3>보기4</h3>
								<h3 class="w3-blue">${Math.floor(data.sack4 * 100 / data.satotal)} %</h3>
							</div>
							<div class="w3-rest">
								<div class="pd-left-80" >
									<h5 class="pd-left-10">${data.sa4}</h5>
									<div class="w3-col pd-left-10">
										<div class="w3-blue" style="width: ${Math.floor(data.sack4 * 100/data.satotal)}%;"></div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="w3-col w3-border w3-card">
				<div class="w3-half w3-button w3-red" id="hbtn">home</div>
				<div class="w3-half w3-button w3-blue" id="bbtn">보류</div>
			</div>
		</div>
	</div>
</body>
</html>