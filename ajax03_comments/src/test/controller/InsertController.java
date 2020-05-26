package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CommentsDao;
import test.vo.CommentsVo;

@WebServlet("/insert.do")
public class InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id =req.getParameter("id");
		String comments =req.getParameter("comments");
		int mnum =Integer.parseInt(req.getParameter("mnum"));
		
		System.out.println(id + " : id");
		System.out.println(comments + " : comments");
		System.out.println(mnum + " : mnum");
		
		//int num, int mnum, String id, String comments
		CommentsVo vo =new CommentsVo(0, mnum, id, comments);
		CommentsDao dao =CommentsDao.getInstance();
		int n =dao.insert(vo);
		
		resp.setContentType("text/xml; charset=utf-8");
		PrintWriter pw =resp.getWriter();
		pw.print("<result>");
		if(n>0) {
			pw.print("<code>sucess</code>");
		} else {
			pw.print("<code>fail</code>");
		}
		pw.print("</result>");
	}
}
