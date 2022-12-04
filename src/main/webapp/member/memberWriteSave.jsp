<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbCon.jsp" %>

<%
request.setCharacterEncoding("utf8");
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String mobile = request.getParameter("mobile");
String zipcode = request.getParameter("zipcode");
String addr= request.getParameter("addr");
%>

<%
if( userid == null || pass == null || name == null || gender == null ){
%>	
<script>
alert("잘못된 경로의 접근입니다.");
location = "/";
</script>

<% 
	return;
}
%>

<%
String sql = "SELECT COUNT(*) cnt FROM memberinfo WHERE userid ='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");
if( cnt == 1 ){
%>	
<script>
alert("이미 사용중인 아이디입니다.");
history.back();
</script>
<% 
	return;
}else if( cnt > 1){
%>
<script>
alert("오류입니다. 관리자에게 연락바랍니다.");
history.back();
</script>
<%
	return;
}
%>

<%
String sql2 = "INSERT INTO memberinfo(userid, pass, name, gender, birthday, mobile, zipcode, addr, rdate) ";
	   sql2+= "VALUES('"+userid+"','"+pass+"','"+name+"','"+gender+"','"+birthday+"','"+mobile+"','"+zipcode+"','"+addr+"',now())";

int result = stmt.executeUpdate(sql2);
%>

<%
if( result == 1 ){
%>	
<script>
alert("<%=name%>님 회원등록을 완료하였습니다.");
location = "/";
</script>
<% 
}else{
%>
<script>
alert("시스템 장애입니다. 회원등록 실패");
history.back();
</script>
<%
}
%>