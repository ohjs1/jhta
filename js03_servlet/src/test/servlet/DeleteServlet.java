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

public class DeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con =null;
		PreparedStatement pstmt =null;
		req.setCharacterEncoding("utf-8");
		String id =req.getParameter("id");
		int n =0;
		try {
			con =JDBCUtil.getConn();
			String sql ="delete from myusers where id=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			n =pstmt.executeUpdate();
			   
			if(n>0) {
				System.out.println(n+"개의 항목 삭제!");
				resp.sendRedirect("list.do");
			} else {
				System.out.println("삭제 실패!");
			}
			
		} catch(SQLException sq) {
			sq.printStackTrace();
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
