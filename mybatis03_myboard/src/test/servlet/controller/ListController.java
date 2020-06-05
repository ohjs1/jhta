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

@WebServlet("/list")
public class ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		BoardDao dao = new BoardDao();
		List<BoardVo> list = dao.getList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/list.jsp").forward(req, resp);
	}
}
