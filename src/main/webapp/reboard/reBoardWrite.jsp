<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변형 게시판 입력화면</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<style>
td{
	text-align:left;
}
.box_title{
	width: 98%;
}

.box_name{
	width:150px;
}

</style>
<script>
function fn_submit(){
	
	var f = document.frm;
	
	if(f.title.value == ""){
		alert("제목을 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	
	if(f.pass.value == ""){
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	f.submit();
	
}

function fn_onload(){
	document.frm.title.focus();
}

</script>

<body onload="fn_onload()">
<section>
	<article>
		<form name ="frm" method="post" action="reBoardWriteSave.jsp" accept-charset="UTF-8">
		<table align="center">
		<caption>답변형 게시판 입력화면</caption>
		<colgroup>
			<col width = "25%"/>
			<col width = "*"/>
		</colgroup>
		
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" class="box_title" required></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pass" class="box_name" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" class="box_name"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
				<textarea name="content" rows="7" cols="58"></textarea>
				</td>
			</tr>
		</tbody>
		</table>
		
		<div style="width:100%; text-align:center; margin-top:10px;">
			<button type="button" onclick="location='reBoardList.jsp' " style="width:100px; height:30px;">목록</button>
			<button type="submit" onclick="fn_submit();return false;" style="width:100px; height:30px;">저장</button>
			<button type="reset" style="width:100px; height:30px;">취소</button>
		</div>
		</form>
	</article>
</section>

</body>
</html>