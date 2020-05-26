package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num =Integer.parseInt(req.getParameter("num"));
		BoardDao dao =new BoardDao();
		int r =dao.delete(num);
		req.setAttribute("resultDelete", r);
		req.getRequestDispatcher("/delete.jsp").forward(req, resp);
	}
}
