package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.JDBCUtil;

public class ListServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		String id ="";
		String pw ="";
		String email ="";
		Date mydate =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from myusers";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter pwr =resp.getWriter();
			
			pwr.print("<html>");
			pwr.print("<head></head>"); 
			pwr.print("<body>");
			pwr.print("<h1>회원정보</h1>");
			  
			while(rs.next()) {
				id =rs.getString("id");
				pw =rs.getString("pw");
				email =rs.getString("email");
				mydate =rs.getDate("mydate");
				
				pwr.print("<p>id:" + id + "<br>");
				pwr.print("pw:" + pw + "<br>");
				pwr.print("email:" + email + "<br>");
				pwr.print("가입일:" + mydate + "</p><br>");
				
				
				pwr.print("<a href='update.do?id="+id+"'>수정</a>");
				pwr.print("<a href='delete.do?id="+id+"'>삭제</a>");
			}
			  
			pwr.print("</body>");
			pwr.print("</html>");
			pwr.close();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		}
	}
}
