<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form2.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>회원 가입 폼 입니다.</h1>
	<form action="signup.jsp" method="post" id="myForm">
		<div>
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
		</div>
		<div>
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<div>
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<div>
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="text" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		</div>
		<button class="btn btn-primary" type="submit">가입</button>
	</form>
	
</div>
<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	//아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
	let isIdValid=false;
	let isPwdValid=false;
	let isEmailValid=false;

	//아이디를 입력했을때(input) 실행할 함수 등록 
	$("#id").on("input", function(){
		//일단 is-valid,  is-invalid 클래스를 제거한다.
		$("#id").removeClass("is-valid is-invalid");
		
		//1. 입력한 아이디 value 값 읽어오기  
		let inputId=$(this).val();
		//입력한 아이디를 검증할 정규 표현식
		const reg_id=/^[a-z].{4,9}$/;
		//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
		if(!reg_id.test(inputId)){
			isIdValid=false; //아이디가 매칭되지 않는다고 표시하고 
			// is-invalid 클래스를 추가한다. 
			$("#id").addClass("is-invalid");
			return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
		}
		
		// jquery 를 이용해서 ajax 요청
		$.ajax({
			url:"checkid.jsp",
			method:"get",
			data:"inputId="+inputId,
			success:function(data){
				//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
				if(data.isExist){//만일 존재한다면
					//사용할수 없는 아이디라는 피드백을 보이게 한다. 
					isIdValid=false;
					// is-invalid 클래스를 추가한다. 
					$("#id").addClass("is-invalid");
				}else{
					isIdValid=true;
					$("#id").addClass("is-valid");
				}
			}
		});
	});
	
	//비밀 번호를 확인 하는 함수 
	function checkPwd(){
		
		$("#pwd").removeClass("is-valid is-invalid");
		
		const pwd=$("#pwd").val();
		const pwd2=$("#pwd2").val();
		
		// 최소5글자 최대 10글자인지를 검증할 정규표현식
		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isPwdValid=false;
			$("#pwd").addClass("is-invalid");
			return; //함수를 여기서 종료
		}
		
		if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isPwdValid=false;
			$("#pwd").addClass("is-invalid");
		}else{
			isPwdValid=true;
			$("#pwd").addClass("is-valid");
		}
	}
	
	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	$("#pwd").on("input", checkPwd);
	$("#pwd2").on("input", checkPwd);
	
	//이메일을 입력했을때 실행할 함수 등록
	$("#email").on("input", function(){
		
		$("#email").removeClass("is-valid is-invalid");
		
		//1. 입력한 이메일을 읽어와서
		const inputEmail=this.value;
		//2. 이메일을 검증할 정규 표현식 객체를 만들어서
		const reg_email=/@/;
		//3. 정규표현식 매칭 여부에 따라 분기하기
		if(reg_email.test(inputEmail)){//만일 매칭된다면
			isEmailValid=true;
			$("#email").addClass("is-valid");
		}else{
			isEmailValid=false;
			$("#email").addClass("is-invalid");
		}
	});
	
	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	$("#myForm").on("submit", function(e){
		//console.log(e);
		/*
			입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효 하지 않으면
			e.preventDefault(); 
			가 수행 되도록 해서 폼의 제출을 막아야 한다. 
		*/
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isIdValid && isPwdValid && isEmailValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송 막기 
			//e.preventDefault();
			//jquery 에서는 return false; 해도 폼 전송이 막아진다.
			return false;
		}	
	});
</script>
</body>
</html>





