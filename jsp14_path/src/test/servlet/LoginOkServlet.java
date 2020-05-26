package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/loginOk")
public class LoginOkServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id =req.getParameter("id");
		String pwd =req.getParameter("pwd");
		HttpSession session =req.getSession();
		session.setAttribute("id", id);
		
		System.out.println("실행");
		//리다이렉트방식으로 main.jsp로 이동해보세요.
		resp.sendRedirect(req.getContextPath() + "/main.jsp");
	}
}
