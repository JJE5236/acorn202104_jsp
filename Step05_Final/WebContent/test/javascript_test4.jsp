<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/javascript_test4.jsp</title>
<link rel="icon" 
	href="${pageContext.request.contextPath}/images/kim1.png" 
	type="image/x-icon" />
</head>
<body>
<script>

	const util={
			readPromise:function(){
				const p = new Promise(function(resolve){
					//5 초 뒤에 호출되는 함수 등록 (5 초 뒤에 읽는 작업이 끝난다고 가정)
					setTimeout(function(){
						resolve("결과 data");
					}, 5000);
				});
				return p;
			},
			read: async function(){
				/*
				Promise 가 resolve 될때 까지 기다리는 await 예약어
				*/
				const result = await this.readPromise();
				console.log("read() 작업을 완료 했습니다.");
				console.log("result:"+result);
				if(this.onload){
					this.onload(result);
				}
			}
	};
	
	util.read();
	util.onload=function(data){
		alert(data);
	};
	
	console.log("페이지 로딩이 완료 됩니다.");
</script>
</body>
</html>









