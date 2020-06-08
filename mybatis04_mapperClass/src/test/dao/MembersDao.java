package test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.MembersMapper;
import mybatis.SqlSessionFactoryService;
import test.vo.MembersVo;

public class MembersDao {
	private SqlSessionFactory sqlFactory = SqlSessionFactoryService.getSqlSessionFactory();
	
	public int insert(MembersVo vo) {
		SqlSession session = null;
		try {
			session = sqlFactory.openSession();
			//sql구문을 실행하기 위한 매퍼클래스 얻어오기
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int n = mapper.insert(vo);
			session.commit();
			return n;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public List<MembersVo> list(){
		SqlSession session = null;
		
		try {
			session = sqlFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			List<MembersVo> mlist = mapper.select();
			return mlist;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public List<MembersVo> list2(int num){
		SqlSession session = null;
		
		try {
			session = sqlFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			List<MembersVo> mlist = mapper.select2(num);
			return mlist;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public int delete(int num) {
		SqlSession session = null;
		try {
			session = sqlFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int result = mapper.delete(num);
			session.commit();
			
			return result;
		} finally {
			if(session != null) session.close();
		}
	}
	
	public int update(MembersVo vo) {
		SqlSession session = null;
		try {
			session = sqlFactory.openSession();
			MembersMapper mapper = session.getMapper(MembersMapper.class);
			int result = mapper.update(vo);
			session.commit();
			
			return result;
		} finally {
			if(session != null) session.close();
		}
	}
}
