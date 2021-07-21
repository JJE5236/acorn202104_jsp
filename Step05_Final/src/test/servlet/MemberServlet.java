package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/test_mvc/member")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 한명의 정보를 얻어오는 비즈니스 로직을 수행한다.
		MemberDto dto=new MemberDto();
		dto.setNum(1);
		dto.setName("김구라");
		dto.setAddr("노량진");
		
		//수행결과 Model 을 request 영역에 담는다.
		req.setAttribute("dto", dto);
		
		//view page (jsp) 페이지로 forward 이동해서 응답
		RequestDispatcher rd=req.getRequestDispatcher("/views/member.jsp");
		rd.forward(req, resp);
		
	}
}








