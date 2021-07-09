<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery_test.jsp</title>
</head>
<body>
<h1>jquery 테스트</h1>
<div>div1</div>
<div>div2</div>
<div>div3</div>
<div>div4</div>
<div>div5</div>

<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//페이지 로딩 시점에 5개 div 의 innerText 를 "김구라" 로 수정하기 
	/*
	const divs=document.querySelectorAll("div");
	for(let i=0; i<divs.length; i++){
		divs[i].innerText="김구라";
	}
	*/
	
	//jquery 를 활용하면 아래와 같은 코드가 된다.
	$("div").text("김구라");
	
</script>
</body>
</html>






