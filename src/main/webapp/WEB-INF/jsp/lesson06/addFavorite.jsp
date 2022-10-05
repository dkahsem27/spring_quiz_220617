<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
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
		<h1>즐겨찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" id="url" class="form-control">
		</div>
		
		<button type="button" id="addBtn" class="btn btn-success w-100">추가</button>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#addBtn').on('click', function(e) {
				e.preventDefault();
				
				// validation
				let name = $('#name').val().trim();
				let url = $('#url').val().trim();
				if (name == "") {
					alert("제목을 입력하세요");
					return;
				}
				if (url == "") {
					alert("주소를 입력하세요");
					return;
				}
				if (url.startsWith("http") == false && url.startsWith("https") == false) {
					alert("주소 형식이 잘못되었습니다");
					return;
				}
				
				// AJAX - 서버에 인서트 요청
				$.ajax({
					// req
					type: "POST"
					, url: "/lesson06/quiz01/add_favorite"
					, data: {"name":name, "url":url}
				
					// res
					, success: function(data) {  // data 파라미터는 요청에 대한 응답값이다.
						//alert(data);
						if (data == "success") {
							location.href = "/lesson06/quiz01/get_favorite_view";
						} else {
							alert("입력 실패");
						}
					}
					, error: function(e) {  // request, status, error
						alert("에러:" + e);
					}
				});
			});
		});
	</script>
</body>
</html>