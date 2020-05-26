package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	public static Connection getConn() throws SQLException {
		Connection con =null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			con =DriverManager.getConnection(url, "scott", "tiger");
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} 
	}
	
	public static void close(ResultSet rs, Statement psmt, Connection con) {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
		}
	}
	
	public static void close(Statement psmt) {
		try {
			if(psmt != null) psmt.close();
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
		}
	}
	
	public static void close(Connection con) {
		try {
			if(con != null) con.close();
			
		} catch(SQLException sq) {
			System.out.println(sq.getMessage());
		}
	}
}
