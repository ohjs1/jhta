package login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.access.object.MemberDAO;

@WebServlet("/member/del")
public class DeleteUser extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		MemberDAO dao = new MemberDAO();
		HttpSession session = req.getSession(false);
		int r = dao.delUser(id);
		
		if( r > 0 ) {
			System.out.println("È¸¿øÅ»Åð ¿Ï·á.");
			if (session != null) {
			    session.invalidate();
			}
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
		} else {
			System.out.println("È¸¿øÅ»Åð ½ÇÆÐ");
		}
	}
}
