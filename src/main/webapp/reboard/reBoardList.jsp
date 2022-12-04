<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp"%>

<%

int unit = 10;

String viewpage = request.getParameter("viewpage");
if( viewpage == null ){
	viewpage = "1";
}
int view_page  = Integer.parseInt(viewpage);

// (1->0) , (2->10), (3->20)
int index_no = (view_page-1) * unit;

String sqlTotal = "SELECT count(*) total FROM reboard";
ResultSet rsTotal = stmt.executeQuery(sqlTotal);
rsTotal.next();

int total = rsTotal.getInt("total"); // 전체 데이터 개수

int lastpage = (int)Math.ceil((double)total/unit);

int rownumber = total - index_no;

String sql = "SELECT unq,";
	    sql+= " 	title,";
	    sql+= "		name,";
	    sql+= "		date_format(rdate,'%Y-%m-%d') rdate ,";
	    sql+= "		hits, ";
	    sql+= "		gid, ";
	    sql+= "		thread ";
	    sql+= " FROM reboard";
		sql+= " ORDER BY gid DESC, thread ASC ";
		sql+= "  LIMIT "+index_no+","+unit; // LIMIT  시작번호, 출력개수
ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변형 게시판 목록</title>
<link rel="stylesheet" href="../css/layout.css">
</head>
<style>
body{
	font-size:12px;
	color:#282828;
	font-family:맑은고딕;
	font-sytle:none;
	font-weight:none; //bold 사용시 글씨크기 굵게가능
	line-height:1.6;
}

caption{
	font-size:15px;
	font-weight:bold;
	padding-bottom:10px;
}

.table1{
	width:600px;
	border-top:1px solid blue;
	border-collapse:collapse;
}
.th1{
	border-bottom:1px solid black;
	padding:5px;
	height:30px;
	background-color:#f0f0f0;
	font-size:13px
}

.td1{
	border-bottom:1px solid black;
	padding:5px;
}

</style>

<body>
<section>
	<article>
		<table>
		<caption>
		<div>답변형 게시판 목록</div>
		<div style="font-size:11px; width=50%; text-align:left; float:left;">
		<br>전체 데이터 개수 : 총 <%=total %>개
		</div>
		
		<div style="width:50%; text-align:right; float:right;">
		<button style="width:80px; height:35px; font-size:10px;" type="button" onclick="location='reBoardWrite.jsp' ">글쓰기</button>		
		</div>
		</caption>
		
		<colgroup>
			<col width ="10%"/>
			<col width ="50%"/>
			<col width ="15%"/>
			<col width ="15%"/>
			<col width ="10%"/>
		</colgroup>
		
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				while(rs.next()){
					int unq = rs.getInt("unq");
					String title = rs.getString("title");
					String name = rs.getString("name");
					String hits = rs.getString("hits");
					String rdate = rs.getString("rdate");
					String thread = rs.getString("thread");	
					int len = thread.length();
					String re  = "";
					if( len > 1 ){
						re = "[re]";
					}
			%>
				<tr>
					<td><%=rownumber %></td>
					<td align="left">
					<%
					for(int i=1; i<len; i++){
						out.print("&nbsp;&nbsp;&nbsp;");
					}
					%>
					<%=re %>		
					<a href="reBoardDetail.jsp?unq=<%=unq %>"><%=title %></td>
					<td><%=name %></td>
					<td><%=rdate %></td>
					<td><%=hits %></td>
					
				</tr>
			<% 
					rownumber--;
				}
			%>
			
			
		</tbody>
		</table>
		<div style="width:600px; text-align:center; margin-top:10px;">
		<%
			for(int i=1; i<=lastpage; i++){
				//out.print("<a href='boardList.jsp?vpage="+i+"'>"+i+"</a>");
		%>		
			<a href ="boardList.jsp?viewpage=<%=i%>"><%=i %></a>
			
		<%
			}
		%>
		
		</div>

	</article>
</section>

</body>
</html>