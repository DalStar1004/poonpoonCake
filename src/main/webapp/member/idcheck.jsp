<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
String userid = request.getParameter("userid");
if( userid == null ){
%>
<script>
alert("잘못된 경로의 접근입니다.");
self.close();
</script>	
<% 
	return;
}

userid =  userid.trim();

if( userid.length() <4 || userid.length() > 12 ){
%>

<script>
alert("잘못된 아이디 값입니다.");
self.close();
</script>	
<% 
	return;
}

String sql = "SELECT COUNT(*) cnt FROM memberinfo ";
	   sql+= " WHERE userid='"+userid+"' ";
	   
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#div1{
	font-size:14px;
	font-weight:bold;
	width:100%;
	height:120%;
	background-color :#6699FF;
	text-align:center;
	vertical-align:middle;
	line-height:2.0;
}
</style>
<body>
<div id = "div1">
<br><br>
<%
if( cnt == 0 ){
	out.print("사용 가능한 아이디입니다.");
%>
	<script>
	opener.document.frm.chk.value = "1";
	</script>
<% 	
}else{
	out.print("이미 사용중인 아이디입니다.");
%>
	<script>
	opener.document.frm.chk.value = "0";
	</script>
<%
}
%>

<br><br>
	<button type="button" onclick = "self.close()" style="width:100px; height:30px; border-radius:15px; font-weight:bold; font-size:12px;">닫기</button>

</div>
</body>
</html>