package com.kitri.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.kitri.admin.model.PathDto;
import com.kitri.common.service.CommonServiceImpl;
import com.kitri.gallery.model.GalleryDto;
import com.kitri.gallery.model.ReboardDto;
import com.kitri.gallery.service.*;
import com.kitri.member.model.MemberDto;
import com.kitri.util.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/picture")
public class PictureUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String saveDirectory;
	private int maxPostSize;
	private String encoding;
	
	public void init(ServletConfig config) {
		ServletContext context = config.getServletContext();
		saveDirectory = context.getRealPath("/upload/album");
		System.out.println(">>" + saveDirectory);
		maxPostSize = 3 * 1024 * 1024;
		encoding = Constant.DEFAULT_CHAR_SET;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DateFormat df = new SimpleDateFormat("yyMMdd");
		String today = df.format(new Date());
		String upfolder = saveDirectory + File.separator + today;
		File folder = new File(upfolder);
		if(!folder.exists()) {
			folder.mkdirs();
		}		
		
		MultipartRequest multi = new MultipartRequest(request, upfolder, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String act = multi.getParameter("act");
		
		HttpSession session = request.getSession();//session 생성
		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");//session에서 MemberDto get
		
		String path = "/index.jsp";
		if(memberDto != null) {//로그인 했다면.
			int seq = GalleryCommonServiceImpl.getCommonService().getNextSeq();//글번호 얻기
			
			GalleryDto galleryDto = new GalleryDto();
			galleryDto.setSeq(seq);
			galleryDto.setId(memberDto.getId());
			galleryDto.setName(memberDto.getName());
			galleryDto.setEmail(memberDto.getEmail()); 
			galleryDto.setSubject(multi.getParameter("subject"));
			galleryDto.setContent(multi.getParameter("content"));
			//galleryDto.setBcode(NumberCheck.nullToZero(multi.getParameter("bcode")));
			galleryDto.setOrignPicture(multi.getOriginalFileName("picturename"));
			galleryDto.setSavePicture(multi.getFilesystemName("picturename"));
			galleryDto.setSaveFolder(today);
			
			System.out.println(galleryDto.getBcode());
			PathDto pathDto = new PathDto();
			int cnt = GalleryServiceImpl.getGalleryService().writeArticle(galleryDto);
			if(cnt != 0) {
				request.setAttribute("seq", seq + "");
				pathDto.setPath("/default.jsp");
//				path = "/board/gallery.jsp";
				pathDto.setContentPath("/board/gallery.jsp");
				request.setAttribute("pathInfo", pathDto);
				PageMove.forward(pathDto.getPath(), request, response);
			
			} else {
				System.out.println("안넘어 왔다");
			}
		}
		//PageMove.forward(path, request, response);
	
	}
}








