package com.kitri.map.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.model.PathDto;
import com.kitri.factory.MapActionFactory;
import com.kitri.util.*;

@WebServlet("/map")
public class MapController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String act = request.getParameter("act");

      int bcode = NumberCheck.nullToZero(request.getParameter("bcode"));
      int pg = NumberCheck.nullToOne(request.getParameter("pg"));
      String key = Encoding.nullToBlank(request.getParameter("key"));
      String word = request.getParameter("word");

	  System.out.println("act 값은 다음과 같습니다. ::: "+request.getParameter("act"));
      
      if (request.getMethod().equals("GET"))
         word = Encoding.isoToEuc(word);

     // word = Encoding.urlFormat(word);
      String queryStr = "?bcode=" + bcode + "&pg=" + pg + "&key=" + key + "&word=" + word;
      System.out.println("RC >>> " + queryStr);

      PathDto pathDto = new PathDto();
      pathDto.setContentPath("/main/main.jsp");
 

		if (!act.isEmpty() && act != null)
			pathDto.setPath("/default.jsp");
		else
			pathDto.setPath("/index.jsp");
     
  
      if("mvshowmap".equals(act)){

        pathDto.setContentPath("/map/mapShow.jsp");
        pathDto.setTitleHead("지도");
        
        request.setAttribute("pathInfo", pathDto);

         PageMove.forward(pathDto.getPath(), request, response);
      } else if("mapwrite".equals(act)){

    	 String contentpath = MapActionFactory.getMapWriteAction().execute(request, response);
    	 pathDto.setContentPath(contentpath);
         pathDto.setTitleHead("경로 정보");

         request.setAttribute("pathInfo", pathDto);
         PageMove.forward(pathDto.getPath(), request, response);
 
      } else if("view".equals(act)){
    	  System.out.println("order recieved:::view");
    	  
    	  PageMove.forward(pathDto.getPath(), request, response);
      } else if("list".equals(act)){
    	  System.out.println("order recieved:::list");
    	 String contentpath = MapActionFactory.getMapListAction().execute(request, response);
    	 pathDto.setContentPath(contentpath);
    	 pathDto.setTitleHead("경로 목록 화면");
  
    	 PageMove.forward(pathDto.getPath(), request, response);
      } else if("".equals(act)){
    	  pathDto.setContentPath("/default.jsp");
      } else if("".equals(act)){
    	  pathDto.setContentPath("/default.jsp");
      } else if("".equals(act)){
    	  pathDto.setContentPath("/default.jsp");
      }
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
	   request.setCharacterEncoding("EUC-KR");
      doGet(request, response);
   }

}