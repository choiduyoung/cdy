<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판글쓰기</title>
<link rel="stylesheet" href="/clsProj/css/w3.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
    
</style>
<script type="text/javascript">
/* 	var cnt = 2;
	function getNum(){
		return cnt++;
	} */
$(document).ready(function(){
	$('#save').click(function(){
		//데이터 유효성 체크
		
		$('#frm').submit();
	});
	
	$('.file').change(function(){
		$(this).parent().append('<input class="file w3-input w3-border " type="file" name="file1"' + cnt + '"id="file1'+ cnt++ +'">')
		var str = 'file' + cnt++;
		var choose = '#' + str;
		$(str).change(function(){
			$('.box').append('<input class="file w3-input w3-border " type="file" name="file1"' + str + '"id="file1'+ str++ +'">')
		})
	});
	
});
</script>
</head>
<body>
    <div class="w3-content" style="max-width: 1000px;">
        <div class="w3-center w3-col ">
            <h2>게시판글쓰기</h2>
        </div>
        <form method="post" action="/clsProj/board/boardWriteProc.cls" id="frm"
        	class="w3-row w3-margin-top" encType="multipart/form-data">
            <div class="w3-row w3-margin-top">
                <div class="w3-card w3-padding">
                    <input class="w3-border-0" type="text" name="title" id="title" placeholder="제목 입력란" style="width: 960px;">
                </div>
            </div>
            <div class="w3-row w3-margin-top w3-left-align box">
                <input class="file w3-input w3-border " type="file" name="file1" >
                <input class="file w3-input w3-border " type="file" name="file2" >
                <input class="file w3-input w3-border " type="file" name="file3">
                <input class="file w3-input w3-border " type="file" name="file4">
             
            </div>
            <div class="w3-row w3-margin-top">
                <div class="w3-card w3-padding mih w3-margin-bottom" style="min-height: 200px;">
                    <textarea class="w3-border-0" name="body" id="body" 
                    		cols="105" rows="10" placeholder="본문 입력란" 
                    		style="resize:none;">
                   	</textarea>
                </div>
            </div>
        </form>
        <div class="w3-row w3-margin-top w3-margin-bottom">
            <div class=" w3-button w3-blue" id="cancel">취소</div>
            <div class=" w3-button w3-green" id="save">완료</div>
        </div>
      </div>
</body>
</html>