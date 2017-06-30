package com.kitri.gallery.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.action.Action;
import com.kitri.gallery.model.GalleryDto;
import com.kitri.gallery.service.GalleryServiceImpl;
import com.kitri.util.Encoding;
import com.kitri.util.NumberCheck;

public class GalleryListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
		int pg = NumberCheck.nullToOne(request.getParameter("pg"));
		String key = Encoding.nullToBlank(request.getParameter("key"));
		String word = Encoding.isoToEuc(request.getParameter("word"));
		
		List<GalleryDto> list = GalleryServiceImpl.getGalleryService().listArticle(bcode, pg, key, word);
		request.setAttribute("photoList", list);
		
		return "/board/gallery.jsp";
	}

}
