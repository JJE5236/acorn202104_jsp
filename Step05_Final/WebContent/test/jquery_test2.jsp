<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery_test2.jsp</title>
</head>
<body>
<h1>jquery 테스트</h1>
<div>div1</div>
<div>div2</div>
<div id="one">div3</div>
<div id="two">div4</div>
<div id="three">div5</div>

<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/*
		id 가 one 인 요소의 
		1. innerText 를 "김구라"
		2. 글자의 색을 "red"  
		3. class 속성의 값을 "my-class"
		로 변경해 보세요.
	*/
	
	
	const a = document.querySelector("#one");
	a.innerText="김구라";
	a.style.color="red";
	a.setAttribute("class", "my-class");
	
	
	$("#two").text("김구라");
	$("#two").css("color","red");
	$("#two").attr("class","my-class");
	
	$("#three")
	.text("김구라")
	.css("color","red")
	.attr("class","my-class");

	</script>
</body>
</html>






