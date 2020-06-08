package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.access.object.MemberDAO;
import value.object.MyusersVO;

@WebServlet("/search")
public class UserSearch extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("keyword");
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
//		System.out.println(keyword);
//		System.out.println(id);
//		System.out.println(email);
		
		MemberDAO dao = new MemberDAO();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", keyword);
		map.put("id", id);
		map.put("email", email);
		
		List<MyusersVO> vo = dao.searchList(map);
		HttpSession session = req.getSession(); 
		session.setAttribute("userlistALL", vo);
		req.setAttribute("loginPage", "/alluserList.jsp");
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
