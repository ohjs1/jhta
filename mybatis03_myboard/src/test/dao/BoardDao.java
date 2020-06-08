package test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionFactoryService;
import vo.BoardVo;

public class BoardDao {
	private SqlSessionFactory sqlSessionFactory = null;
	private static final String NAMESPACE = "mybatis.MyBoardMapper";
	
	public int insert(BoardVo vo) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			int n = session.insert(NAMESPACE + ".insert", vo);
			session.commit();
			return n;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public List<BoardVo> getList(HashMap<String, String> map) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			List<BoardVo> list = session.selectList(NAMESPACE + ".select", map);
			session.commit();
			return list;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public List<BoardVo> getList1(HashMap<String, String> map) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			return session.selectList(NAMESPACE + ".select1", map);
		} finally {
			if(session != null) session.close();
		}
	}
	
	//번호넣어서 리스트목록가져오기
	public List<BoardVo> getList(int num) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			System.out.println("num>>" + num);
			List<BoardVo> list = session.selectList(NAMESPACE + ".selectDoGet", num);
			for(BoardVo vo : list) {
				System.out.println(vo.getContent());
			}
			
			session.commit();
			return list;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public int delete(int num) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			System.out.println("삭제완료");
			int n = session.delete(NAMESPACE + ".delete", num);
			session.commit();
			return n;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public int update(BoardVo vo) {
		sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			System.out.println("수정 완료");
			int n = session.update(NAMESPACE + ".update", vo);
			session.commit();
			return n;
		} finally {
			if(session != null) session.close();
		}
	}
}
