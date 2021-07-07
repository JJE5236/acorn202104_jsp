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
	
	//5초 뒤에 resolve 되는  Promise 객체를 리턴하는 함수
	function readPromise(){
		const p = new Promise(function(resolve){
			//5 초 뒤에 호출되는 함수 등록 (5 초 뒤에 읽는 작업이 끝난다고 가정)
			setTimeout(function(){
				resolve("결과 data");
			}, 5000);
		});
		return p;
	}
	
	// 함수 안에 await 가 있으면  async 예약어를 함수에 붙여 줘야 한다. 
	async function read(){
		/*
			Promise 가 resolve 될때 까지 기다리는 await 예약어
		*/
		const result = await readPromise();
		console.log("read() 작업을 완료 했습니다.");
		console.log("result:"+result);
	}
	
	read();
	
	console.log("페이지 로딩이 완료 됩니다.");
</script>
</body>
</html>









