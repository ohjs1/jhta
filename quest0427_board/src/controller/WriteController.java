package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import vo.BoardVo;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer =req.getParameter("writer");
		String email =req.getParameter("email");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		
		BoardDao dao =new BoardDao();
		
		//int num, String writer, String email, String title, String content, Date w_date
		BoardVo vo =new BoardVo(0, writer, email, title, content, null);
		int n =dao.insertBoard(vo);
		
		req.setAttribute("resultWrite", n);
		req.getRequestDispatcher("/write_s.jsp").forward(req, resp);
	}
}
