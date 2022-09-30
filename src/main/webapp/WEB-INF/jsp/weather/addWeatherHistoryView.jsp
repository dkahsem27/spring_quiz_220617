<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="/css/weatherStyle.css">
</head>
<body>
	<div id="wrap">
		<div class="d-flex">
			<aside>
				<a href="/weather_history_view" class="logo py-3"><img src="/img/kmaLogo.png" alt="로고"></a>
				<nav class="menu py-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a href="#" class="nav-link">날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-link">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link">관측 기후</a></li>
					</ul>
				</nav>
			</aside>
			<div class="contents py-3 px-5">
				<h2>날씨 입력</h2>
				<div class="form-outer">
					<form method="post" action="">
						<div class="d-flex justify-content-between align-items-center">
							<div class="input-group">
								<label for="date">날짜</label>
								<input type="text" id="date" name="date" class="form-control">
							</div>
							<div class="input-group ml-5">
								<label for="weather">날씨</label>
								<select id="weather" name="weather" class="form-control">
									<option>-</option>
								</select>
							</div>
							<div class="input-group ml-5">
								<label for="weather">미세먼지</label>
								<select id="weather" name="weather" class="form-control">
									<option>-</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<div class="input-group">
								<label for="temperatures">기온</label>
							  	<input type="text" class="form-control">
							  	<span class="input-group-text" id="temperatures">C</span>
							</div>
							<div class="input-group ml-5">
								<label for="temperatures">강수량</label>
							  	<input type="text" class="form-control">
							  	<span class="input-group-text" id="temperatures">mm</span>
							</div>
							<div class="input-group ml-5">
								<label for="temperatures">풍속</label>
							  	<input type="text" class="form-control">
							  	<span class="input-group-text" id="temperatures">km/h</span>
							</div>
						</div>
						<button type="submit" class="btn btn-success">저장</button>
					</form>
				</div>
			</div>
		</div>
		<footer class="d-flex py-3">
			<div class="logo px-3"><img src="/img/kmaLogo.png" alt="로고"></div>
			<address class="px-5 text-secondary">
				<div class="address">(07062) 서울시 동작구 여의대방로16길 61</div>
				<div class="copyright">Copyright@2020 KMA. All Rights RESERVED.</div>
			</address>
		</footer>
	</div>
</body>
</html>