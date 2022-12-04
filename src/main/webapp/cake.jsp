<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Poon Poon Cake</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<style>
.table1{
	width:695px;
	border:1px solid black;
	border-collapse:collapse;
}

.td1{
	border:1px solid black;
	padding:5px;
	height:30xp;
	background-color:#6699FF;
	font-family:맑은고딕;
	font-size:16px;
	color : black;
	width:25%;
	font-weight:bold;
}
.td2{
	border-bottom:1px solid black;
	padding:5px;
	height:30xp;
	background-color:#6699FF;
	font-family:맑은고딕;
	font-size:16px;
	color : black;
	font-weight:bold;
}
td{
	border-bottom:1px solid black;
	padding:5px;
	font-family:맑은고딕;
	font-size:15px;
	font-weight:bold;
}
</style>

<body>

	<!-- Navigation-->
	<%@ include file="/include/menuBar.jsp" %>
	
	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('assets/img/home-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="site-heading">
						<h1>Cake</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<!-- Post preview-->
				<div class="post-preview">
					<h5>100% 국내산 쌀가루와 100% 국내산 흑임자가루, 직접찐 단호박, 블루베리를 사용하여 떡을
						제작합니다.</h4>
					<h5>일반 백설탕이 아닌 몸에 당 흡수를 줄여주는 자일로스 설탕을 사용합니다.</h5>
					<h5>설기는 흑임자, 단호박, 블루베리, 잼설기 중 선택 가능합니다.</h5>
				</div>

				<!-- Divider-->
				<hr class="my-4" />
				<!-- Post preview-->
				<div>
					<table border="1" width="695" cellpadding="3" cellspacing="1">

							<tr align="center">
								<td class ="td1" rowspan="5"><b>1단 케이크</b></td>
								<td class ="td2" bgcolor="#6699FF"><b>호 수</b></td>
								<td class ="td2" bgcolor="#6699FF"><b>사 이 즈</b></td>
								<td class ="td2" bgcolor="#6699FF"><b>가 격</b></td>
							</tr>

							<tr align="center" bgcolor="white">
								<td>1호</td>
								<td>지름 : 약 15cm</td>
								<td>70,000원</td>
							</tr>
							<tr align="center" bgcolor="white">
								<td>2호</td>
								<td>지름 : 약 18cm</td>
								<td>85,000원</td>
							</tr>
							<tr align="center" bgcolor="white">
								<td>3호</td>
								<td>지름 : 약 21cm</td>
								<td>100,000원</td>
							</tr>
							<tr align="center" bgcolor="white">
								<td>4호</td>
								<td>지름 : 약 24cm</td>
								<td>120,000원</td>
							</tr>
						</table>
				</div>
				<hr class="my-4" />
				
				<!-- Divider-->
				<!-- Post preview-->
				<div>
						<table border="1" width="695" cellpadding="3" cellspacing="1" bgcolor="#000000">
							<tr align="center" bgcolor="white">
								<td class ="td1" rowspan="4"><b>2단 케이크</b></td>
								<td class ="td2"><b>호 수</b></td>
								<td class ="td2"><b>가 격</b></td>
							</tr>

							<tr align="center" bgcolor="white">
								<td>2호+미니사이즈</td>
								<td>120,000원</td>
							</tr>
							<tr align="center" bgcolor="white">
								<td>3호+1호사이즈</td>
								<td>160,000원</td>
							</tr>
							<tr align="center" bgcolor="white">
								<td>4호+2호사이즈</td>
								<td>200,000원</td>
							</tr>
						</table>
				</div>
				<hr class="my-4" />
				<!-- Post preview-->
				<div class="post-preview">
					<img src="assets/img/1danCake.JPG" alt="My Image"
						style="width: 250px; height: 250px; float: left; margin-right: 190px">
					<img src="assets/img/2danCake.JPG" alt="My Image" width="250" height="250px">
				</div>
				<!-- Pager-->
				<br>
			</div>

		</div>
	</div>
	<!-- Footer-->
	<footer class="border-top">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a
							href="https://www.instagram.com/poonpoon_cake/"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-instagram fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<div class="small text-center text-muted fst-italic">Address
						: Jeonbuk, Jeonju-si, Wansan-gu, Hyoja-dong 2-ga, 1253-1</div>
					<div class="small text-center text-muted fst-italic">Phone :
						010-2455-1223</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
