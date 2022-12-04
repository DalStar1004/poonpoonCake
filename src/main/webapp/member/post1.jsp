<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
</head>
<style>
div {
	font-size:12px;
	width:100%;
	height:150px;
	text-align:center;
	background:#6699FF;
}

</style>

<script>
function fn_submit(){
	if( document.frm.dong.value == ""){
		alert("검색 단어를 입력해주세요.");
		document.frm.dong.focus();
		return false;
	}
	document.frm.submit();
}

</script>

<body onload="document.frm.dong.focus();">

<div>
<br><br>
<form name="frm" method="post" action="post2.jsp">

<input type="text" name="dong" style="width:230px; height:20px; font-size:14px;">
<button type="submit" onclick="fn_submit(); return false;" style="width:100px; height:30px; border-radius:15px; font-weight:bold;">검색</button>

</form>
</div>

</body>
</html>