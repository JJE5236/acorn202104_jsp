<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/ajax_form.jsp</title>
</head>
<body>
<div class="container">
	<form action="insert.jsp" method="post" id="insertForm">
		<input type="hidden" name="imagePath" id="imagePath"/>
		<div>
			<label for="caption">설명</label>
			<input type="text" name="caption" id="caption"/>
		</div>
	</form>
	<form action="ajax_upload.jsp" method="post" id="ajaxForm" enctype="multipart/form-data">
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image" 
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
	</form>
	<button id="submitBtn">등록</button>
	<div class="img-wrapper">
		<img />
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
<script>
	//이미지를 선택했을때 실행할 함수 등록
	document.querySelector("#image").addEventListener("change", function(){
		//id 가 ajaxForm 인 form 을 ajax 전송 시킨다.
		const form=document.querySelector("#ajaxForm");
		//util 함수를 이용해서 ajax 전송
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			//data 는  {imagePath:"업로드된 이미지 경로"}
			console.log(data);
			//이미지 경로에 context path 추가하기
			const path="${pageContext.request.contextPath}"+data.imagePath;
			//img 요소에 src 속성의 값 넣어주어서 이미지 출력하기 
			document.querySelector(".img-wrapper img")
				.setAttribute("src", path);
			//input type="hidden" 인 요소에 value 를 넣어준다.
			document.querySelector("#imagePath").value = data.imagePath;
		});
	});
	
	//등록 버튼을 눌렀을때 첫번째 form 을 강제 submit 시키기
	document.querySelector("#submitBtn")
		.addEventListener("click", function(){
			document.querySelector("#insertForm").submit();
		});
</script>
</body>
</html>





