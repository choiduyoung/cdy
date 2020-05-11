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
	.dnone {
		display: none;
	}
	.avtmxw {
		max-width: 60px;
	}
	.imgmxw {
		max-width: 300px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#m').click(function(){
			$('#avt, #mavt').removeClass('dnone');
			$('#favt').addClass('dnone');
		});
		$('#f').click(function(){
			$('#avt, #favt').removeClass('dnone');
			$('#mavt').addClass('dnone');
		});

		$('#file').change(function(e){
			var file = $(this).val();
			var vfile = URL.createObjectURL(e.target.files[0]);
			$('#img').attr('src', vfile);
			$('#imgf').removeClass('dnone');
		});
		
		/*
			비동기 통신
				==> 웹서비스에서 원칙은
					클라이언트가 요청을 하면
					서버는 클라이언트가 요청한 문서를 응답(전송)해준다.
					그리고 그 직후
					서버는 클라이언트와의 연결을 끊는다.
					따라서 이런 통신방식을
					단절형 통신이라 이야기한다.
					
					그리고 서버가 전달된 문서는
					원칙은 클라이언트가 전송받은 문서와 동일해야 된다.
					이런 경우를 동기형이라 이야기 한다.
					
					반대로 서버가 전달해준 문서와
					클라이언트가 받은 문서를 일부분만 교체한 경우
					비동기라 이야기 한다.
					
					결론적으로 비동기처리란
					서버가 보내준 문서의 일부분만 서버와 통신을 해서 새로 받아서 교체해서
					이부분만 교체하는 처리를
					비동기 처리라 한다.
					영어로 Ajax라 부른다.
					
					그런데 이 비동기 처리는 jQuery에서 함수로 정의가 되어있고
						형식]
				
							$.ajax({
								url: '주소',					==> 요청주소
								type: 'get | post',			==> 데이터 전송방식
								dataType: 'text | html | xml | json',	==> 데이터 전송 타입
								data: {						==> 전송될 데이터(파라미터들)
									넘겨줄 데이터 나열
									'변수이름': '데이터',
									'변수이름': '데이터',
									...
								},
								success: function(data){	==> 통신에 성공할 경우 실행할 함수
									성공했을 때 처리내용
								},
								error: function(){			==> 통신에 실패할 경우 실행할 함수
									실패시 처리내용
								}
							})
		*/
		
		$('#idck').click(function(){
			// 할일
			// 1. 입력태그에 입력된 아이디를 가져오고
			var sid = $('#id').val();
			if(sid){
				$.ajax({
					url: '../id.check',
					type: 'post',
					dataType: 'json',
					data: {
						'id': sid
					},
					success: function(data){
						alert('###########');
						alert(data);
						
						var result = data.result;
						var id = data.id;
						var name = data.name;
						var tel = data.tel;
						var mail = data.mail;
						alert(id +'  ' + name);
						if(result == 'ok'){
							// 아이디를 사용가능한 경우
							$('#idmsg').css('color', 'blue');
							$('#idmsg').text('### 사용할 수 있는 아이디 입니다. ###');
							$('#idmsg').removeClass('dnone');
						} else {
							// 아이디가 사용불가능한 경우
							$('#idmsg').css('color', 'red');
							$('#idmsg').text('### 사용할 수 없는 아이디 입니다. ###');
							$('#idmsg').removeClass('dnone');
							$('#id').val('');
							$('#id').focus();
							$('#idCont').css('display', '');
							$('#getId').text(id);
							$('#getName').text(name);
							$('#getTel').text(tel);
							$('#getMail').text(mail);
							
						}
					},
					error: function(){
						alert('### 통신 실패 ###');
					}
				});
			} else {
				$('#id').focus();
				return;
			}
		});
	});
