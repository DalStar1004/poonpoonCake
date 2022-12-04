<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp"%>

<%
request.setCharacterEncoding("utf8");
String session_id = (String)session.getAttribute("SessionUserId");
if( session_id == null ){
%>
<script>
alert("잘못된 경로의 접근입니다.");
location = "/";
</script>
<%
	return;
}

String sql = "SELECT COUNT(*) cnt FROM memberinfo ";
	   sql+= " WHERE userid ='"+session_id+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");

if( cnt !=1 ){
%>
<script>
alert("오류입니다. 관리자에게 연락바랍니다.");
location ="/";
</script>
<%	
	return;
}

String sql2 = " SELECT name, birthday, gender, mobile, zipcode, addr, rdate ";
	   sql2+= " FROM memberinfo ";
	   sql2+= " WHERE userid = '"+session_id+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);

String name = "";
String birthday = "";
String gender = "";
String mobile = "";
String zipcode = "";
String addr = "";
String rdate = "";

if(rs2.next()){
	name = rs2.getString("name");
	birthday = rs2.getString("birthday");
	gender = rs2.getString("gender");
	mobile = rs2.getString("mobile");
	zipcode = rs2.getString("zipcode");
	addr = rs2.getString("addr");
	rdate = rs2.getString("rdate");
}else{
%>	
<script>
alert("다시 시도해주세요.");
location ="../member/loginWrite.jsp";
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

<style>
th{
	background-color:#6699FF;
}

td{
	text-align:left;
	line-height:1.8;
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


</head>
    
    <style>
		table{
			width:800px;
			position:relative;
			border:1px solid #444444;
			border-collapse:collapse;
			margin-bottom:15px;
		}
		
		th,td{
			font-weight:bold;
			border:1px solid #444444;
			padding:10px;
		}
	</style>
	
<script>
function fn_submit(){
	
	var f = document.frm;
	
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
	document.frm.name.focus();
}

function fn_post(){
	var width = window.screen.width/2 -150;
	var height = window.screen.height/2 -150;
	window.open("post1.jsp","post","width=600,height=200,left="+width+",top="+height);
}

function fn_passChange(){
	var url = "passChange.jsp"
	var width = window.screen.width/2 -200;
	var height = window.screen.height/2 -100;
	window.open(url,"passChange","width=400,height=200,left="+width+",top="+height);
	
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
                        <div class="site-heading">
                            <p style="font-size:65px;"><b>Change Member Info</b></p>
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
		<form name ="frm" method="post" action="memberModifySave.jsp" accept-charset="UTF-8">
		
		<input type="hidden" name="chk" value="0">
		
		<table align="center">
		<colgroup>
			<col width = "15%"/>
			<col width = "*"/>
		</colgroup>
		
		<tbody>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;아이디</th>
				<td>
				<%=session_id %>
				</td>	
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;암호</th>
				<td>
				<button type="button" onclick="fn_passChange();" style="width:150px; height:50px; font-weight:bold;">암호변경</button>
				</td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;이름</th>
				<td><input type="text" name="name" class="box2" required value ="<%=name %>"></td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;성별</th>
				<td>
					<input type="radio" name="gender" value="M" <%if(gender.equals("M")){out.print("checked"); }%>>남성
					&nbsp;
					<input type="radio" name="gender" value="F" <%if(gender.equals("F")){out.print("checked"); }%>>여성
				</td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;생일</th>
				<td>
					<input value="<%=birthday %>" type="text" name="birthday" id="birthday" class="box2" required >
				</td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;핸드폰</th>
				<td>
					<input value="<%=mobile %>" type="text" name="mobile" class="box2" >
				</td>
			</tr>
			<tr>
				<th>&nbsp;&nbsp;&nbsp;주소</th>
				<td>
					<input value="<%=zipcode %>" type="text" name="zipcode" class="box2" >&nbsp;&nbsp;
					<button type="button" onclick="fn_post()" style="width:200px; height:50px; margin-bottom:10px; font-weight:bold;">우편번호 찾기</button> <br>
					<input  value="<%=addr %>" type="text" name="addr" class="box1">
				</td>
			</tr>
		</tbody>
		</table>
		
		<div style="width:100%; text-align:center; margin-top:10px;">
			<button type="submit" onclick="fn_submit();return false;" style="width:150px; height:50px; border-radius:15px; font-weight:bold; background-color:#6699FF;">저장</button>
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
