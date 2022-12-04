<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%     
request.setCharacterEncoding("utf8");
String session_id = (String)session.getAttribute("SessionUserId");
%>
    
<%
String unq = request.getParameter("unq");
if( unq == null ){
%>
<script>
alert("잘못된 경로의 접근입니다.");
location = "/";
</script>
<%
	return;
}
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

     <style>
		table{
			width:800px;
			position:relative;
			border:1px solid #444444;
			border-collapse:collapse;
			margin-bottom:15px;
		}
		
		th{
			background-color:#6699FF;
			font-weight:bold;
			border:1px solid #444444;
			padding:10px;
		}
		
		td{
			text-align:left;
			line-height:1.8;
			border:1px solid #444444;
			padding:10px;
		}
		.buttonStyle{
			width:150px; 
			height:50px; 
			border-radius:13px; 
			font-weight:bold; 
			background-color:#6699FF;
		}
		
		
	</style>
	
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
                           <p style="font-size:65px;"><b>Reply Write Board</b></p>
                            <span class="subheading">Please write your reply</span>
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
					<form name ="frm" method="post" action="replyWriteSave.jsp" accept-charset="UTF-8">
					<input type="hidden" name="unq" value="<%=unq %>"/>
					<table align="center">
					<colgroup>
						<col width = "15%"/>
						<col width = "*"/>
					</colgroup>
					
					<tbody>
						<tr>
							<th>&nbsp;&nbsp;제목</th>
							<td>Re : <input type="text" name="title" required style="width:93%"></td>
						</tr>
						<tr>
							<th>&nbsp;&nbsp;암호</th>
							<td><input type="password" name="pass" required></td>
						</tr>
						<tr>
							<th>&nbsp;&nbsp;아이디</th>
							<td><input type="text" name="id" value="<%=session_id %>"></td>
						</tr>
						<tr>
							<th>&nbsp;&nbsp;내용</th>
							<td>
							<textarea name="content" rows="7" cols="58"></textarea>
							</td>
						</tr>
					</tbody>
					</table>
					
					<div style="width:100%; text-align:center; margin-top:10px;">
						<button type="button" onclick="location='../reboard/board.jsp' " class="buttonStyle">목록</button>&nbsp;
						<button type="submit" onclick="fn_submit();return false;" class="buttonStyle">저장</button>&nbsp;
						<button type="reset" class="buttonStyle">리셋</button>
					</div>
					</form>
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
