package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MembersDao;

@WebServlet("/members/update.do")
public class UpdateController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num =Integer.parseInt(req.getParameter("num"));
		String name =req.getParameter("name");
		String phone =req.getParameter("phone");
		String addr =req.getParameter("addr");
		
		try {
			MembersDao dao =new MembersDao();
			int n =dao.update(num, name, phone, addr);
			if(n>0) {
				req.setAttribute("updateResult", n);
				req.getRequestDispatcher("/members/list.do").forward(req, resp);
			} else {
				req.setAttribute("errMsg", "회원수정 실패!");
				req.getRequestDispatcher("error.jsp").forward(req, resp);
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
