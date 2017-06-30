package com.kitri.map.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.action.Action;
import com.kitri.admin.model.PathDto;
import com.kitri.map.dao.MapDaoImpl;
import com.kitri.map.model.MapDto;
import com.kitri.map.service.MapService;
import com.kitri.map.service.MapServiceImpl;
import com.kitri.util.PageMove;

public class MapWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO ��� üũ���� ����
		PathDto pathDto = new PathDto();
		//HttpSession session = request.getSession();
		//MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
		//session���� MemberDto�� �ҷ��´�.
		// memberDto Ȯ��
		
		System.out.println("ACtion������ �Խ��ϴ�.");
		String root = request.getContextPath();
		String path = "/map/mapview.jsp";
		String act = "view";
		// int seq : ������ ���� ����? �ƴϸ� ����?
		MapDto mapDto = new MapDto();
		mapDto.setLoc1X(Double.parseDouble(request.getParameter("loc1X")));
		mapDto.setLoc1Y(Double.parseDouble(request.getParameter("loc1Y")));
		mapDto.setLoc2X(Double.parseDouble(request.getParameter("loc2X")));
		mapDto.setLoc2Y(Double.parseDouble(request.getParameter("loc2Y")));
		mapDto.setSec1X(Double.parseDouble(request.getParameter("sec1X")));
		mapDto.setSec1Y(Double.parseDouble(request.getParameter("sec2Y")));
		mapDto.setSec2X(Double.parseDouble(request.getParameter("sec2X")));
		mapDto.setSec2Y(Double.parseDouble(request.getParameter("sec2Y")));
		mapDto.setSec3X(Double.parseDouble(request.getParameter("sec3X")));
		mapDto.setSec3Y(Double.parseDouble(request.getParameter("sec3Y")));
		mapDto.setLoc1(request.getParameter("loc1"));
		mapDto.setLoc2(request.getParameter("loc2"));
		mapDto.setSec1(request.getParameter("sec1"));
		mapDto.setSec2(request.getParameter("sec2"));
		mapDto.setSec3(request.getParameter("sec3"));
		mapDto.setMemo(request.getParameter("memo"));

		int check = MapServiceImpl.getMapService().writeMapArticle(mapDto);
		
		if(check!=0){
			System.out.println(check + " of data saved.");

			request.setAttribute("mapDto", mapDto);
			
			pathDto.setPath("/default.jsp");
			pathDto.setTitleHead("��� Ȯ��");
			pathDto.setContentPath("/map/mapview.jsp");
			
			request.setAttribute("pathInfo", pathDto);
	        //PageMove.forward(pathDto.getPath(), request, response);
			
		} else {
			System.out.println("Data insert has failed");
			pathDto.setContentPath("/index.jsp");
			PageMove.forward(pathDto.getPath(), request, response);
		}
		 //<< �� �������� ������ ����*/

		return path;
	}

}
