package com.kitri.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.action.Action;
import com.kitri.member.model.MemberDto;
import com.kitri.member.service.MemberService;
import com.kitri.member.service.MemberServiceImpl;

public class RegisterAction implements Action {

//	1. data get (
//    request(����, ����, �Խ��ǹ�ȣ), 
//    session(�̸�, ���̵�, �̸���)
//    db (�۹�ȣ)
//2. logic (service >> dao) insert
// 1�� data�� �̿��Ͽ�  Dto����� service�� ����.
//3. 2�� ����� ���� view page ����.
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDto memberDto = new MemberDto();
		
		String path = "/index.jsp";
		memberDto.setId(request.getParameter("id"));
		memberDto.setName(request.getParameter("name"));
		memberDto.setPass(request.getParameter("pass"));
		memberDto.setPhone(request.getParameter("phone"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setAddress(request.getParameter("address"));
		
//		System.out.println("����������");
//		System.out.println(request.getParameter("id"));
//		System.out.println(request.getParameter("name"));
//		System.out.println(request.getParameter("pass"));
//		System.out.println(request.getParameter("email"));
//		System.out.println(request.getParameter("phone"));
//		System.out.println(request.getParameter("address"));
		
		int cnt = MemberServiceImpl.getMemberService().register(memberDto);
//		System.out.println(cnt);
		if (cnt != 0) {
			path = "/member/joinok.jsp";
			request.setAttribute("userInfo", memberDto);
		}else {
			path = "/member/joinfail.jsp";
		}
		
		return path;
	}

}
