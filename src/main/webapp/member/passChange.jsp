<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경화면</title>
</head>

<style>

body{
	font-size:12px;
	font-family:맑은 고딕;
}

table{
	width:98%;
	board-collapse:collapse;
}

th{
	background-color:#6699FF;
	height:30px;
	padding:5px;
	border:1px solid black;
	font-size:13px;
}
td{
	height:30px;
	padding:5px;
	border:1px solid black;
}

input{
	width:80%;
}

</style>

<script>

function fn_submit(){
	var f = document.frm;
	if( f.pass1.value == "" ){
		alert("현재의 암호를 입력해주세요.");
		f.pass1.focus();
		return false;
	}
	
	if( f.pass2.value == "" ){
		alert("새로운 암호를 입력해주세요.");
		f.pass2.focus();
		return false;
	}
	
	if( f.pass3.value == "" ){
		alert("새로운 암호를 재입력해주세요.");
		f.pass3.focus();
		return false;
	}
	
	if( f.pass2.value != f.pass3.value ){
		alert("새로운 암호와 재설정이 일치하지 않습니다.");
		f.pass2.focus();
		return false;
	}
	
	f.submit();
}

</script>

<body>

<form name="frm" method="post" action="passChangeSub.jsp">
	<table>
		<tr>
			<th>현재 암호입력</th>
			<td><input type="password" name="pass1" style="width:96%; height:25px;"></td>
		</tr>
		<tr>
			<th>새 암호입력</th>
			<td><input type="password" name="pass2" style="width:96%; height:25px;"></td>
		</tr>
		<tr>
			<th>새 암호재입력</th>
			<td><input type="password" name="pass3" style="width:96%; height:25px;"></td>
		</tr>				
	</table>
	<div style="width:98%; text-align:center; margin-top:10px;">
		<button type="submit" onclick="fn_submit(); return false;">적용</button>
		<button type="button" onclick="self.close();">닫기</button>
	</div>
</form>

</body>
</html>