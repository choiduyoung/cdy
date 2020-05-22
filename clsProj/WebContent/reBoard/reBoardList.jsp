<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
 <title>댓글게시판 목록보기</title> 
 <link rel="stylesheet" href="/clsProj/css/w3.css"> 
 <link rel="stylesheet" href="/clsProj/css/user.css"> 
 <script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script> 
 <script type="text/javascript"> 
 	$(function(){ 
		$('#sbtn').click(function(){ 
 			var str = $('#body').val(); 
 			if(!str){ 
 				return; 
 			} 
 			$('#frm').submit(); 
 		}); 
 		 
		$('#hbtn').click(function(){ 
 			$(location).attr('href', '/clsProj/main/main.cls'); 
 		}); 
		$('#lbtn').click(function(){ 
 			$(location).attr('href', '/clsProj/member/login.cls'); 
 		}); 
		$('#ebtn').click(function(){ 
 			var str = $(this).parent().attr('id');
 			$('#reno').val(str);
 			$('#frm').attr('action','/clsProj/reBoard/reBoardEdit.cls');
 		}); 
		$('#dbtn').click(function(){ 
 			var str = $(this).parent().attr('id');
 			$('#reno').val(str);
 			$('#frm').attr('action','/clsProj/reBoard/reBoardEdit.cls');
 		}); 
		$('.rbtn').click(function(){ 
 			var str = $(this).parent().attr('id');
 			$('#reno').val(str);
 			$('#nowPage').val('${PAGE.nowPage}');
 			$('#frm').attr('action','/clsProj/reBoard/reBoardReply.cls');
 			$('#frm').submit();
 		}); 
		$('#write').click(function(){
			$(location).attr('href', '/clsProj/reBoard/reBoardWrite.cls');
		});
		
		$('.pbtn').click(function(){
			var bstr = $(this).html();
			if(bstr == 'PRE'){
				$('#nowPage').val('${PAGE.startPage - 1}');
			} else if(bstr == 'NEXT'){
				$('#nowPage').val('${PAGE.endPage + 1}');
				
			} else {
				$('#nowPage').val(bstr);
			}
			$('#frm').attr('action', '/clsProj/reBoard/reBoard.cls');
			$('#frm').submit();
		});
 	}); 
 </script> 
</head> 
 <body> 
 <form method="post" action="" id="frm">
      <input type="hidden" name="nowPage" id="nowPage">
      <input type="hidden" name="reno" id="reno">
      <input type="hidden" name="body" id="body">
      <input type="hidden" name="redate" id="redate">
      <input type="hidden" name="avatar" id="avatar">
   </form>
 	
 	<div class="w3-content mxw2"> 
 		<div class="w3-col"> 
 			<h2 class="w3-blue w3-center w3-padding">댓글 게시판</h2> 
 			<div class="w3-col w3-margin-bottom"> 
 				<c:if test="${empty SID}"> 
 					<div class="w3-col m1 w3-right w3-button w3-tiny w3-blue" id="lbtn">Login</div> 
 				</c:if> 
				<c:if test="${not empty SID}"> 
 					<div class="w3-col m1 w3-right w3-button w3-tiny w3-lime" id="write">Write</div> 
					<div class="w3-col m1 w3-right w3-button w3-tiny w3-red" id="logout">Logout</div> 
 				</c:if> 
				 
				<div class="w3-col m1 w3-left w3-button w3-tiny w3-green" id="hbtn">Home</div> 
 			</div> 
 

 			<c:forEach var="data" items="${LIST}">
 			<div style="padding-left: ${data.step * 100}px; ">
 				<div class="w3-col w3-border w3-margin-bottom" id=""> 
 					<div class="w3-col w-100 w3-center pd-10 w3-border-right"> 
 						<img class="h-80p w-auto w3-border" src="/clsProj/img/${data.avatar}"> 
 						<h5 class="w3-col w3-center"><b>${data.id}</b></h5> 
 					</div> 
 					<div class="w3-rest pdh-10"> 
 						<div class="w3-col w3-border-bottom w3-border-light-blue"> 
 							<h6 class="w3-half w3-left-align w3-text-grey" style="margin: 0px; padding-right: 10px"><small>${data.sDate }</small></h6> 
 						</div> 
						<div class="w3-col w3-border-bottom w3-margin-bottom w3-border-khaki"> 
 							<h6 class="w3-padding" id="body">${data.body}</h6> 
 						</div> 
 						<div class="w3-col" style="margin-bottom: 0px;"id="${data.reno}"> 
							<c:if test="${SID eq data.id}">
								<span class="w3-button w3-red w3-right" style="padding: 3px"id="dbtn">삭제</span> 
								<span class="w3-button w3-orange w3-right" style="padding: 3px" id="ebtn">수정</span> 
 							</c:if>
 							<span class="w3-button w3-blue w3-right rbtn" style="padding: 3px"id="">댓글</span> 
 						</div> 
 					</div> 
 				</div> 
 			</div>  
 			</c:forEach> 
 			 
 			<c:if test="${empty LIST}"> 
 				<div class="w3-col w3-border w3-margin-bottom w3-card" id="gmsg"> 
 					<h3 class="w3-padding w3-center">아직 작성된 글이 없습니다.</h3> 
				</div> 
			</c:if> 
		</div>
		<div class="w3-center">
			<div class="w3-bar w3-border">
			<c:if test="${PAGE.startPage lt 4}">
				<span class="w3-bar-item w3-hover-blue">PRE</span>
			</c:if>
			<c:if test="${PAGE.startPage ge 4}">
				<span class="w3-bar-item w3-button w3-hover-blue pbtn">PRE</span>
			</c:if>
				<c:forEach var="pageNo" begin = "${PAGE.startPage}" end="${PAGE.endPage}">
					<span class="w3-bar-item w3-button w3-hover-blue pbtn">${pageNo}</span>
				</c:forEach>	
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">	
				<span class="w3-bar-item w3-button w3-hover-blue pbtn">NEXT</span>		
			</c:if>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">	
				<span class="w3-bar-item w3-hover-blue">NEXT</span>		
			</c:if>
			</div>
		</div> 
 	</div> 
 </body> 
 </html> 
