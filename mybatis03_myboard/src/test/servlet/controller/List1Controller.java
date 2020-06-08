package test.servlet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.BoardDao;
import vo.BoardVo;

@WebServlet("/list1")
public class List1Controller extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String keyword = req.getParameter("keyword");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("writer", writer);
		map.put("title", title);
		map.put("content", content);
		map.put("keyword", keyword);
		
		BoardDao dao = new BoardDao();
		List<BoardVo> list = dao.getList1(map);
		req.setAttribute("list", list);
		req.getRequestDispatcher("list1.jsp").forward(req, resp);
	}
}
