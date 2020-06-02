package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import db.ConnectionPool;

@WebServlet("/movie/comments")
public class CommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		//System.out.println(title);
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionPool.getCon();
			String sql = "select * from comments where mnum=(select mnum from movie where title=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			
			JSONArray jrr = new JSONArray();
			while(rs.next()) {
				JSONObject json = new JSONObject();
				json.put("num", rs.getInt("num"));
				json.put("id", rs.getString("id"));
				json.put("comments", rs.getString("comments"));
				
				jrr.put(json);
			}
			
			resp.setContentType("text/plain; charset=utf-8");
			PrintWriter pw = resp.getWriter();
			pw.print(jrr);
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
}
