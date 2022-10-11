<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<h2 class="text-center py-3">예약 목록 보기</h2>
			<table class="table text-center mb-5">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th><%-- 빈태그 --%></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${bookingList}" var="booking">
					<tr>
						<td>${booking.name}</td>
						<td>
							<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" />
						</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state eq '대기중'}">
									<span class="text-success">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state eq '확정'}">
									<span class="text-info">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state eq '취소'}">
									<span class="text-danger">${booking.state}</span>
								</c:when>
							</c:choose>
						</td>
						<td>
							<button type="button" class="btn btn-outline-danger del-btn" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>

<script>
$(document).ready(function() {
	// 삭제하기
	$('.del-btn').on('click', function() {
		let bookingId = $(this).data('booking-id');
		//alert(bookingId);
		
		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				// req
				type: "DELETE"
				, url: "/booking/delete_booking"
				, data: {"id":bookingId}
				
				// res
				, success: function(data) {
					if (data.code == 100) {
						alert("삭제되었습니다.");
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("에러" + e);
				}
			});
		}
	});
});
</script>
</body>
</html>