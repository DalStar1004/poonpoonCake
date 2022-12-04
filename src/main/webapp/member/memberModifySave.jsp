<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/dbCon.jsp" %>

<%
String session_id = (String)session.getAttribute("SessionUserId");

%>

<%

request.setCharacterEncoding("utf8");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String mobile = request.getParameter("mobile");
String zipcode = request.getParameter("zipcode");
String addr= request.getParameter("addr");
%>

<%
if( session_id == null || name == null || gender == null ){
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
String sql2 = "UPDATE memberinfo SET ";
	   sql2+= " name='"+name+"', gender='"+gender+"', birthday='"+birthday+"', ";
	   sql2+= " mobile='"+mobile+"', zipcode='"+zipcode+"', addr='"+addr+"' ";
	   sql2+= " WHERE userid ='"+session_id+"' ";

int result = stmt.executeUpdate(sql2);
%>

<%
if( result == 1 ){
%>	
<script>
alert("<%=name%>님의 정보가 변경되었습니다.");
location = "/";
</script>
<% 
}else{
%>
<script>
alert("변경 실패");
history.back();
</script>
<%
}
%>