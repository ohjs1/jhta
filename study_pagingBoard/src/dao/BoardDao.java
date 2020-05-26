package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import test.db.ConnectionPool;
import vo.BoardVo;

public class BoardDao {
	private int getMaxNum() {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {
			con =ConnectionPool.getCon();
			String sql ="select max(num) mnum from guestboard";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("mnum:" + rs.getInt("mnum"));
				return rs.getInt("mnum");
			}
			return -1;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			ConnectionPool.close(pstmt, rs);
		}
	}
	 
	public int insert(BoardVo vo) {
		Connection con =null;
		PreparedStatement pstmt1 =null;
		PreparedStatement pstmt2 =null;
		
		try {
			con =ConnectionPool.getCon();
			int boardNum =getMaxNum() + 1; //최고높은 글번호에 1을 더해줌
			int num =vo.getNum();
			String writer =vo.getWriter();
			String title =vo.getTitle();
			String content =vo.getContent();
			int ref =vo.getRef();
			int lev =vo.getLev();
			int step =vo.getStep();
			
			if(num==0) { //초기셋팅값이 0이므로 새글인경우 
				ref =boardNum;
			} else {
				String sql1 ="update guestboard set step =step+1 where step>? and ref=?";
				//원글 데이터 step과 ref를 구하여 step값을 1증가시킨다.
				pstmt1 =con.prepareStatement(sql1);
				pstmt1.setInt(1, step);
				pstmt1.setInt(2, ref);
				pstmt1.executeUpdate();
				
				lev++;
				step++;
			}
			 
			String sql ="insert into guestboard values(?, ?, ?, ?, ?, ?, ?)";
			pstmt2 =con.prepareStatement(sql);
			pstmt2.setInt(1, boardNum);
			pstmt2.setString(2, writer);
			pstmt2.setString(3, title);
			pstmt2.setString(4, content);
			pstmt2.setInt(5, ref);
			pstmt2.setInt(6, lev);
			pstmt2.setInt(7, step);
			
			return pstmt2.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		}
	}
}
