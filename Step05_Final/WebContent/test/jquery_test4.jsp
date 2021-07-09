<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery_test4.jsp</title>
<link rel="stylesheet" href="jquery.datetimepicker.min.css" />
</head>
<body>
<form action="insert.jsp" method="post">
	<label for="data">생일 입력</label>
	<input type="text" name="date" id="date" placeholder="생일 입력..."/>
	<button type="submit">저장</button>
</form>
<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="jquery.datetimepicker.full.min.js"></script>
<script>
	$("#date").datetimepicker({
		timepicker:false
	});
	//언어를 한국어로 셋팅
	$.datetimepicker.setLocale('ko');
</script>
</body>
</html>






