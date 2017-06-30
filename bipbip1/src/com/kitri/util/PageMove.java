package com.kitri.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageMove {
	// �������̵���� �ΰ��� 1. �����̷�Ʈ 2. ������
	public static void redirect(String url, HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.sendRedirect(request.getContextPath()+url);
	}
	public static void forward(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcher=request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
