<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
   
     <link rel="stylesheet" href="../css/jquery-ui.css">
  <script src="../script/jquery-3.6.0.js"></script>
  <script src="../script/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#birthday" ).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange:'c-90:c+10'
    });
  } );
  </script>



<script>
function fn_submit(){
	
	var f = document.frm;
	
	if(f.userid.value == ""){
		alert("아이디를 입력해주세요.");
		document.frm.title.focus();
		return false;
	}
	
	if(f.chk.value == "0"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if(f.pass.value == ""){
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	
	if(f.name.value == ""){
		alert("이름을 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	
	if( f.gender[0].checked == false && f.gender[1].checked == false ){
		alert("성별을 체크해주세요.");
		return false;
	}
	
	f.submit();
	
}

function fn_onload(){
	document.frm.userid.focus();
}

function fn_idcheck(){
	
	var userid = document.frm.userid.value;
	
	if( userid == "" ){
		alert("아이디를 입력해주세요.");
		document.frm.userid.focus();
		return false;
	}
	if( userid.length < 4 || userid.length > 12){
		alert("아이디는 4자 ~ 12자 사이로 만들어주세요.");
		return false;
	}

	var w = window.screen.width/2 -150;
	var h = window.screen.height/2 -150;
	var url= "idcheck.jsp?userid="+userid;
	window.open(url,"중복아이디 체크","width=300,height=200,left="+w+",top="+h);
}

function fn_post(){
	var width = window.screen.width/2 -150;
	var height = window.screen.height/2 -150;
	window.open("post1.jsp","post","width=600,height=200,left="+width+",top="+height);
}


</script>
</head>

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
		
		.box1{
		width: 98%;
		}
	
		.box2{
			width:180px;
		}
		button{
			height:25px;
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
                            <h1>Sign Up</h1>
                        </div>
                    </div>
                </div> 
            </div>
        </header>
       
      <!-- Main Content-->
     <main class="mb-5 mt-4">
     <div class="container px-4 px-lg-5">
     <div class="row gx-4 gx-lg-5 justify-content-center">
        
	<body onload="fn_onload()">
	<section>
		<article>
			<form name ="frm" method="post" action="memberWriteSave.jsp" accept-charset="UTF-8">
			
			<input type="hidden" name="chk" value="0">
			
			<table align="center">
			<colgroup>
				<col width = "15%"/>
				<col width = "*"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;아이디</th>
					<td><input type="text" name="userid" class = "box2" required>&nbsp;&nbsp;
					(4자~12자 사이)&nbsp;&nbsp;
					<button type="button" onclick="fn_idcheck()" style="width:200px; height:50px; font-weight:bold;">중복아이디 체크</button>
					</td>	
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;암호</th>
					<td><input type="password" name="pass" class="box2" required></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;이름</th>
					<td><input type="text" name="name" class="box2" required></td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;성별</th>
					<td>
						<input type="radio" name="gender" value="M" style="width:15px; height:15px;">남성
						&nbsp;
						<input type="radio" name="gender" value="F" style="width:15px; height:15px;">여성
					</td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;생일</th>
					<td>
						<input type="text" name="birthday" id="birthday" class="box2" required>
					</td>
				</tr>
					<tr>
					<th>&nbsp;&nbsp;&nbsp;핸드폰</th>
					<td>
						<input type="text" name="mobile" class="box2">
					</td>
				</tr>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;주소</th>
					<td>
						<input type="text" name="zipcode" class="box2">&nbsp;&nbsp;
						<button type="button" onclick="fn_post()" style="width:200px; height:50px; margin-bottom:10px; font-weight:bold;">우편번호 찾기</button> <br>
						<input type="text" name="addr" class="box1">
					</td>
				</tr>
			  </tbody>
			</table>
			
			<div style="width:100%; text-align:center; margin-top:10px;">
				<button type="submit" onclick="fn_submit();return false;" style="width:150px; height:50px; border-radius:15px; font-weight:bold; background-color:#6699FF;">저장</button>&nbsp;
				<button type="reset" style="width:150px; height:50px; border-radius:15px; font-weight:bold; background-color:#6699FF;">취소</button>
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
