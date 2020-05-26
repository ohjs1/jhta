package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyBoardDao;
import vo.MyBoardVo;

@WebServlet("/board/detail")
public class DetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num =Integer.parseInt(req.getParameter("num"));
		MyBoardDao dao =new MyBoardDao();
		MyBoardVo vo =dao.getList(num);
		
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
	}
}
