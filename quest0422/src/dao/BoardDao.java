package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.BoardVo;

public class BoardDao {
	public int insertBoard(BoardVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="insert into board values(board_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	public ArrayList<BoardVo> getList(){
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		ArrayList<BoardVo> list =new ArrayList<BoardVo>();
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from board order by num desc";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
//			int num, String writer, String email, String title, String content, Date w_date
			while(rs.next()) {
				list.add(new BoardVo(rs.getInt("num"), rs.getString("writer"),
						rs.getString("email"), rs.getString("title"), rs.getString("content"), rs.getDate("w_date")));
			}
			return list;
			
		} catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
			
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public BoardVo getList(int num){
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		 
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from board where num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
//			int num, String writer, String email, String title, String content, Date w_date
			if(rs.next()) {
				BoardVo vo =new BoardVo(rs.getInt("num"), rs.getString("writer"), rs.getString("email"),
						rs.getString("title"), rs.getString("content"), rs.getDate("w_date"));
				return vo;
			}
			return null;
			
		} catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return null;
			
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public BoardVo update(int num) {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from board where num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				//int num, String writer, String email, String title, String content, Date w_date
				String writer =rs.getString("writer");
				String email =rs.getString("email");
				String title =rs.getString("title");
				String content =rs.getString("content");
				Date w_date =rs.getDate("w_date");
				
				BoardVo vo =new BoardVo(num, writer, email, title, content, w_date);
				
				return vo;
			}
			return null;
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int update(int num, String writer, String email, String title, String content) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="update board set writer=?, email=?, title=?, content=? where num=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, email);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setInt(5, num);
			
			return pstmt.executeUpdate();
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	public int delete(int num) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="delete from board where num=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return -1;
		}
	}
	
	public ArrayList<BoardVo> search(String keyword) {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		ArrayList<BoardVo> list =new ArrayList<BoardVo>();
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from board where title like '%' || ? || '%'";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardVo(rs.getInt("num"), rs.getString("writer"),
						rs.getString("email"), rs.getString("title"), rs.getString("content"), rs.getDate("w_date")));
			}
			return list;
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
