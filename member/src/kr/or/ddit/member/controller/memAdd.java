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

@WebServlet("/memAdd.do")
public class memAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memAdd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/memAdd.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
        String memPass = request.getParameter("memPass");
        String memName = request.getParameter("memName");
        String memTel = request.getParameter("memTel");
        String memAddr = request.getParameter("memAddr");
        String memPhoto = request.getParameter("memPhoto"); // 프로필 사진 경로 등

        MemberVO mv = new MemberVO();
        
        mv.setMem_id(memId);
		mv.setMem_pass(memPass);
		mv.setMem_name(memName);
		mv.setMem_tel(memTel);
		mv.setMem_addr(memAddr);
		mv.setMem_photo(memPhoto);
		
		IMemberService service = MemberServiceImpl.getInstance();
        // 결과에 따라 응답
		int cnt = service.memberAdd(mv);
		
		boolean success = cnt > 0;
		 if (success) {
	            response.getWriter().write("success");
	            response.sendRedirect(request.getContextPath()+"/list.do");
	        } else {
	            response.getWriter().write("fail");
	        }
	}

}
