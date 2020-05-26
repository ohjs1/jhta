package test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * <��Ʈ�ѷ�>
 * 1. ������� ��û�� �м��ؼ� �ش� ����Ͻ������� �����ϱ� ���� �𵨰�ü ȣ��
 * 2. �𵨰�ü�� ������ ������� �������� ���
 * 3. ������� ������ ���������� �̵��ϱ�
 * 
 */
@WebServlet("/fortune.do")
public class FortuneController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.������� ��û�� ���� �𵨰�ü ȣ��
		String result ="�������ΰ��� ������ ������~~~";
		
		//2.�𵨰�ü�� ������ ������� �������� ���
		req.setAttribute("result", result);
		
		//3.������� ������ ���������� �̵��ϱ�
		RequestDispatcher rd =req.getRequestDispatcher("/showFortune.jsp");
		rd.forward(req, resp);
	}
}
