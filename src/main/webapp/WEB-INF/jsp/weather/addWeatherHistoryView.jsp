<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
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
	<link rel="stylesheet" href="/css/weatherStyle.css">
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<!-- header -->
			<jsp:include page="header.jsp" />
			<!-- contents:날씨입력 -->
			<div class="contents py-3 px-5">
				<h2 class="mb-5 font-weight-bold">날씨 입력</h2>
				<div class="form-outer">
					<form method="post" action="/add_weather_history">
						<div class="d-flex justify-content-between align-items-center">
							<div class="input-group align-items-center">
								<label for="date">날짜</label>
								<input type="text" id="date" name="date" class="form-control ml-2">
							</div>
							<div class="input-group align-items-center ml-5">
								<label for="weather">날씨</label>
								<select id="weather" name="weather" class="form-control ml-2">
									<option value="맑음">맑음</option>
									<option value="구름조금">구름조금</option>
									<option value="흐림">흐림</option>
									<option value="비">비</option>
								</select>
							</div>
							<div class="input-group align-items-center ml-5">
								<label for="microDust">미세먼지</label>
								<select id="microDust" name="microDust" class="form-control ml-2">
									<option value="좋음">좋음</option>
									<option value="보통">보통</option>
									<option value="나쁨">나쁨</option>
									<option value="최악">최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3">
							<div class="input-group align-items-center">
								<label for="temperatures">기온</label>
							  	<input type="text" id="temperatures" name="temperatures" class="form-control ml-2">
							  	<span class="input-group-text" id="temperatures">℃</span>
							</div>
							<div class="input-group align-items-center ml-5">
								<label for="precipitation">강수량</label>
							  	<input type="text" id="precipitation" name="precipitation" class="form-control ml-2">
							  	<span class="input-group-text" id="precipitation">mm</span>
							</div>
							<div class="input-group align-items-center ml-5">
								<label for="windSpeed">풍속</label>
							  	<input type="text" id="windSpeed" name="windSpeed" class="form-control ml-2">
							  	<span class="input-group-text" id="windSpeed">km/h</span>
							</div>
						</div>
						<div class="d-flex justify-content-end mt-4">
							<button type="submit" class="btn btn-success">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$('#date').datepicker({
				dateFormat: "yy-mm-dd",
				timeFormat: "hh:mm:ss"
			});
		});
	</script>
</body>
</html>