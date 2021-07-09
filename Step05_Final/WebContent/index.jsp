<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 영역에 id 라는 키값으로 저장된 문자열 읽어와보기 ( null 이 아니면 로그인 된 것이다 )
	String id=(String)request.getSession().getAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<script src="https://gist.github.com/oli999/84fac63d9f56cafcb653679b68883e76.js"></script>
</div>
<%
	//쿠키 읽어오기
	Cookie[] cookies=request.getCookies();
	//팝업을 띄울지 여부
	boolean isPopup=true;
	if(cookies != null){
		//반복문 돌면서 저장된 쿠키를 얻어내서 
		for(Cookie tmp : cookies){
			//isPopup 이라는 이름으로 저장된 쿠키가 있으면 
			if(tmp.getName().equals("isPopup")){
				//팝업을 띄우지 않게 한다.
				isPopup=false;
			}
		}
	}
%>

<%if(isPopup){%>
	<script>
		/*
			[ 팝업창 띄우기 ]
			
			widow 객체의 .open() 함수를 이용해서 팝업창을 띄울수 있다.
			
			.open(띄울페이지, 제목(동작안함), 옵션 )
		*/
		window.open("sale.jsp", "창의제목", "width=800,height=500,top=100,left=100");
	</script>
<%}%>
</body>
</html>








