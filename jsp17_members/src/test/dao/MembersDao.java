package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import test.vo.MembersVo;

public class MembersDao {
	public int insert(MembersVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="insert into members values(?, ?, ?, ?, sysdate)";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddr());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException sql) {
			System.out.println(sql.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	public ArrayList<MembersVo> getList(){
		ArrayList<MembersVo> list =new ArrayList<MembersVo>();
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from members";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			//int num, String name, String phone, String addr, Date regdate
			while(rs.next()) {
				int num =rs.getInt("num");
				String name =rs.getString("name");
				String phone =rs.getString("phone");
				String addr =rs.getString("addr");
				Date regdate =rs.getDate("regdate");
				
				list.add(new MembersVo(num, name, phone, addr, regdate));
			}
			return list;
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public MembersVo getList(int num){
		MembersVo vo =new MembersVo();
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from members where num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			//int num, String name, String phone, String addr, Date regdate
			if(rs.next()) {
				vo =new MembersVo(num, rs.getString("name"), rs.getString("phone"),
						rs.getString("addr"), rs.getDate("regdate"));
			}
			return vo;
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int delete(int num) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="delete from members where num =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			return pstmt.executeUpdate(); 
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	
	public int update(int num, String name, String phone, String addr) {
		Connection con =null;
		PreparedStatement pstmt1 =null;
		PreparedStatement pstmt2 =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from members where num =?";
			pstmt1 =con.prepareStatement(sql);
			pstmt1.setInt(1, num);
			rs =pstmt1.executeQuery();
			
			if(rs.next()) {		
				String sql2 ="update members set name=?, phone=?, addr=? where num=?";
				pstmt2 =con.prepareStatement(sql2);
				
				pstmt2.setString(1, name);
				pstmt2.setString(2, phone);
				pstmt2.setString(3, addr);
				pstmt2.setInt(4, num);
				
				return pstmt2.executeUpdate();
			}
			return -1;
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(pstmt1);
			JDBCUtil.close(pstmt2);
			JDBCUtil.close(rs);
			JDBCUtil.close(con);
		}
	}
}
