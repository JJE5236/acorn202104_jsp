<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/javascript_test.jsp</title>
</head>
<body>
<script>
	/*
		javascript 비동기 작업 테스트
	*/
	//5초 뒤에 resolve 되는 promise객체를 리턴하는 함수
	function readPrmise(){
		const p = new Promise(function(resolve){
			//5초 뒤에 호출되는 함수 등록(5초뒤에 읽는 작업이 끝난다고 가정)
			setTimeout(function(){
				resolve("결과  data")
			},5000);
			
		});
		return p;
	}
	
	//함수 안에  await가 있으면 async예약어를 함수에 붙여 줘야 한다.
	async function read(){
		/*
			Promise가 resolve 될때까지 기다리는 await 예약어
		*/
		const result = await readPromise();
		console.log("read() 작업을 완료 했습니다");
		console.log("result:"+result);
	}
	
	read();
	
	console.log("페이지 로딩이 완료 됩니다.");
</script>
</body>
</html>