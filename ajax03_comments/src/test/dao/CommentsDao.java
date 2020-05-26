package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.ConnectionPool;
import test.vo.CommentsVo;

public class CommentsDao {
	private static CommentsDao instance =new CommentsDao();
	private CommentsDao() {}
	
	public static CommentsDao getInstance() {
		return instance;
	}
	
	public int insert(CommentsVo vo) {
		String sql ="insert into comments values(comments_seq.nextval, ?, ?, ?)";
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =ConnectionPool.getCon();
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, vo.getMnum());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getComments());
			
			
			return pstmt.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			ConnectionPool.close(pstmt, null, con);
		}
	}
	
	public int delete(int num) {
		String sql ="delete from comments where num =?";
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =ConnectionPool.getCon();
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			return pstmt.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			ConnectionPool.close(pstmt, null, con);
		}
	}
	
	public ArrayList<CommentsVo> listAll(int mnum){
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =ConnectionPool.getCon();
			String sql ="select * from comments where mnum =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs =pstmt.executeQuery();
			
			ArrayList<CommentsVo> list =new  ArrayList<CommentsVo>();
			
			while(rs.next()) {
				//int num, int mnum, String id, String comments
				CommentsVo vo =new CommentsVo(
						rs.getInt("num"),
						rs.getInt("mnum"),
						rs.getString("id"),
						rs.getString("comments"));
				
				list.add(vo);
			}
			return list;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
}
