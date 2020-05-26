package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import vo.BoardVo;

public class BoardDao {
	//가장 큰 글번호 구하는 메소드 
	public int getmaxNum() {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select NVL(max(num),0) maxnum from guestboard";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("maxnum");
			} else {
				return 0;
			}
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	public int insert(BoardVo vo) {
		Connection con =null;
		PreparedStatement pstmt1 =null;
		PreparedStatement pstmt2 =null;
		
		try {
			con =JDBCUtil.getConn();
			int boardNum =getmaxNum() + 1; //등록할 글번호 구하기
			int num =vo.getNum();
			int ref =vo.getRef();
			int lev =vo.getLev();
			int step =vo.getStep();
			
			if(num==0) { //새글인 경우
				ref =boardNum;
				
			} else { //답글인 경우
				String sql1 ="update guestboard set step =step+1 where step>? and ref=?";
				pstmt1 =con.prepareStatement(sql1);
				pstmt1.setInt(1, step);
				pstmt1.setInt(2, ref);
				pstmt1.executeUpdate();
				
				lev++;
				step++;
				
			}
			
			String sql2 ="insert into guestboard values(?, ?, ?, ?, ?, ?, ?)";
			pstmt2 =con.prepareStatement(sql2);
			pstmt2.setInt(1, boardNum);
			pstmt2.setString(2, vo.getWriter());
			pstmt2.setString(3, vo.getTitle());
			pstmt2.setString(4, vo.getContent());
			pstmt2.setInt(5, ref);
			pstmt2.setInt(6, lev);
			pstmt2.setInt(7, step);
			
			return pstmt2.executeUpdate();
			
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(pstmt1);
			JDBCUtil.close(pstmt2);
			JDBCUtil.close(con);
		}
	}
	
	public ArrayList<BoardVo> list(int startRow, int endRow){
		String sql ="select * from(\r\n" + 
				"\r\n" + 
				"select aa.*, rownum rnum from (\r\n" + 
				"    select * from guestboard order by ref desc, step asc\r\n" + 
				")aa\r\n" + 
				")\r\n" + 
				"where rnum>=? and rnum<=?";
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs =pstmt.executeQuery();
			
			ArrayList<BoardVo> list =new ArrayList<BoardVo>();
			while(rs.next()) {
				int num =rs.getInt("num");
				String writer =rs.getString("writer");
				String title =rs.getString("title");
				String content =rs.getString("content");
				int ref =rs.getInt("ref");
				int lev =rs.getInt("lev");
				int step =rs.getInt("step");
//				/int num, String writer, String title, String content, int ref, int lev, int step
				BoardVo vo =new BoardVo(num, writer, title, content, ref, lev, step);
				list.add(vo);
			}
			return list;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int getCount() { //전체글의 갯수 리턴
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select NVL(count(num),0) cnt from guestboard";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			} else {
				return 0;
			}
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public BoardVo detail(int num){
		String sql ="select * from guestboard where num=?";
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				String writer =rs.getString("writer");
				String title =rs.getString("title");
				String content =rs.getString("content");
				int ref =rs.getInt("ref");
				int lev =rs.getInt("lev");
				int step =rs.getInt("step");
//				/int num, String writer, String title, String content, int ref, int lev, int step
				BoardVo vo =new BoardVo(num, writer, title, content, ref, lev, step);
				return vo;
			}
			return null;
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
