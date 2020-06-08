package test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionFactoryService;

public class MovieDao {
	private static MovieDao moviedao;
	
	private MovieDao() {
		
	}
	
	static {
		moviedao = new MovieDao();
	}
	
	public static MovieDao getInstance() {
		return moviedao;
	}
	
	private SqlSessionFactory sessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	public List< HashMap<String, Object> > list() {
		SqlSession sqlSession = null;
		
		try {
			sqlSession = sessionFactory.openSession();
			List< HashMap<String, Object> > mlist = sqlSession.selectList("mybatis.MovieMapper.movieComments");
			
			return mlist;
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
	}
}
