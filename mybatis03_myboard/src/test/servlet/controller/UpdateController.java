package test.servlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.BoardDao;
import vo.BoardVo;

@WebServlet("/update")
public class UpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		
		BoardDao dao = new BoardDao();
		List<BoardVo> list = dao.getList(num);
		req.setAttribute("uplist", list);
		
		req.getRequestDispatcher("/update.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		String writer = req.getParameter("writer");
		String pwd = req.getParameter("pwd");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo(num, writer, pwd, title, content, null);
		
		dao.update(vo);
		req.getRequestDispatcher("/main.jsp").forward(req, resp);
	}
}
