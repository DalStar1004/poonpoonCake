<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "cookies.Cookies" %>

<%
	String cookie_id = "";
	Cookies cookies = new Cookies(request);
	if( cookies.exists("CookieUserId" ) && !cookies.getValue("CookieUserId").equals("")){
		cookie_id = cookies.getValue("CookieUserId");
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
    
    <style>
		table{
			width:400px;
			position:relative;left:400px;
			border:1px solid #444444;
			border-collapse:collapse;
			margin-bottom:15px;
		}
		
		th,td{
			font-weight:bold;
			border:1px solid #444444;
			padding:10px;
		}
		.login_div{
			width:400px;
			position:relative;left:400px;
			text-align:center;
			margin-top:10px;
			margin-bottom:15px;
		}
		
	</style>
	
	<script>

		function fn_submit(){
			
			var f = document.frm;
			if( f.userid.value == ""){
				alert("아이디를 입력해주세요.");
				f.userid.focus();
				return false;
			}
			
			if( f.pass.value == ""){
				alert("암호를 입력해주세요.");
				f.pass.focus();
				return false;
			}
			f.submit();
		}
		
	</script>
    
    <body>
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
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="signUp.jsp">Sign Up</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Login</h1>
                        </div>
                    </div>
                </div> 
            </div>
        </header>
       
        <!-- Main Content-->
     <main class="mb-5 mt-4">
     <div class="container px-4 px-lg-5">
     <div class="row gx-4 gx-lg-5 justify-content-center">
        
     <section>
		<article>
			<form name="frm" method="post" action="loginWriteSub.jsp">
			<table>
			
			<colgroup>
				<col width ="25%"/>
				<col width ="*%"/>
			</colgroup>
	
			<tbody>
				<tr>
					<td style="background-color:#6699FF;">&nbsp;&nbsp;아이디</td>
					<td align="left">
					<input type="text" name = "userid" style = "width:99%;" value="<%=cookie_id %>">
					</td>
				</tr>
				<tr>
					<td style="background-color:#6699FF;">&nbsp;&nbsp;암호</td>
					<td align="left">
					<input type="password" name = "pass" style = "width:99%;">
					</td>
				</tr>
			</tbody>
			</table>
			<div class ="login_div">
				<button type="submit" onclick ="fn_submit(); return false; " style="width:200px; height:50px; border-radius:15px; font-weight:bold; background-color:#6699FF;">로그인</button>
			</div>
			<div class ="login_div">
			<input type="checkbox" name = "idchk" value ="1" style="width:20px; height:20px;" <%if( !cookie_id.equals("") ) {out.print("checked");} %>>
				아이디 저장
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
    </body>
</html>
