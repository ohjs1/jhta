package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectionPool;
import vo.MyBoardVo;

public class MyBoardDao {
	public int insert(MyBoardVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =ConnectionPool.getCon();
			String sql ="insert into myboard values(myboard_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			ConnectionPool.close(pstmt, null, con);
		}
	}
	
	public MyBoardVo getList(int num) {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =ConnectionPool.getCon();
			String sql ="select * from myboard where num = ?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			
			MyBoardVo vo =null;
			
			if(rs.next()) {
				String writer =rs.getString("writer");
				String pwd =rs.getString("pwd");
				String title =rs.getString("title");
				String content =rs.getString("content");
				Date regdate =rs.getDate("regdate");
				
				//int num, String writer, String pwd, String title, String content, Date regdate
				vo =new MyBoardVo(num, writer, pwd, title, content, regdate);
			}
			return vo;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
	
	public ArrayList<MyBoardVo> getList(int startRow, int endRow) {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
			
		try {
			con =ConnectionPool.getCon();
			String sql ="select * from (\r\n" + 
					"select aa.*, rownum rnum from (\r\n" + 
					"select * from myboard order by num desc\r\n" + 
					")aa\r\n" + 
					")\r\n" + 
					"where rnum >= ? and rnum <= ?";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs =pstmt.executeQuery();
			
			ArrayList<MyBoardVo> list =new ArrayList<MyBoardVo>();
			
			while(rs.next()) {
				int num =rs.getInt("num");
				String writer =rs.getString("writer");
				String pwd =rs.getString("pwd");
				String title =rs.getString("title");
				String content =rs.getString("content");
				Date regdate =rs.getDate("regdate");
				
				list.add(new MyBoardVo(num, writer, pwd, title, content, regdate));
			}
			return list;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
	
	public ArrayList<MyBoardVo> search(String keyword, String op){
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =ConnectionPool.getCon();
			String resultk ="%" + keyword + "%";
			String sql = "select * from book where bookname like ?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, resultk);
			
			rs =pstmt.executeQuery();
			
			ArrayList<MyBoardVo> list =new ArrayList<MyBoardVo>();
			while(rs.next()) {
				int num =rs.getInt("num");
				String writer =rs.getString("writer");
				String pwd =rs.getString("pwd");
				String title =rs.getString("title");
				String content =rs.getString("content");
				Date regdate =rs.getDate("regdate");
				
				list.add(new MyBoardVo(num, writer, pwd, title, content, regdate));
			}
			return list;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
	
	public int delete(String pwd, int num) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =ConnectionPool.getCon();
			String sql ="delete from myboard where num=? and pwd=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pwd);
			
			return pstmt.executeUpdate();
		
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			ConnectionPool.close(pstmt, null, con);
		}
	}
	
	public int getMaxCount() {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =ConnectionPool.getCon();
			String sql ="select NVL(count(num),0) cnt from myboard";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
			return 0;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return 0;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
}
