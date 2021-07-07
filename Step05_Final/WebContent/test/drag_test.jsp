<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/drag_test.jsp</title>
<style>
	.drag-area{
		width: 500px;
		height: 300px;
		border: 2px dashed gray;
		border-radius: 20px;
	}
</style>
</head>
<body>
<h1>drag 테스트</h1>
<div class="drag-area"></div>
<input type="file" id="myFile"/>
<script>
	// dragenter 이벤트가 일어 났을때 실행할 함수 등록 
	document.querySelector(".drag-area")
		.addEventListener("dragenter", function(e){
			console.log("dragenter!");
			// drop 이벤트까지 진행될수 있도록 기본 동작을 막는다.
			e.preventDefault();
			// 이벤트 전파를 막는다 (불필요하게 부모 요소에 까지 이벤트가 도달하지 않도록)
			e.stopPropagation();
		});
	
	// dragover 이벤트가 일어 났을때 실행할 함수 등록 
	document.querySelector(".drag-area")
	.addEventListener("dragover", function(e){
		console.log("drageover!");
		// drop 이벤트까지 진행될수 있도록 기본 동작을 막는다.
		e.preventDefault();
		e.stopPropagation();
	});
	
	document.querySelector(".drag-area")
	.addEventListener("drop", function(e){
		console.log("drop!");
		e.preventDefault();
		e.stopPropagation();
	
		//drop 된 파일의 여러가지 정보를 담고 있는 object 
		const data = e.dataTransfer;
		//drop 된 파일객체를 저장하고 있는 배열
		const files = data.files;
		console.log(files);
		// input 요소에 drop 된 파일정보를 넣어준다. 
		document.querySelector("#myFile").files = files;
	});
</script>
</body>
</html>







