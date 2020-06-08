package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.object.MemberDAO;
import value.object.MyusersVO;

@WebServlet("/member/allusers")
public class AllUsers extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		List<MyusersVO> list = dao.getAllUserList();
		req.setAttribute("userlistALL", list);
		
		
		req.setAttribute("loginPage", "/alluserList.jsp");
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
