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

@WebServlet("/window/login")
public class LoginPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("로그인 페이지");
		String memberPageChk = req.getParameter("member");
		
		if( memberPageChk == null ) {
			memberPageChk = "";
		}
		
		if( memberPageChk.equals("true") ) {
			req.setAttribute("loginPage", "/memberJoin.jsp");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
		
		req.setAttribute("loginPage", "/login.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		MyusersVO vo = new MyusersVO(id, pwd, null, null);
		MemberDAO dao = new MemberDAO();
		MyusersVO result = dao.loginChecked(vo);
		
		HttpSession session = req.getSession();
		
		if( !result.getId().equals("") ) {
			System.out.println("로그인 성공!");
			session.setAttribute("logined", result.getId());
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} else {
			System.out.println("로그인 실패..");
		}
	}
}
