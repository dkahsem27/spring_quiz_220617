<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
    <%-- Ajax를 사용하려면 jquery 원본이 있어야 한다. --%>
	<!-- jquery : bootstrap, datepicker -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th colspan="2">주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favoriteList}" var="favorite">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
						<%-- (1) name 이벤트, value 속성을 이용해서 동적으로 id 보내기 --%>
						<%-- <button type="button" class="btn btn-danger" name="delBtn" value="${favorite.id}">삭제</button> --%>
						
						<%-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<script>
$(document).ready(function() {
	// (1) name 이벤트, value 속성을 이용해서 동적으로 id 보내기
	/* $('td').on('click', 'button[name=delBtn]', function(e) {
		//let id = $(this).attr('value');
		let id = e.target.value;
		alert(id);
	}); */
	
	// (2) data를 이용해서 태그에 data를 임시 저장해놓기
	// 태그: data-favorite-id       data-이름지어준다. (반드시 하이픈 형식, 대문자 절대 X)
	// 스크립트: $(this).data('favorite-id');
	$('.del-btn').on('click', function() {
		let favoriteId = $(this).data('favorite-id');
		//alert(favoriteId);
		
		// AJAX -> 삭제할 id db
		$.ajax({
			// request
			type:"DELETE"
			, url:"/lesson06/delete_favorite"
			, data:{"id":favoriteId}
		
			// response
			, success:function(data) { // json string => object
				if (data.code == 100) {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(e) {
				alert("에러");
			}
		});
	});
});
</script>
</body>
</html>