package login.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.access.object.MemberDAO;
import value.object.MyusersVO;

@WebServlet("/member/join/update")
public class MemberUpdateInfo extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		String mydate = req.getParameter("mydate");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		MemberDAO dao = new MemberDAO();
		
		try {
			Date to = transFormat.parse(mydate);
			java.sql.Date sqlDate = new java.sql.Date(to.getTime());
			MyusersVO vo = new MyusersVO(id, pwd, email, sqlDate);
			
			int n = dao.updateInfo(vo);
			
			if( n > 0 ) {
				System.out.println("회원정보 업데이트 성공!");
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			} else {
				System.out.println("회원정보 업데이트 실패...");
				//resp.sendRedirect(req.getContextPath() + "/index.jsp");
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

	}
}
