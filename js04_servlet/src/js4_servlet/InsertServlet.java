package js4_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insert.do")
public class InsertServlet extends HttpServlet {
	/*
	 * service�޼ҵ� -> get���/post������� ��û�� ��� ȣ���
	 * 
	 * 
	 */
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("��û���:" + req.getMethod());
//		System.out.println("service�޼ҵ� ȣ���");
//	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet �޼ҵ� ȣ���");
		resp.sendRedirect("test01.html");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost �޼ҵ� ȣ���");
		System.out.println("ȸ������ db ���� �Ϸ�!");
		resp.setCharacterEncoding("text/html;charset=utf-8");
		PrintWriter pw =resp.getWriter();
		pw.print("<h1>ȸ������ ����</h1>");
	}
}
