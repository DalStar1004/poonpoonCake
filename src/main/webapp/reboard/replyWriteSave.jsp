<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
request.setCharacterEncoding("utf8"); 
String unq = request.getParameter("unq");  // 부모(원글)의 unq
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String id = request.getParameter("id");
String content = request.getParameter("content");

String sql1 = "SELECT gid, thread FROM reboard ";
	   sql1+= " WHERE unq='"+unq+"' ";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();

String p_gid = rs1.getString("gid");
String p_thread = rs1.getString("thread");

String sql2 = "SELECT ifnull(max(thread),'없음') as maxThread FROM reboard ";
	   sql2+= " WHERE gid='"+p_gid+"' and thread like '"+p_thread+"_' ";

ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();

String maxThread = rs2.getString("maxThread");
String myThread = "";

if( maxThread.equals("없음") ){
	myThread = p_thread + "a";
}else{
	char a1 = maxThread.charAt(maxThread.length()-1);
	a1++;
	String a2 = maxThread.substring(0,maxThread.length()-1);
	myThread = a2 + a1;
}

String sql3 = "INSERT INTO reboard(title, pass, id, content, rdate, gid, thread) ";
	   sql3+=" values('"+title+"','"+pass+"','"+id+"','"+content+"',now(),'"+p_gid+"','"+myThread+"') ";

int result = stmt.executeUpdate(sql3);

%>

<% 
if( result == 1 ){
%>
	<script>
	alert("답변완료");
	location="board.jsp";
	</script>
<% 	
}else{
%>
	<script>
	alert("답변실패");
	location="board.jsp";
	</script>
<% 
}
%>