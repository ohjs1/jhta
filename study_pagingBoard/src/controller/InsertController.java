package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import vo.BoardVo;

@WebServlet("/board/insert")
public class InsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/board/insert.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String writer =req.getParameter("writer");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		String snum =req.getParameter("num");
		int num =0;
		int ref =0;
		int lev =0;
		int step =0;
		
		if(snum!=null && !snum.equals("")) {
			num =Integer.parseInt(snum);
			ref =Integer.parseInt(req.getParameter("ref"));
			lev =Integer.parseInt(req.getParameter("lev"));
			step =Integer.parseInt(req.getParameter("step"));
		}
		
		BoardVo vo =new BoardVo(num, writer, title, content, ref, lev, step);
		BoardDao dao =new BoardDao();
		int rs =dao.insert(vo);
		
		if(rs>0) {
			System.out.println("글 작성 성공!");
		} else {
			System.out.println("글 작성 실패!");
		}
	}
}
