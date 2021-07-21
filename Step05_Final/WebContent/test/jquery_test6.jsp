<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery_test6.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		border: 1px solid red;
		background-color: yellow;
	}
</style>
</head>
<body>
<button id="enlargeBtn">확대</button>
<div class="box"></div>
<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$("#enlargeBtn").on("click", function(){
		$(".box").animate({
			width:"200px",
			height:"200px",
			borderWidth:"10px",
			marginLeft:"+=100px"
		}, 2000, function(){
			alert("짠!");
		});
	});
</script>
</body>
</html>






