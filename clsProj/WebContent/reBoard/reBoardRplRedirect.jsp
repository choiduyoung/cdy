<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/w3.css">
<script type="text/javascript" src="/clsProj/js/jquery-3.5.0.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(function(){
		$('#frm').submite();
	});
</script>
</head>
<body>
<%-- 	
	<c:redirect url="/clsProj/reBoard/reBoard.cls">
		<c:param name="nowPage" value="${param.nowPage}" />
	</c:redirect> 
--%>
	
	<form method="post" action="clsProj/rdBoard/reBoard.cls">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="upno" value="${param.upno}">
	</form>
	</body>
</html>