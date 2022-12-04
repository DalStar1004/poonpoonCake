<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
request.setCharacterEncoding("utf8");
String dong = request.getParameter("dong");

if( dong == null ){
%>
<script>
alert("잘못된 경로의 접근입니다.");
self.close();
</script>
<%
	return;
}

dong = dong.trim();

if( dong.equals("")){
%>
<script>
alert("다시 입력해주세요.");
history.back();
</script>
<%
	return;
}
String sqlTot = "SELECT COUNT(*) total FROM post";
	   sqlTot+= " WHERE a4 like '%"+dong+"%' || a5 like'%"+dong+"%' ";
ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");

String sql = "SELECT a1,a2,a3,a4,a5,a6,a7,a8 FROM post ";
	   sql+= " WHERE a4 like '%"+dong+"%' || a5 like'%"+dong+"%' ";
ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호(주소) 검색결과</title>
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
function fn_action() {
	
	var addr = document.frm.address.value;
	var array = addr.split(" ");
	var zipcode = array[0].substring(1,7);
	var address = addr.replace(array[0],"");
	var address = address.trim();
	
	opener.document.frm.zipcode.value = zipcode;
	opener.document.frm.addr.value = address;
	
	self.close();
}

</script>

<body>

<div>
<br><br>
<form name="frm" method ="post" action="">
<!--  검색결과 : <%=total %> 개 <br> -->

<%
if( total > 0 ){
%>

<select name="address" style="width:350px; height:30px; font-weight:bold;">
<%
	while(rs.next()){
		String a1 = rs.getString("a1");
		String a2 = rs.getString("a2");
		String a3 = rs.getString("a3");
		String a4 = rs.getString("a4");
		String a5 = rs.getString("a5");
		String a6 = rs.getString("a6");
		String a7 = rs.getString("a7");
		String a8 = rs.getString("a8");
		
		String addr ="["+a1+"]" +" "+ a2 +" "+ a3 +" "+ a4 +" "+ a5 +" "+ a6 +" "+ a7 +" "+ a8;
		addr = addr.replaceAll("null","");
%>
	<option value="<%=addr %>"><%=addr %></option>
<%
	}
%>


</select>
<button type="button" onclick="fn_action()" style="width:100px; height:30px; border-radius:15px; font-weight:bold;">적용</button>
<%
}else{
%>
	"<%=dong %>"이라는 동(면,리)를 찾을 수 없습니다.
<%
}
%>

</form>
</div>

</body>
</html>