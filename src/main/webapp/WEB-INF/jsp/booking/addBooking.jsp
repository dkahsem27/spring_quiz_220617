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

    <!-- datepicker-->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="/css/booking.css">
</head>
<body>
	<div id="wrap" class="container">
		<!-- header -->
		<jsp:include page="header.jsp" />
		<!-- contents -->
		<div class="contents">
			<h2 class="text-center py-3">예약하기</h2>
			<div class="form-outer mb-5 col-4">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="date">예약날짜</label>
					<input type="text" id="date" class="form-control">
				</div>
				<div class="d-flex">
					<div class="form-group">
						<label for="day">숙박일수</label>
						<div class="d-flex align-items-center">
							<input type="number" id="day" class="form-control">
							<span class="ml-2">일</span>
						</div>
					</div>
					<div class="form-group ml-5">
						<label for="headcount">숙박인원</label>
						<div class="d-flex align-items-center">
							<input type="number" id="headcount" class="form-control">
							<span class="ml-2">명</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label>
					<input type="text" id="phoneNumber" class="form-control" maxlength="13">
				</div>
				<button type="button" id="addBtn" class="btn btn-block btn-dark">예약하기</button>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>
	
<script>
$(document).ready(function() {
	// datepicker
	$('#date').datepicker({
		dateFormat: 'yy-mm-dd'
		, minDate: 0 // 오늘 이후만 선택 가능
	});
	
	// 전화번호 하이픈 자동 추가 정규식
	$(document).on('keyup', '#phoneNumber', function() {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	});
	
	// 예약하기
	$('#addBtn').on('click', function(e) {
		e.preventDefault();
		
		// validation
		let name = $('#name').val().trim();
		let date = $('#date').val().trim();
		let day = $('#day').val().trim();
		let headcount = $('#headcount').val().trim();
		let phoneNumber = $('#phoneNumber').val().trim();
		
		if (name == "") {
			alert("이름을 입력하세요");
			$('#name').focus();
			return;
		}
		if (date == "") {
			alert("예약날짜를 선택해주세요");
			$('#date').focus();
			return;
		}
		if (day == "") {
			alert("숙박일수를 입력하세요");
			$('#day').focus();
			return;
		}
		if (isNaN(day)) {
			alert("숫자만 입력하세요");
			$('#day').focus();
			return;
		}
		if (day < 1) {
			alert("숙박일수를 1일 이상 입력해주세요");
			$('#day').focus();
			return;
		}
		if (headcount == "") {
			alert("숙박인원을 입력하세요");
			$('#headcount').focus();
			return;
		}
		if (isNaN(headcount)) {
			alert("숫자만 입력하세요");
			$('#headcount').focus();
			return;
		}
		if (headcount < 1) {
			alert("숙박인원은 1명 이상 입력해주세요");
			$('#headcount').focus();
			return;
		}
		if (phoneNumber == "") {
			alert("전화번호를 입력하세요");
			$('#phoneNumber').focus();
			return;
		}
		
		// ajax
		$.ajax({
			// req
			type: "POST"
			, url: "/booking/add_booking"
			, data: {"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber, "state":"대기중"}
			
			// res
			, success: function(data) {
				if (data == "성공") {
					location.href = "/booking/booking_list_view";
				} else {
					alert("예약 추가 실패");
				}
			}
			, error: function(e) {
				alert("에러" + e);
			}
		});
	});
});
</script>
</body>
</html>