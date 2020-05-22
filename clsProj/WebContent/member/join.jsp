<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="/clsProj/css/w3.css" />
<link rel="stylesheet" href="/clsProj/css/join.css" />
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
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
			$('#avt, #avtgenM').removeClass('dnone');
			$('#avtgenM').addClass('dnone');
		});
		$('#f').click(function(){
			$('#avt, #avtgenF').removeClass('dnone');
			$('#avtgenF').addClass('dnone');
		});

		$('#file').change(function(e){
			var file = $(this).val();
			var vfile = URL.createObjectURL(e.target.files[0]);
			$('#img').attr('src', vfile);
			$('#imgf').removeClass('dnone');
		});
		
		$('#btn2').click(function(){
			//데이터 무결성 검사하고
			$('#frm').submit();
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
					url: '/clsProj/member/id.ck',
					type: 'post',
					dataType: 'json',
					data: {
						'id': sid
					},
					success: function(data){
						var result = data.cnt;
						if(result == 0){
							// 아이디를 사용가능한 경우
							$('#idmsg').text('### 사용할 수 있는 아이디 입니다. ###');
							$('#idmsg').css('color', 'blue');
							$('#idmsg').css('display', '');
						} else {
							// 아이디가 사용불가능한 경우
							$('#idmsg').text('### 사용할 수 없는 아이디 입니다. ###');
							$('#idmsg').css('color', 'red');
							$('#idmsg').css('display', '');
							$('#id').val('');
							$('#id').focus();	
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
			$('#hbtn').click(function(){
				$(location).attr('href','/clsProj/main/main.cls');
		});
	});
</script>
</head>
<body>
<body>
   <div class="w3-col m3"><p></p></div>
   <div class="w3-col m6 mxw">
      <header class="w3-row  w3-blue w3-card-4 w3-bo">
         <h4 class="w3-left w3-padding w3-margin">Increpas Join check</h4>
      </header>
      <hr class="w3-border-bottom">
      <div class="w3-row w3-padding w3-card mxv">
         <form action="/clsProj/member/joinProc.cls" method="POST" id="frm" encType="multipart/form-data">
            <div class=" w3-padding">            
               <label class="ttl" for="id"> 회 원 이름 :</label>
               <div class="infrm">
                   <input type="text" name="name" id="name" class="input1">               
               </div>
            </div>
            <div class="w3-padding">            
               <label class=" ttl"for="id"> I D :</label>
               <div class="infrm">
                   <input type="text" name="id" id="id" class="input2">
                   <div class="w3-button w3-red idck btn "id="idck"> ID Check</div>            
                  <p class="w3-col w3-center" id="idmsg" style="display:none;"></p>
                  <div class="w3-col w3-center" id="idCont" style="display:none;">
                     <h4 class="w3-col m6">I D : </h4><h4 class="w3-col m6" id="getId"></h4>
                     <h4 class="w3-col m6">NAME : </h4><h4 class="w3-col m6" id="getName"></h4>
                     <h4 class="w3-col m6">TEL : </h4><h4 class="w3-col m6" id="getTel"></h4>
                     <h4 class="w3-col m6">MAIL : </h4><h4 class="w3-col m6" id="getMail"></h4>                  
                  </div>
               </div>
            </div>
            <div class="w3-padding">            
               <label class=" ttl"for="pw"> 비밀번호 :</label>
               <div class="infrm">
                   <input type="password" name="pw" id="pw" class="input1">
               </div>
            </div>
            <div class="w3-padding">            
               <label class=" ttl"for="repw"> 비밀번호 확인 :</label>
               <div class="infrm">
                   <input type="password" name="repw" id="repw" class="input1">
               </div>
               <div class="w3-row w3-hide" id="gl1">
                  <label class=" ttl" for="repw"><p></p></label>
                  <small class="w3-hide" id="gl2"></small>
               </div>
            </div>
            <div class=" w3-padding">            
               <label class="ttl" for="email"> 이 메 일 :</label>
               <div class="infrm">
                   <input type="text" name="mail" id="mail" class="input1">               
               </div>
            </div>
            <div class=" w3-padding">            
               <label class="ttl" for="tel"> 전 화 번 호 :</label>
               <div class="infrm">
                   <input type="text" name="tel" id="tel" class="input1">               
               </div>
            </div>
            <div class="w3-padding">            
               <label class="ttl"for="file"> 프로필 사진 :</label>
               <div class="infrm">
                   <input type="file" name="file" id="file" class="input1">
               </div>
            </div>
            <div class="w3-row">            
               <div class="infrm w3-hide w3-margin-top w3-center" id="imgbox">
                         <img src="#" id="img1" alt="Image"class="imgbox w3-padding w3-border w3-card">
               </div>
            </div>
            <div class="w3-padding" style="position: relative; top: -7px;">            
               <label class="ttl"for="gen"> 성  별 :</label>
               <div class="infrm w3-center" style="position: relative; top: 7px;">
                  <div class="w3-half w3-center">
                      <input type="radio" name="gen" value="F" id="F" class="w3-radio"/> 여자 
                  </div>
                  <div class="w3-half w3-center">
                      <input type="radio" name="gen" value="M" id="M" class="w3-radio"/> 남자
                  </div>
               </div>
            </div>
            <div class="w3-padding w3-hide" id="avtgenb">
               <label class="ttl" style="position: relative;top: -10px"> 아바타 선택 : </label>
               <div class="infrm w3-center ">
                  <div class="w3-hide" id="avtgenM">
                     <input class="w3-radio" type="radio" name="avt" value="11" />
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar1.png">                  
                     <input class="w3-radio" type="radio" name="avt" value="12" />
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar2.png">
                     <input class="w3-radio" type="radio" name="avt"   value="13"/>
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar3.png">                  
                  </div>
                  <div class="w3-hide" id="avtgenF">
                     <input class="w3-radio" type="radio"  value="14"name="avt" />
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar4.png">                  
                     <input class="w3-radio" type="radio" value="15" name="avt" />
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar5.png">
                     <input class="w3-radio" type="radio" value="16" name="avt" />
                     <img class="avtbox2 w3-margin-top" alt="image" src="../img/img_avatar6.png">                  
                  </div>
               </div>
            </div>
            <div class="w3-padding">
               <label class="ttl" for="y"> 생년월일 :</label>
               <div class="infrm w3-center">
                  <input class="w3-center" type="date" name="birth" id="birth" style="width:92%;"/>
               </div>
            </div>
         </form>   
      </div>
      <div class="w3-border w3-row w3-margin-top">
         <div class="w3-half w3-button w3-red" id="btn1">Home</div>
         <div class="w3-half w3-button w3-green" id="btn2">Submit</div>
      </div>
   </div>
</body>
<script type="text/javascript">
document.getElementById('file').onchange = function(e) {

    var form = this.value;
    var check = form.slice(form.lastIndexOf('.') + 1);
    check = check.toLowerCase(check);

    if (check != 'png' && check != 'jpg' && check != 'jpeg' && check != 'gif') {
       alert('파일형식을 확인하세요..');
       document.getElementById('imgbox').classList.toggle('w3-hide');
       this.value = '';
       return;
    }
    var vfile = URL.createObjectURL(e.target.files[0]); 
    // 배열로 저장하고 있다가 선택한 파일은
    // 0번째 이기때문
    document.getElementById('img1').setAttribute('src', vfile);
    document.getElementById('imgbox').classList.remove('w3-hide');

 };

document.getElementById('F').onchange = function() {
   var gen = this.value;
   document.getElementById('avtgenb').classList.add('w3-hide');
   document.getElementById('avtgenM').classList.add('w3-hide');
   document.getElementById('avtgenb').classList.remove('w3-hide');
   document.getElementById('avtgenF').classList.remove('w3-hide');
};
// 아바타 남자 구별
document.getElementById('M').onchange = function() {
   var gen = this.value;

   document.getElementById('avtgenb').classList.add('w3-hide');
   document.getElementById('avtgenF').classList.add('w3-hide');
   document.getElementById('avtgenb').classList.remove('w3-hide');
   document.getElementById('avtgenM').classList.remove('w3-hide');
};
</script>
</html>