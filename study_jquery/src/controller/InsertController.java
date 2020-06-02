package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ConnectionPool;

@WebServlet("/comment/insert")
public class InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("testinsert");
		
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		int mnum = Integer.parseInt(req.getParameter("mnum"));
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getCon();
			String sql = "insert into comments values(comments_seq.nextval, ?, ?, ?)";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, mnum);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
			System.out.println("인설트 완료!");
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		} finally {
			ConnectionPool.close(pstmt, null, con);
		}
	}
	
}
