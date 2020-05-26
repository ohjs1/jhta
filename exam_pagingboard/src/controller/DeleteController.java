package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyBoardDao;
import vo.MyBoardVo;

@WebServlet("/board/delete")
public class DeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd =req.getParameter("pwd");
		int num =Integer.parseInt(req.getParameter("num"));
		
		MyBoardDao dao =new MyBoardDao();
		int n =dao.delete(pwd, num);
		
		if(n>0) {
			System.out.println("���� ����!");
			resp.sendRedirect(req.getContextPath() + "/home");
		} else {
			MyBoardVo vo =dao.getList(num);
			
			req.setAttribute("err", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			req.setAttribute("vo", vo);
			
			req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
			System.out.println("���� ����!");
		}
	}
}
