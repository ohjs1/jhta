package test.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.JDBCUtil;

public class InsertServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id =req.getParameter("id");
		String pwd =req.getParameter("pwd");
		String email =req.getParameter("email");
		
		Connection con =null;
		PreparedStatement pstmt =null;
		
		int n =0;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="insert into myusers values(?, ?, ?, sysdate)";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, email);
			
			n =pstmt.executeUpdate();
			
			if(n>0) {
				System.out.println(n + "개의 행 삽입");
				resp.sendRedirect("list.do");
			} else {
				System.out.println("isert 삽입 실패!");
			}
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
