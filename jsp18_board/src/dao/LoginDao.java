package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import db.JDBCUtil;

/*
 * [ 싱글톤 패턴 ]
 * -객체를 하나만 생성해서 공유해서 사용하는 기법
 * -만드는 방법
 * 1. 자기자신의 객체를 static맴버로 생성한다.
 * 2. 객체를 리턴하는 메소드를 제공한다.
 * 3. 생성자를 private로 만든다.
 * 
 */
public class LoginDao {
	private static LoginDao dao =new LoginDao();
	private LoginDao() {} // 생성자를 private로 만들기
	public static LoginDao getDao() {
		return dao;
	}
	
	public int isMember(HashMap<String, String> map) {
		String id =map.get("id");
		String pwd =map.get("pwd");
		
		Connection con =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			con =JDBCUtil.getConn();
			String sql ="select * from myusers where id=? and pw=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				return 1; //회원일경우 1리턴
			} 
			return 2; //회원이 아닐경우 2리턴
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1; //오류발생시 -1리턴
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
