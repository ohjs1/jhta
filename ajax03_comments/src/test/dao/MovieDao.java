package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPool;
import test.vo.MovieVo;

public class MovieDao {
	private static MovieDao instance =new MovieDao();
	
	private MovieDao() {}
	
	public static MovieDao getInstance() {
		return instance;
	}
	
	public MovieVo getinfo(int mnum) {
		String sql ="select * from movie where mnum =?";
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =ConnectionPool.getCon();
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, mnum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				//int mnum, String title, String content, String director
				MovieVo vo =new MovieVo(
						rs.getInt("mnum"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("director")
						);
				return vo;
			}
			return null;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			ConnectionPool.close(pstmt, rs, con);
		}
	}
}
