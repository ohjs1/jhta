package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.MembersMapper;
import mybatis.SqlSessionFactoryService;
import mybatis.vo.MyUsersVo;

public class MyUsersDao {
	private SqlSessionFactory sqlSessionFactory = SqlSessionFactoryService.getSqlSessionFactory();
	
	public int insert(MyUsersVo vo) {
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int n = mapper.insert(vo);
			session.commit();
			return n;
		} finally {
			if( session != null) session.close();
		}
	}
	
	public List<MyUsersVo> selectAll(){
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			List<MyUsersVo> list = mapper.selectAll();
			return list;
		} finally {
			if( session != null) session.close();
		}
	}
	
	public MyUsersVo selectOne(String id){
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			MyUsersVo list = mapper.selectOne(id);
			return list;
		} finally {
			if( session != null) session.close();
		}
	}
	
	public int deleteOne(String id){
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int result = mapper.deleteOne(id);
			session.commit();
			return result;
		} finally {
			if( session != null) session.close();
		}
	}
	
	public int updateOne(MyUsersVo vo){
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int result = mapper.updateOne(vo);
			session.commit();
			return result;
		} finally {
			if( session != null) session.close();
		}
	}
}
