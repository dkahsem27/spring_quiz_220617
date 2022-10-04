<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<!-- header -->
			<jsp:include page="header.jsp" />
			<!-- contents:과거날씨 -->
			<div class="contents py-3 px-5">
				<h2 class="mb-5 font-weight-bold">과거 날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherhistory}" var="weather">
						<tr>
							<td>
								<fmt:parseDate value="${weather.date}" pattern="yyyy-MM-dd HH:mm:ss" var="stringToDate" />
								<fmt:formatDate value="${stringToDate}" pattern="yyyy년 M월 d일" />
							</td>
							<td>
							<c:choose>
								<c:when test="${weather.weather eq '흐림'}">
									<img src="/img/cloudy.jpg" alt="흐림">
								</c:when>
								<c:when test="${weather.weather eq '구름조금'}">
									<img src="/img/partlyCloudy.jpg" alt="구름조금">
								</c:when>
								<c:when test="${weather.weather eq '비'}">
									<img src="/img/rainy.jpg" alt="비">
								</c:when>
								<c:when test="${weather.weather eq '맑음'}">
									<img src="/img/sunny.jpg" alt="맑음">
								</c:when>
								<c:otherwise>
									${weather.weather}
								</c:otherwise>
							</c:choose>
							</td>
							<td>${weather.temperatures}℃</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>