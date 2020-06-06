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

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("멤버 조인 페이지 서브밋");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		HttpSession session = req.getSession();
		MyusersVO vo = new MyusersVO(id, pwd, email, null);
		MemberDAO dao = new MemberDAO();
		int r = dao.memberInsert(vo);
		MyusersVO result = dao.loginChecked(vo);
		if( r > 0 ) {
			System.out.println("회원가입 완료");
			session.setAttribute("logined", result.getId());
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
	}
}
