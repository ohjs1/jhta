package login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.access.object.MemberDAO;
import value.object.MyusersVO;

@WebServlet("/member/myinfo")
public class MyInfo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("logined");
		
		if( id != null ) {
			MemberDAO dao = new MemberDAO();
			MyusersVO vo = dao.myInfo(id);
			//System.out.println(vo.getEmail() + " : ¿Ã∏ﬁ¿œ");
			req.setAttribute("myinfo", vo);
			req.setAttribute("loginPage", "/myinfo.jsp");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} else {
			req.setAttribute("loginPage", "/login.jsp");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			resp.sendRedirect(req.getContextPath() + "/index.jsp");
		}
	}
}
