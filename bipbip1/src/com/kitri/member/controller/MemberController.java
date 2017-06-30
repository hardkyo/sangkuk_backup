package com.kitri.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kitri.admin.model.PathDto;
import com.kitri.factory.MemberActionFactory;
import com.kitri.member.model.MemberDto;
import com.kitri.util.Constant;
import com.kitri.util.Encoding;
import com.kitri.util.NumberCheck;
import com.kitri.util.PageMove;

@WebServlet("/member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/index.jsp";

		// System.out.println("����������");
		// System.out.println(request.getParameter("id"));
		// System.out.println(request.getParameter("name"));
		// System.out.println(request.getParameter("pass"));
		// System.out.println(request.getParameter("email"));
		// System.out.println(request.getParameter("phone"));
		// System.out.println(request.getParameter("address"));

		// int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		// int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		// String key = Encoding.nullToBlank(request.getParameter("key"));
		// String word = request.getParameter("word");

/*
		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = Encoding.nullToBlank(request.getParameter("key"));
		String word = request.getParameter("word");

		if (request.getMethod().equals("GET"))
			word = Encoding.isoToEuc(word);

		word = Encoding.urlFormat(word);
		String queryStr = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + word;*/
		
		
//		
//		PrintWriter script = response.getWriter();
		PathDto pathDto = new PathDto();
		pathDto.setContentPath("/main/main.jsp");
		if (act != null || !act.isEmpty()) {
			pathDto.setPath("/default.jsp");
		} else {
			pathDto.setPath("/index.jsp");
		}

		if ("mvlogin".equals(act)) {
			pathDto.setContentPath("/member/login.jsp");
			pathDto.setTitleHead("�α���");

			request.setAttribute("pathInfo", pathDto);
			PageMove.forward(pathDto.getPath(), request, response);

		} else if ("mvjoin".equals(act)) {
			pathDto.setContentPath("/member/join.jsp");
			pathDto.setTitleHead("ȸ������");

			request.setAttribute("pathInfo", pathDto);
			PageMove.forward(pathDto.getPath(), request, response);

		} else if ("register".equals(act)) {
			// System.out.println("���Ͷ� ���� !!!");
			path = MemberActionFactory.getRegisterAction().execute(request, response);
			request.setAttribute("pathInfo", pathDto);
			// PageMove.forward(pathDto.getPath(), request, response);
			PageMove.forward(path, request, response);
			
		} else if ("login".equals(act)) {
//			 System.out.println("���Ͷ� ���� !!!");
			path = MemberActionFactory.getLoginAction().execute(request, response);

			request.setAttribute("pathInfo", pathDto);
			PageMove.forward(path, request, response);
			
		} else if ("logout".equals(act)) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect(root + path);
			
		} else if ("modify".equals(act)) {
			path = MemberActionFactory.getModifyAction().execute(request, response);
			PageMove.forward(path, request, response);

		} else if ("mvmodify".equals(act)) {
//			System.out.println("�Ѿ����??");
			pathDto.setContentPath("/member/modify.jsp");
			pathDto.setTitleHead("ȸ����������");
			
			path = MemberActionFactory.getMvmodifyAction().execute(request, response);
			
			request.setAttribute("pathInfo", pathDto);
			PageMove.forward(pathDto.getPath(), request, response);

		} else if ("memberdelete".equals(act)) {
			path = MemberActionFactory.getDeleteAction().execute(request, response);
			PageMove.forward(path, request, response);
			
//			response.sendRedirect("logout");
			
		} else if ("idsearch".equals(act)) {
			path = MemberActionFactory.getIdcheckAction().execute(request, response);
			PageMove.forward(path, request, response);
		
		} else if ("".equals(act)) {

		} else if ("".equals(act)) {

		} else if ("".equals(act)) {

		} else if ("".equals(act)) {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding(Constant.DEFAULT_CHAR_SET);
		doGet(request, response);
	}

}