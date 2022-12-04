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

</head>
<body>
	
	<!-- Navigation-->
	<%@ include file="/include/menuBar.jsp" %>
	
	<!-- Page Header-->
	<header class="masthead"
		style="background-image: url('assets/img/home-bg.jpg')">
		<div class="container position-relative px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<div class="page-heading">
						<h1>Location</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Main Content-->
	<main class="mb-4">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div id="map" style="width: 1000px; height: 600px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=531c437217a0af3de767c3420d7c1e0b"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
					center: new kakao.maps.LatLng(35.811938799999936, 127.09903629999972),
					level: 1
					};
					var map = new kakao.maps.Map(container, options);
					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(35.811938799999936, 127.09903629999972); 

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				</script>
				
				<div class="col-md-10 col-lg-8 col-xl-7" style="text-align:center;">
				<br/>
				<h5>주소 : 전북 전주시 완산구 효자동2가 1253-1 푼푼케이크</h5>
				</div>
			</div>
		</div>
	</main>
	<!-- Footer-->
	<footer class="border-top">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="https://www.instagram.com/poonpoon_cake/"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-instagram fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>			
					<div class="small text-center text-muted fst-italic">Address : Jeonbuk, Jeonju-si, Wansan-gu, Hyoja-dong 2-ga, 1253-1</div>
					<div class="small text-center text-muted fst-italic">Phone : 010-2455-1223</div>
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