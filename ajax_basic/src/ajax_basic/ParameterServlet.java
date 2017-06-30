package ajax_basic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ps")
public class ParameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET방식 호출~~~~~~~~~~~~~~~~~~~");
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "UTF-8");
//		System.out.println("name :::: " + name);
		
		response.setContentType("text/plain;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		out.println("당신이 입력한 이름은 <font color='gray'>" + name + "</font>입니다.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
