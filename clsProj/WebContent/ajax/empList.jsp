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
	$('#content').css('display', 'none');
	
	$('.btn').click(function(){
		//할일
		//어떤 버튼이 클릭이 됬는지 알아낸다
		
		//우리는 버튼마다 아디 값을 다르게 설정을 햇으므로 아디디 값을 읽어온다
		var tid = $(this).attr('id');
		alert(tid);
		$.ajax({
			url: '/clsProj/ajax/empInfo.cls',
			type: 'post',
			dataType: 'json',
			data: {
				'eno' : tid
				
			},
			
			success: function(obj){
			
				/*
					success 함수의 매개변수 의 의미
					비동기 통신으로 요청을 하게 되면
					dataType 의 형식의 문서을 서버가 작성해서 응답해주게 되어 있다
					따라서 
						dataType: 'json'
					이라고 정의를 하면
					요청에 대한 응답으로 json 문서를 작성해서 응답을 해 줍니다
					이때 
					요청 측에서는 응답 내용을 받아야 하는데
					그때 받아서 저장하는 것이 success 매개변수 이다.
					
					따라서 자바 스크립트의 형식으로 표현하자면 
						var obj = {
								데이터 내용
						}
					그래서 사용할 때는 매개변수를 제이슨 객체로 사용하면 된다.
				*/
			//	$('#title').html('[ <b>'(obj.name) + '</b> ] <small>사원상세정보</small>');
				$('#eno').html(obj.eno);
				$('#name').html(obj.name);
				$('#mgr').html(obj.mgr);
				$('#hdate').html(obj.hdate);
				$('#sal').html(obj.sal);
				$('#grade').html(obj.grade);
				$('#comm').html(obj.comm);
				$('#dno').html(obj.dno);
				$('#dname').html(obj.dname);
				$('#loc').html(obj.loc);

				$('#content').css('display', '');
				
			},
			error: function(){
				alert('통신에러');
			}
		});
	});

});
</script>
</head>
<body>
	<div class="w3-content mxw">
		<h2 class="w3-pank w3-center w3-padding w3-margin-top">사원리스트</h2>
		<div class="w3-col w3-margin-bottom">
			<div class="w3-button w-100 w3-green w3-left" id="hbtn">Home</div>
			<div class="w3-button w-100 w3-green w3-left" id="lbtn">Lgoin</div>
		</div>
		<div class="w3-col w3-center">
			<c:forEach var="data" items="${LIST}" varStatus="st">
			<div class="btn w3-button w3-margin-bottom w-150 ${COLOR.get(st.index)}" id="${data.eno}">${data.name}</div>		
			</c:forEach>
		</div>
		<!-- 사원 상세 정보 태그 -->
		<!-- append함수로 처리하는방법 -->
		
		<div class="w3-col w3-padding" id="content">
			<h3 class="w3-center w3-blue w3-padding w3-margin-bottom">사원정보</h3>
			<div class="w3-col w3-card w3-padding">
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">사원번호 : </h4>
					<h4 class="w3-rest pd-left-20" id="eno"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">사원이름 : </h4>
					<h4 class="w3-rest pd-left-20" id="name"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">상사번호 : </h4>
					<h4 class="w3-rest pd-left-20" id="mgr"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">입사일 : </h4>
					<h4 class="w3-rest pd-left-20" id="hdate"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">급여 : </h4>
					<h4 class="w3-rest pd-left-20"id="sal"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">급여등급 : </h4>
					<h4 class="w3-rest pd-left-20"id="grade"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">커미션 : </h4>
					<h4 class="w3-rest pd-left-20"id="comm"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">부서번호 : </h4>
					<h4 class="w3-rest pd-left-20"id="dno"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">부서이름 : </h4>
					<h4 class="w3-rest pd-left-20"id="dname"></h4>
				</div>
				<div class="w3-row">
					<h4 class="w3-col w-150 w3-right-align">부서위치 : </h4>
					<h4 class="w3-rest pd-left-20" id="loc"></h4>
				</div>
			</div>
		</div>
	</div>
</body>
</html>