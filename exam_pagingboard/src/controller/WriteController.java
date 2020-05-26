package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyBoardDao;
import vo.MyBoardVo;

@WebServlet("/board/write")
public class WriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/board/write.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer =req.getParameter("writer");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		String pwd =req.getParameter("pwd");
		
		//int num, String writer, String pwd, String title, String content, Date regdate
		MyBoardVo vo =new MyBoardVo(0, writer, pwd, title, content, null);
		int n =new MyBoardDao().insert(vo);
		
		if(n>0) {
			System.out.println("글작성 성공!");
			resp.sendRedirect(req.getContextPath() + "/home");
		} else {
			System.out.println("글작성 실패!");
		}
	}
}
 