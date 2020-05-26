package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.JDBCUtil;

@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id =req.getParameter("id");
		req.setCharacterEncoding("utf-8");
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from myusers where id=?";
			pstmt =con.prepareStatement(sql);
			resp.setContentType("text/html;charset=utf-8");
			
			pstmt.setString(1, id);
			
			rs =pstmt.executeQuery();
			PrintWriter pwr =resp.getWriter();
			  
			while(rs.next()) {
				String pw =rs.getString("pw");
				String email =rs.getString("email");
				Date mydate =rs.getDate("mydate");
				pwr.print("<form method='post' action='update.do'>");
				pwr.print("<p>���̵� <input type='text' name='id' value='" + id + "'></p>");
				pwr.print("<p>��й�ȣ <input type='text' name='pw' value='" + pw + "'></p>");
				pwr.print("<p>�̸��� <input type='text' name='email' value='" + email + "'></p>");
				pwr.print("<p>������ <input type='text' name='mydate' value='" + mydate + "'></p>");
				pwr.print("<p><input type='submit' value='����'></p>");
				pwr.print("</form>");
			}
			
			pwr.close();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	  
	@Override 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Connection con =null;
		PreparedStatement pstmt =null;
		req.setCharacterEncoding("utf-8");
		
		String id =req.getParameter("id");
		String pw =req.getParameter("pw");
		String email =req.getParameter("email");
		int n =0;
		try {
			con =JDBCUtil.getConn();
			String sql ="update myusers set pw=?, email=? where id=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			System.out.println(id);
			System.out.println(pw);
			System.out.println(email);
			  
			n =pstmt.executeUpdate();
			
			if(n>0) {
				System.out.println("��������");
				resp.sendRedirect("list.do");
			} else {
				System.out.println("��������");
			}
			
		} catch(SQLException s) {
			s.printStackTrace();
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}  
