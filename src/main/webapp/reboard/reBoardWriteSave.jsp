<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@include file="../include/dbCon.jsp" %>

<!-- 전송데이터 받기 -->
<%
request.setCharacterEncoding("utf8");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String id = request.getParameter("id");
String content = request.getParameter("content");
%>

<!-- 데이터 유효성 체크 -->
<%
if(title == null || pass == null || title.trim().equals("") || pass.trim().equals("")){
%>
<script>
	alert("다시 시도해주세요.");
	history.back();
</script>

<%
	return;
}

title = title.trim();
pass = pass.trim();

if(id == null){
	id = "";
}
if(content == null){
	content = "";
}
content = content.trim();
if(content.length() > 5000){
%>
	<script>
	alert("내용의 양이 너무 많습니다.");
	histor.back();
	</script>
<% 
	return;
}
%>
<!-- SQL/적용 -->
<% 
/* gid setting*/
String sql = "SELECT ifnull(MAX(gid),0)+1 as mygid FROM reboard";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int mygid = rs.getInt("mygid");

String sql2 = "INSERT INTO reboard(title,pass,id,content,rdate,gid,thread)";
		sql2 +="VALUES('"+title+"','"+pass+"','"+id+"','"+content+"',now(),'"+mygid+"','a')";
	
int result = stmt.executeUpdate(sql2);

if(result == 1){

%>
	<script>
		alert("저장완료");
		location = "../reboard/board.jsp";
	</script>	
<% 	
} else {

%>
<script>
	alert("저장실패\관리자에게 연락해주세요.");
	history.back();
</script>
<%
}
%>
<!-- 결과메시지 -->