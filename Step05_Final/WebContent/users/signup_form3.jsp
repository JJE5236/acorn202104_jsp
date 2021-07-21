<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>회원 가입 폼 입니다.</h1>
	<form v-on:submit="onSubmit" action="signup.jsp" method="post" id="myForm">
		<div>
			<label class="control-label" for="id">아이디</label>
			<input v-on:input="onIdInput" 
				   v-model="id"
				   v-bind:class="{'is-valid':isIdValid,'is-invalid':!isIdValid && isIdDirty}" 
				   class="form-control" type="text" name="id" id="id"/>
			<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
		</div>
		<div>
			<label class="control-label" for="pwd">비밀번호</label>
			<input v-model="pwd"
				   v-bind:class="{'is-valid':isPwdValid,'is-invalid':!isPwdValid}"
				   v-on:input="checkPwd"
				class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<div>
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input v-model="pwd2"
			       v-on:input="checkPwd"
				class="form-control" type="password" name="pwd2" id="pwd2"/>
		</div>
		<div>
			<label class="control-label" for="email">이메일</label>
			<input v-model="email"
			       v-on:input="onEmailInput"
			       v-bind:class="{'is-valid':isEmailValid,'is-invalid':!isEmailValid}"
			   class="form-control" type="text" name="email" id="email"/>
			<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
		</div>
		<button class="btn btn-primary" type="submit">가입</button>
	</form>
</div>
<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
<!-- vue js 로딩하기 -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	let app=new Vue({
	    el:"#myForm",
	    data:{
	        isIdValid:false,
	        isPwdValid:false,
	        isEmailValid:false,
	        isFormValid:false,
	        id:"",
	        pwd:"",
	        pwd2:"",
	        email:"",
	        isIdDirty:false  //아이디를 한번이라도 입력했는지 여부 
	    },
	    methods:{
	    	onSubmit:function(e){
	    		//폼 전체의 유효성 여부 알아내기 
	    		let isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
	    		if(!isFormValid){//폼이 유효하지 않으면
	    			//폼 전송 막기 
	    			e.preventDefault();
	    		}	
	    	},
	    	onEmailInput:function(){
	    		
	    		//1. 입력한 이메일을 읽어와서
	    		const inputEmail=this.email;
	    		//2. 이메일을 검증할 정규 표현식 객체를 만들어서
	    		const reg_email=/@/;
	    		//3. 정규표현식 매칭 여부에 따라 분기하기
	    		if(reg_email.test(inputEmail)){//만일 매칭된다면
	    			this.isEmailValid=true;
	    		}else{
	    			this.isEmailValid=false;
	    		}
	    	},
	    	checkPwd:function(){
	    		//모델 값을 읽어온다. 
	    		const pwd=this.pwd;
	    		const pwd2=this.pwd2;
	    		
	    		// 최소5글자 최대 10글자인지를 검증할 정규표현식
	    		const reg_pwd=/^.{5,10}$/;
	    		if(!reg_pwd.test(pwd)){
	    			//모델 값을 수정한다 
	    			this.isPwdValid=false;
	    			return; //함수를 여기서 종료
	    		}
	    		
	    		if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
	    			//비밀번호를 잘못 입력한것이다.
	    			this.isPwdValid=false;
	    		}else{
	    			this.isPwdValid=true;
	    		}
	    	},
	      	onIdInput:function(){
	      		//아이디를 한번이라도 입력하면 
	      		this.isIdDirty=true;
	    		//1. 입력한 아이디 value 값 읽어오기  
	    		let inputId=this.id;
	    		//입력한 아이디를 검증할 정규 표현식
	    		const reg_id=/^[a-z].{4,9}$/;
	    		//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
	    		if(!reg_id.test(inputId)){
	    			this.isIdValid=false; //아이디가 매칭되지 않는다고 표시하고 
	    			return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
	    		}
	    		//app 의 참조값을 me 에 담아 놓고 
	    		const me = this;
	    		
	    		//2. util 에 있는 함수를 이용해서 ajax 요청하기
	    		ajaxPromise("checkid.jsp", "get", "inputId="+inputId)
	    		.then(function(response){
	    			return response.json();
	    		})
	    		.then(function(data){
	    			console.log(data);
	    			//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
	    			if(data.isExist){//만일 존재한다면
	    				/*
	    					this 는 Promise 객체 를 가리키기 때문에 me 를 사용한다.
	    				*/
	    				me.isIdValid=false;			
	    			}else{
	    				me.isIdValid=true;
	    			}
	    		});
	      	}
	    }
	});

</script>
</body>
</html>