</script>
</head>
<body>
	<div class="w3-col l3 m3"><p></p></div>
	<div class="w3-col l6 m6 s12 w3-margin-bottom">
		<div class="w3-col w3-padding w3-margin-top w3-blue w3-card" id="logo"><h3 class="w3-center">Increpas Join</h3></div>
		<form class="w3-col w3-padding w3-margin-top w3-border w3-card" method="post" action="" name="frm" id="frm">
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="id">I D : </label>
				<div class="w3-col m7 w3-margin-left">
					<input class="w3-col m12" type="text" name="id" id="id">
				</div>
				<div class="w3-col m2 w3-button w3-tiny w3-red w3-round w3-center" id="idck">중복확인</div>
				<p class="w3-col w3-center dnone" id="idmsg"></p>
				<div class="w3-col w3-center" id="idCont" style="display: none;">
					<h4 class="w3-col m6">I D :</h4><h4 class="w3-col m6" id="getId"></h4>
					<h4 class="w3-col m6">NAME :</h4><h4 class="w3-col m6" id="getName"></h4>
					<h4 class="w3-col m6">TEL :</h4><h4 class="w3-col m6" id="getTel"></h4>
					<h4 class="w3-col m6">MAIL :</h4><h4 class="w3-col m6" id="getMail"></h4>
				</div>
				<!-- 
					문제 ]
						아이디 체크 버튼을 클릭했을 경우
						입력한 아이디가 존재하면 해당 아이디의 정보를 조회해서
						idCont태그에 추가하고 보여주세요
				 -->
			</div>
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="pw">P W : </label>
				<div class="w3-col m9 w3-margin-left">
					<input class="w3-col m12" type="password" name="pw" id="pw">
				</div>
			</div>
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="repw">PW Check : </label>
				<div class="w3-col m9 w3-margin-left">
					<input class="w3-col m12" type="password" name="repw" id="repw">
				</div>
			</div>
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="name">이  름 : </label>
				<div class="w3-col m9 w3-margin-left">
					<input class="w3-col m12" type="text" name="name" id="name">
				</div>
			</div>
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="mail">메  일 : </label>
				<div class="w3-col m5 w3-margin-left">
					<input class="w3-col m12" type="email" name="mail" id="mail">
				</div>
				<div class="w3-col m2 w3-right-align">@increpas.com</div>
			</div>
			<div class="w3-margin-top w3-row">
				<label class="w3-col m2 w3-right-align" for="birth">생  일 : </label>
				<div class="w3-col m9 w3-margin-left">
					<input class="w3-col m12" type="date" name="birth" id="birth">
				</div>
			</div>
			<div class="w3-margin-top w3-row">
				<div class="w3-col m2 w3-right-align">성 별 : </div>
				<div class="w3-col m5 w3-center">
					<label for="m">남자</label>
					<input type="radio" name="gen" id="m">
				</div>
				<div class="w3-col m5 w3-center">
					<label for="f">여자</label>
					<input type="radio" name="gen" id="f">
				</div>
			</div>
			<div class="w3-content w3-margin dnone" id="avt">
				<div class="w3-content w3-center" id="mavt">
					<div class="w3-col m3 w3-margin avtmxw" id="mavtf1">
						<label for="mavt1"><img style="width: 100%; height: auto;" src="../img/img_avatar1.png" class="w3-image"></label>
						<input type="radio" name="mavt" id="mavt1">
					</div>
					<div class="w3-col m3 w3-margin avtmxw" id="mavtf2">
						<label for="mavt2"><img style="width: 100%; height: auto;" src="../img/img_avatar2.png" class="w3-image"></label>
						<input type="radio" name="mavt" id="mavt2">
					</div>
					<div class="w3-col m3 w3-margin avtmxw" id="mavtf3">
						<label for="mavt3"><img style="width: 100%; height: auto;" src="../img/img_avatar3.png" class="w3-image"></label>
						<input type="radio" name="mavt" id="mavt3">
					</div>
				</div>
				<div class="w3-content w3-center" id="favt">
					<div class="w3-col m3 w3-margin avtmxw" id="favtf1">
						<label for="favt1"><img style="width: 100%; height: auto;" src="../img/img_avatar4.png" class="w3-image"></label>
						<input type="radio" name="favt" id="favt1">
					</div>
					<div class="w3-col m3 w3-margin avtmxw" id="favtf2">
						<label for="favt2"><img style="width: 100%; height: auto;" src="../img/img_avatar5.png" class="w3-image"></label>
						<input type="radio" name="favt" id="favt2">
					</div>
					<div class="w3-col m3 w3-margin avtmxw" id="favtf3">
						<label for="favt3"><img style="width: 100%; height: auto;" src="../img/img_avatar6.png" class="w3-image"></label>
						<input type="radio" name="favt" id="favt3">
					</div>
				</div>
			</div>
			<div class="w3-row w3-margin">
				<label class="w3-col m2 w3-right-align" for="file">프로필 : </label>
				<input type="file" id="file" name="file" accept="image/*">
			</div>
			<div class="w3-content imgmxw dnone" id="imgf">
				<img style="width: 100%; height: auto;" id="img">
			</div>
		</form>
		<div class="w3-margin-top w3-col">
			<div class="w3-col m6 w3-button w3-green">HOME</div>
			<div class="w3-col m6 w3-button w3-blue">회원가입</div>
		</div>
	</div>
</body>
</html>