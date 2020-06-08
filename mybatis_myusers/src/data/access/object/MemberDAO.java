package data.access.object;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionFactoryService;
import value.object.MyusersVO;

public class MemberDAO {
	public int memberInsert(MyusersVO vo) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int n = session.insert("mybatis.MyUsersMapper.insert", vo);
			session.commit();
			return n;
		} finally {
			if( session != null ) session.close();
		}
	}
	
	public MyusersVO loginChecked(MyusersVO vo) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			MyusersVO rvo = session.selectOne("mybatis.MyUsersMapper.select", vo);
			session.commit();
			return rvo;
		} finally {
			if( session != null ) session.close();
		}
	}
	
	public MyusersVO myInfo(String id) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			MyusersVO rvo = session.selectOne("mybatis.MyUsersMapper.myinfo", id);
			session.commit();
			return rvo;
		} finally {
			if( session != null ) session.close();
		}
	}
	
	public int updateInfo(MyusersVO vo) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			int n = session.update("mybatis.MyUsersMapper.update", vo);
			session.commit();
			return n;
		} finally {
			if( session != null ) session.close();
		}
	}
	
	public int delUser(String id) {
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			int n = session.delete("mybatis.MyUsersMapper.delete", id);
			session.commit();
			return n;
		} finally {
			if( session != null ) session.close();
		}
	}
	
	public List<MyusersVO> getAllUserList(){
		SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			
			List<MyusersVO> list = session.selectList("mybatis.MyUsersMapper.selectAll");
			return list;
			
		} finally {
			if(session !=null) session.close();
		}
	}
}
