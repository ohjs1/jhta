package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import db.JDBCUtil;

/*
 * [ �̱��� ���� ]
 * -��ü�� �ϳ��� �����ؼ� �����ؼ� ����ϴ� ���
 * -����� ���
 * 1. �ڱ��ڽ��� ��ü�� static�ɹ��� �����Ѵ�.
 * 2. ��ü�� �����ϴ� �޼ҵ带 �����Ѵ�.
 * 3. �����ڸ� private�� �����.
 * 
 */
public class LoginDao {
	private static LoginDao dao =new LoginDao();
	private LoginDao() {} // �����ڸ� private�� �����
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
				return 1; //ȸ���ϰ�� 1����
			} 
			return 2; //ȸ���� �ƴҰ�� 2����
			
		} catch(SQLException s) {
			System.out.println(s.getMessage());
			return -1; //�����߻��� -1����
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
