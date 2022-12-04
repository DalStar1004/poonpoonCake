<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf8");
String session_id = (String)session.getAttribute("SessionUserId");
if( session_id == null ){
%>
<script>
alert("로그인 후에 사용이 가능합니다. \n로그인을 하십시오.");
location = "../member/login.jsp";
</script>
<%
	return;
}
%>    

<%@ include file="../include/dbCon.jsp"%>

<%

int unit = 5;

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
	    sql+= "		id,";
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
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Poon Poon Cake</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
    </head>
    
    <style>
    table{
	width:1000px;
	position:relative;left:100px;
	border:1px solid #444444;
	border-collapse:collapse;
	margin-bottom:15px;
	text-align:center;
		}
		
	th{
		font-weight:bold;
		border:1px solid #444444;
		padding:10px;
		background-color:#6699FF;
	}
	
	td{
		border:1px solid #444444;
		padding:10px;
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
    
            <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="../home.jsp">Poon Poon Cake</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../home.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../location.jsp">Location</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../cake.jsp">Cake</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../reboard/board.jsp">Board</a></li>                        
                        
                        <%
                        String SESSION_ID = (String)session.getAttribute("SessionUserId");
                        if ( SESSION_ID == null ){
                        %>                    
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../member/login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../member/signUp.jsp">Sign Up</a></li>
                        <%
                        	}else{
                        %>          
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../member/memberModify.jsp">MemberInfo</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="../member/logout.jsp">Logout</a></li>
                        <%
                        	}
                        %>
                    </ul>
                </div>
            </div>
        </nav>
	
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h1>Board</h1>
                            <span class="subheading">Please write your inquiry</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- Main Content-->
        <main class="mb-4">
            <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
				<section>
					<article>
						<div style="width:50%; position:relative;left:950px; margin-bottom:10px;">
						<button style="width:150px; height:50px; border-radius:15px; font-weight:bold; background-color:#dcdcdc;" type="button" onclick="location='boardWrite.jsp' ">글쓰기
						</button>		
						</div>
						<table>
						<caption>
						<div style="font-size:11px; width=50%; text-align:left; float:left;">
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
									String id = rs.getString("id");
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
									<td><%=id %></td>
									<td><%=rdate %></td>
									<td><%=hits %></td>
									
								</tr>
							<% 
									rownumber--;
								}
							%>
							
							
						</tbody>
						</table>
						<div style="width:600px; position:relative;left:600px;">
						<%
							for(int i=1; i<=lastpage; i++){
								//out.print("<a href='boardList.jsp?vpage="+i+"'>"+i+"</a>");
						%>		
							<a href ="board.jsp?viewpage=<%=i%>"><%=i %>&nbsp;&nbsp;</a>
							
						<%
							}
						%>
						
						</div>
				
					</article>
				</section>

			</div>
            </div>
        </main>
        <!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="https://www.instagram.com/poonpoon_cake/">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-instagram fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic">Address : Jeonbuk, Jeonju-si, Wansan-gu, Hyoja-dong 2-ga, 1253-1</div>
					   <div class="small text-center text-muted fst-italic">Phone : 010-2455-1223</div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
