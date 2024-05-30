package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;





@WebServlet("/memModify.do")
public class memModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public memModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		IMemberService memService = MemberServiceImpl.getInstance();
		MemberVO mv = memService.memberdetail(memId);
		request.setAttribute("mv", mv);
		request.getRequestDispatcher("/memModify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        String mem_id = request.getParameter("memId");
        String mem_pass = request.getParameter("memPass");
        String mem_name = request.getParameter("memName");
        String mem_tel = request.getParameter("memTel");
        String mem_photo = request.getParameter("memPhoto");
        String mem_Adr = request.getParameter("memAdr");
        System.out.println(mem_photo);
        MemberVO member = new MemberVO();
        member.setMem_id(mem_id);
        member.setMem_pass(mem_pass);
        member.setMem_name(mem_name);
        member.setMem_tel(mem_tel);
        member.setMem_photo(mem_photo);
        member.setMem_addr(mem_Adr);

        IMemberService memberService = MemberServiceImpl.getInstance();
        int num = memberService.modifyMember(member);
        
        if(num > 0) {
			response.sendRedirect(request.getContextPath()+"/memberdetail.do?memId="+member.getMem_id());
		} else {
			request.getRequestDispatcher(request.getContextPath()+"/memberdetail.do?memId="+member.getMem_id()).forward(request, response);
		}

      
    
	}

}
