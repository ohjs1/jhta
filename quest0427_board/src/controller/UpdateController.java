package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import vo.BoardVo;

@WebServlet("/update.do")
public class UpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num =Integer.parseInt(req.getParameter("num"));
		BoardDao dao =new BoardDao();
		BoardVo vo =dao.getList(num);
		
		req.setAttribute("updateList", vo);
		req.getRequestDispatcher("/update.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDao dao =new BoardDao();
		int num =Integer.parseInt(req.getParameter("num"));
		String writer =req.getParameter("writer");
		String email =req.getParameter("email");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		
		BoardVo vo =new BoardVo(num, writer, email, title, content, null);
		int n =dao.insertBoard(vo);
		
		req.setAttribute("resultUpdate", n);
		req.getRequestDispatcher("/update_s.jsp").forward(req, resp);
	}
}
