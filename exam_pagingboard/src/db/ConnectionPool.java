package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
	static DataSource ds =null;
	
	static { //static 맴버를 초기화할떄는 static 블록을 사용한다.
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getCon() throws SQLException {
		Connection con =ds.getConnection();
		return con;
	}
	
	public static void close(PreparedStatement pstmt, ResultSet rs, Connection con) {
		try {
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
			if(con!=null) con.close();
		} catch(SQLException s) {
			System.out.println(s.getMessage());
		}
	}
}
