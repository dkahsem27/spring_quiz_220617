<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
    <%-- Ajax를 사용하려면 jquery 원본이 있어야 한다. --%>
	<!-- jquery : bootstrap, datepicker -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- css -->
	<link rel="stylesheet" href="/css/booking.css">
</head>
<body>
	<div id="wrap" class="container">
		<!-- header -->
		<jsp:include page="header.jsp" />
		<!-- contents -->
		<div class="contents">
			<section class="banner-image-area">
				<img src="/img/booking/test06_banner1.jpg" alt="배너" id="bannerImage">
			</section>
			<section class="booking-confirm-area">
				<div class="d-flex">
					<div class="left-area col-4 py-5">
						실시간 <br>
						예약하기
					</div>
					<div class="confirm-area col-4 py-3">
						<h5 class="mb-3">예약 확인</h5>
						<div class="form-group d-flex align-items-center">
							<label for="name">이름</label>
							<input type="text" id="name" class="form-control">
						</div>
						<div class="form-group d-flex align-items-center">
							<label for="phoneNumber">전화번호</label>
							<input type="text" id="phoneNumber" class="form-control">
						</div>
						<div class="d-flex justify-content-end">
							<button type="button" id="searchBtn" class="btn btn-dark">조회하기</button>
						</div>
					</div>
					<div class="right-area col-4 py-5">
						<h4>예약 문의📱</h4>
						010-1234-5678
					</div>
				</div>
			</section>
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>

<script>
$(document).ready(function() {
	
	// 배너 이미지 슬라이드
	let bannerSrcArr = ['/img/booking/test06_banner1.jpg', '/img/booking/test06_banner2.jpg', '/img/booking/test06_banner3.jpg', '/img/booking/test06_banner4.jpg'];
	let currentIndex = 0;
	/* setInterval(function() {
		$('#bannerImage').attr('src', bannerSrcArr[currentIndex]);
		currentIndex++;
		
		if (currentIndex > bannerSrcArr.length) {
			currentIndex = 0;
		}
	}, 3000); */
});
</script>
</body>
</html>