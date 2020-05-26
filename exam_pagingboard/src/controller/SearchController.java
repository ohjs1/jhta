package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyBoardDao;
import vo.MyBoardVo;

@WebServlet("/board/search")
public class SearchController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pageNum =Integer.parseInt(req.getParameter("pageNum"));
		String op =req.getParameter("op");
		String keyword =req.getParameter("keyword");
		
		System.out.println(op);
		
		MyBoardDao dao =new MyBoardDao();
		ArrayList<MyBoardVo> list =dao.search(keyword, op);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/board/list.jsp").forward(req, resp);
	}
}
