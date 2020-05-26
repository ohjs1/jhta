package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.JDBCUtil;
import test.vo.FileinfoVo;

public class FileinfoDao {
	public int insert(FileinfoVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="insert into fileinfo values(fileinfo_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getOrgfilename());
			pstmt.setString(5, vo.getSavafilename());
			pstmt.setLong(6, vo.getFilesize());
			
			return pstmt.executeUpdate();
		} catch(SQLException sql) {
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	public ArrayList<FileinfoVo> getList(){
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		ArrayList<FileinfoVo> list =new ArrayList<FileinfoVo>();
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from fileinfo";
			pstmt =con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				int filenum =rs.getInt("filenum");
				String writer =rs.getString("writer");
				String title =rs.getString("title"); 
				String orgfilename =rs.getString("orgfilename");
				String savefilename =rs.getString("savefilename");
				long filesize =rs.getLong("filesize");
				
				//int filenum, String writer, String title, String content, String orgfilename, String savafilename,
				//long filesize
				
				list.add(new FileinfoVo(filenum, writer, title, null, orgfilename, savefilename, filesize));
			}
			return list;
			
		} catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public FileinfoVo getList(int filenum){ //하나가져오기
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from fileinfo where filenum =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, filenum);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				String writer =rs.getString("writer");
				String title =rs.getString("title");
				String content =rs.getString("content");
				String orgfilename =rs.getString("orgfilename");
				String savefilename =rs.getString("savefilename");
				long filesize =rs.getLong("filesize");
				
				//int filenum, String writer, String title, String content, String orgfilename, String savafilename,
				//long filesize
				FileinfoVo vo =new FileinfoVo(filenum, writer, title, content, orgfilename, savefilename, filesize);
				
				return vo;
			}
			return null;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int delete(int filenum) {
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="delete from fileinfo where filenum =?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, filenum);
			
			return pstmt.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int update(FileinfoVo vo) {
		Connection con =null;
		PreparedStatement pstmt =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="update fileinfo set writer=?, title=?, content=?, orgfilename=?,"
					+ " savefilename=?, filesize=? where filenum=?";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getOrgfilename());
			pstmt.setString(5, vo.getSavafilename());
			pstmt.setLong(6, vo.getFilesize());
			pstmt.setInt(7, vo.getFilenum());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1;
		} finally {
			JDBCUtil.close(null, pstmt, con);
		} 
	}
}
