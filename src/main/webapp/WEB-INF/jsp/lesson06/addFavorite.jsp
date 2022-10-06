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
			<div class="d-flex">
				<input type="text" id="url" class="form-control">
				<button type="button" id="urlCheckBtn" class="btn btn-info ml-2">중복확인</button>
			</div>
			<small id="isDuplicationText" class="text-danger d-none">중복된 url 입니다.</small>
			<small id="availableText" class="text-success d-none">저장 가능한 url 입니다.</small>
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
		
		// 중복확인 완료 확인
		if ($('#availableText').hasClass('d-none')) { // d-none이 있으면 확인 안된 것
			alert("중복된 url 입니다. 중복 확인을 해 주세요");
			return;
		}
		
		// AJAX - 서버에 인서트 요청
		$.ajax({
			// req
			type: "POST"
			, url: "/lesson06/add_favorite"
			, data: {"name":name, "url":url}
		
			// res
			, success: function(data) {  // data 파라미터는 요청에 대한 응답값이다.
				//alert(data);
				if (data == "success") {
					location.href = "/lesson06/get_favorite_view";
				} else {
					alert("입력 실패");
				}
			}
			, error: function(e) {  // request, status, error
				alert("에러:" + e);
			}
		});
	});
	
	// 중복확인 버튼 클릭
	$('#urlCheckBtn').on('click', function() {
		// #urlStatusArea 하위 태그 초기화
		$('#urlStatusArea').empty();
		
		// validation
		let url = $('#url').val().trim();
		if (url == "") {
			alert("검사할 url을 입력하세요");
			return;
		}
		
		// 중복 검사
		$.ajax({
			// req
			type:"POST"
			, url:"/lesson06/is_duplication_url"
			, data:{"url":url}
			
			// res
			, success:function(data) {  // json string => object 화(jquery ajax 함수가 파싱해줌)
				//alert(data.is_duplication);
				if(data.isDuplication) {
					// 중복
					$('#isDuplicationText').removeClass('d-none');
					$('#availableText').addClass('d-none');
				} else {
					// 사용 가능
					$('#isDuplicationText').addClass('d-none');
					$('#availableText').removeClass('d-none');
				}
			}
			, error:function(e) {
				alert("중복 확인 실패");
			}
		});
	});
	
});
</script>
</body>
</html>