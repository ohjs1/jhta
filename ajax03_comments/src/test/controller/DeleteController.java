package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.CommentsDao;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num =Integer.parseInt(req.getParameter("num"));
		CommentsDao dao =CommentsDao.getInstance();
		int n =dao.delete(num);
		
		PrintWriter pw =resp.getWriter();
		pw.print("<result>");
		if(n>0) {
			System.out.println("삭제 성공!");
			pw.print("<code>sucess</code>");
		} else {
			System.out.println("삭제 실패!");
			pw.print("<code>fail</code>");
		}
		pw.print("</result>");
	}
}
