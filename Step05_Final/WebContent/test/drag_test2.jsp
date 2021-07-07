<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/drag_test2.jsp</title>
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
<img id="myImage"/>
<script>
	// dragenter 이벤트가 일어 났을때 실행할 함수 등록 
	document.querySelector(".drag-area")
		.addEventListener("dragenter", function(e){
			// drop 이벤트까지 진행될수 있도록 기본 동작을 막는다.
			e.preventDefault();
			e.stopPropagation();
		});
	
	// dragover 이벤트가 일어 났을때 실행할 함수 등록 
	document.querySelector(".drag-area")
	.addEventListener("dragover", function(e){
		// drop 이벤트까지 진행될수 있도록 기본 동작을 막는다.
		e.preventDefault();
		e.stopPropagation();
	});
	
	document.querySelector(".drag-area")
	.addEventListener("drop", function(e){
		
		e.preventDefault();
		e.stopPropagation();
		
		//drop 된 파일의 여러가지 정보를 담고 있는 object 
		const data = e.dataTransfer;
		//drop 된 파일객체를 저장하고 있는 배열
		const files = data.files;
		
		// input 요소에 drop 된 파일정보를 넣어준다. 
		document.querySelector("#myFile").files = files;
		// 한개만 drop 했다는 가정하에서 drop 된 파일이 이미지 파일인지 여부 알아내기
		const reg=/image.*/;
		const file = files[0];
		//drop 된 파일의 mime type 확인해 보기
		console.log(file.type);
		if(file.type.match(reg)){
			console.log("이미지 파일 이네요!");
			readImageFile(file);
		}else{
			console.log("이미지 파일이 아니네요!");
		}
	});
	
	
	function readImageFile(file){
		const reader=new FileReader();
		//이미지 파일을 data url 형식으로 읽어들이기
		reader.readAsDataURL(file);
		//다 읽었을때 실행할 함수 등록 
		reader.onload=function(e){
			//읽은 이미지 데이터 ( img 요소의 src 속성의 value 로 지정하면 이미지가 나온다. )
			console.log(e.target.result);
			document.querySelector("#myImage")
				.setAttribute("src", e.target.result);
		};
	}
</script>
</body>
</html>


















