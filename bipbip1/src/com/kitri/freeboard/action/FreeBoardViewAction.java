package com.kitri.freeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.action.Action;
import com.kitri.freeboard.model.FreeBoardDto;
import com.kitri.freeboard.service.FreeBoardServiceImpl;
import com.kitri.util.NumberCheck;

public class FreeBoardViewAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "";
		System.out.println("앤션 오나?");
		path = "/board/freeboardview.jsp";
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		if (seq !=0) {
			FreeBoardDto dto = FreeBoardServiceImpl.getService().getArticle(seq);
			request.setAttribute("article", dto);
		System.out.println("여긴받난?" + seq + dto.getContent());
		}
		return path;
	}

}
