package ajax_basic;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import com.sun.beans.editors.IntegerEditor;

@WebServlet("/bl")
public class BookList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<Integer, BookDto> map;
	
	public void init() {
		map = new HashMap<Integer, BookDto>();
		BookDto b1 = new BookDto();
		b1.setTitle("�ڹ� 7 �ǹ� ���̺�");
		b1.setPrice(38700);
		
		BookDto b2 = new BookDto();
		b2.setTitle("�������� ǥ�� �����ӿ�ũ�� ��� �ٽ� ��� : ������ 3.1 + ���̹�Ƽ�� ");
		b2.setPrice(88200);
		
		BookDto b3 = new BookDto();
		b3.setTitle("�������� ���� JSP �� ���α׷��� with HTML CSS XML JavaScript ");
		b3.setPrice(28800);
		
		BookDto b4 = new BookDto();
		b4.setTitle("�ȵ���̵� ���α׷���");
		b4.setPrice(24300);
		
		map.put(new Integer(1), b1);
		map.put(new Integer(2), b2);
		map.put(new Integer(3), b3);
		map.put(new Integer(4), b4);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn");
		System.out.println(isbn);
		BookDto bookDto = map.get(new Integer(isbn));
		request.setAttribute("book", bookDto);
		RequestDispatcher disp = request.getRequestDispatcher("/bookdata.jsp");
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
