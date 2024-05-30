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

@WebServlet("/idchk.do")
public class idchk extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idchk = request.getParameter("idchk");
        System.out.println(idchk);
        PrintWriter out = response.getWriter();
        IMemberService memberService = MemberServiceImpl.getInstance();
        int idCount = memberService.idcheck(idchk);
        System.out.println(idCount);
        
        boolean exists = idCount > 0;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if(exists) {
            out.print("not-usable");
        } else {
            out.print("usable");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}
