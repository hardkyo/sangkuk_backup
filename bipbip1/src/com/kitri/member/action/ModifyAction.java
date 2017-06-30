package com.kitri.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.action.Action;
import com.kitri.member.model.MemberDto;
import com.kitri.member.service.MemberServiceImpl;

public class ModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		HttpSession session = request.getSession();//session ����
//		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");//session���� MemberDto get
		
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute("loginInfo");
		String path = "/index.jsp";
		if (memberDto != null) {
			MemberDto memberDto2 = new MemberDto();
			memberDto2.setId(memberDto.getId());
			memberDto2.setPass(request.getParameter("pass"));
			memberDto2.setEmail(request.getParameter("email"));
//			System.out.println(request.getParameter("email"));
			memberDto2.setAddress(request.getParameter("address"));
			int cnt = MemberServiceImpl.getMemberService().modify(memberDto2);
			if (cnt != 0) {
				path = "/member/modifyok.jsp";
				request.setAttribute("modifiInfo", memberDto2);
			} else {
				path = "/member/modifyfail.jsp";
			}
		}
		
		return path;
	}

}
