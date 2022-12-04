<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/dbCon.jsp" %>
<%@ page import="cookies.Cookies" %>
<%
request.setCharacterEncoding("utf8");
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String idchk = request.getParameter("idchk");

if( userid == null || pass == null ){
%>

<script>
alert("잘못된 경로의 접근입니다.");
location = "/";
</script>
<%
	return;
}

String sql = "SELECT COUNT(*) cnt FROM memberinfo ";
	   sql+= " WHERE userid='"+userid+"' and pass='"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");

if( cnt == 0 ){
%>
<script>
alert("잘못된 정보입니다.");
history.back();
</script>	
<%
	return;
} else {
	session.setAttribute("SessionUserId",userid);
	session.setMaxInactiveInterval(60*10);
	if( idchk != null ){
		response.addCookie(Cookies.createCookie("CookieUserId",userid,"/",-1) );
	}else{
		response.addCookie(Cookies.createCookie("CookieUserId","","/",0) );
	}
}
%>

<script>
alert("<%=userid %>님 로그인 되었습니다.");
location ="/";
</script>
