<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery_test5.jsp</title>
</head>
<body>
<button id="hideBtn">숨기기</button>
<button id="showBtn">보이기</button>
<button id="toggleBtn">토글</button>
<br />
<img id="one" src="../images/kim1.png"/>

<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//숨기기 버튼을 눌렀을때 실행할 함수 등록 
	$("#hideBtn").on("click", function(){
		//id 가 one 인 요소를 숨기기
		//$("#one").hide();
		//$("#one").hide(1000);
		//$("#one").hide(1000, function(){
		//	alert("뿅~");
		//});
		$("#one").hide({
			duration:1000,
			complete:function(){
				alert("뿅~");
			}
		});
	});
	
	$("#showBtn").on("click", function(){
		$("#one").show();
	});
	$("#toggleBtn").on("click", function(){
		$("#one").toggle();
	});
</script>
</body>
</html>






