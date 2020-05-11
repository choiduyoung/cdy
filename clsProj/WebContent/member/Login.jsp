<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="../css/w3.css" />
<script type="text/javascript" src="../js/jquery-3.5.0.min.js"></script>
<style>
	.mxw {
		max-width: 360px;
	}
	.mgl5 {
		margin-left: 20px; 
	}
	.mgb10 {
		margin-bottom: 10px;
	}
	.mgt10 {
		margin-top: 10px;
	}
	.pdtnb10 {
		padding: 10px 0px 10px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#lbtn').click(function(){
			// 할일
			// 1. 데이터 일고
			var sid = $('#id').val();
			var spw = $('#pw').val();
			// 2. 유효성 검사하고
			if(!sid){
				$('#id').focus();
				return;
			}
			if(!spw){
				$('#pw').focus();
				return;
			}
			

			$('#frm').attr('method','POST'); 
			$('#frm').attr('action','./LoginProc.cls2');
			$('#frm').submit();
			});
		
		<%
			String sid = (String)session.getAttribute("SID");
		%>

		//로그인 여부에 따른 처리
		var sid = '<%=sid%>';
		alert(typeof sid);
		if(sid != 'null' && sid.length !=0){
			$('#loginWin').css('display', 'none');
			$('#msg').html(sid);
			$('#msgWin').css('display', '');
		}
	});
</script>
</head>
<body>
	<form class="w3-col w3-margin" name="frm" id="frm">
	<div class="w3-third"><p></p></div>
	<div class="w3-third" id="loginWin">
		<div class="w3-content mxw w3-margin-top">
			<div class="w3-blue w3-center w3-border w3-card w3-round"><h3>Login</h3></div>
			<div class="w3-col w3-margin-top w3-border pdtnb10 w3-card w3-round">
				<div class="w3-col mgb10">
					<label class="w3-col m2 mgl5" for="id">I D :</label>
					<input class="w3-col m9" id="id"name="id">
				</div>
				<div class="w3-col">
					<label class="w3-col m2 mgl5" for="pw">P W :</label>
					<input class="w3-col m9" type="password"id="pw"name="pw">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-card">
				<div class="w3-col w3-half w3-border w3-red w3-button" id="hbtn">Home</div>
				<div class="w3-col w3-half w3-border w3-blue w3-button" id="lbtn">Login</div>
			</div>
	</div>
		</div>
	<div class="w3-third w3-card-4" id="msgWin" style="display: none;">
		<h2 class="w3-col m4 w3-margin-top" style="padding-top: 80px; height: 250px;" id="msg"></h2>
		<h2 class="w3-col m8 w3-margin-top" style="padding-top: 80px; height: 250px;">님은 이미 로그인 했습니다</h2>
	</div>
	</form>
</body>
</html>