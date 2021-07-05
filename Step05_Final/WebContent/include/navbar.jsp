<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	// thisPage 라는 파라미터명으로 전달되는 문자열을 얻어와 본다. 
    	// null or "file" or "cafe"
    	String thisPage=request.getParameter("thisPage");
    	// thisPage 가 null 이면 index.jsp 페이지에 포함된 것이다. 
    	//System.out.println(thisPage);
    	//만일 null 이면 
    	if(thisPage==null){
    		//빈 문자열을 대입한다. (NullPointerException 방지용)
    		thisPage="";
    	}
    	//로그인 된 아이디 읽어오기 
    	String id=(String)session.getAttribute("id");
    %>
	<nav class="navbar navbar-light bg-light navbar-expand-lg">
		<div class="container-fluid">
		    <a class="navbar-brand" href="<%=request.getContextPath() %>/">
		      	<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
		      	MonkeyStrap
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse" id="navbarNav">
      			<ul class="navbar-nav me-auto">
      				<li class="nav-item">
	          			<a class="nav-link <%=thisPage.equals("file") ? "active" : "" %>" href="<%=request.getContextPath() %>/file/list.jsp">자료실</a>
	        		</li>
	        		<li class="nav-item">
	          			<a class="nav-link <%=thisPage.equals("cafe") ? "active" : "" %>" href="<%=request.getContextPath() %>/cafe/list.jsp">카페</a>
	        		</li>
	     			<li class="nav-item">
	          			<a class="nav-link <%=thisPage.equals("gallery") ? "active" : "" %>" href="<%=request.getContextPath() %>/gallery/list.jsp">겔러리</a>
	        		</li>
      			</ul>
      			<%if(id==null){ %>
      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
      			<%}else{ %>
      				<span class="navbar-text me-2">
      					<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a> 로그인중...
      				</span>
      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
      			<%} %>
    		</div>
		</div>
	</nav>
	
	
	
	
	
	
	
	
	
	
	