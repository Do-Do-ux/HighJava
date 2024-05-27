package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/memberdetail.do")
public class memberdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memberdetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("memId");
		request.setAttribute("memId", mem_id);
		IMemberService member = MemberServiceImpl.getInstance();
		MemberVO memberdetail = member.memberdetail(mem_id);
		request.setAttribute("memberdetail", memberdetail);
		request.getRequestDispatcher("/memberdetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
