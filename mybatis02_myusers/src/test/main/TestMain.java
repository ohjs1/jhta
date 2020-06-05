package test.main;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import test.vo.MyUsersVo;

public class TestMain {

	public static void main(String[] args) {
		//myusers테이블과 연동해서
		//데이터를 추가, 수정, 삭제, 아이디로 조회, 전체회원 조회기능 구현하기
		try {
			String resource = "mybatis/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			
			//데이터 추가
			//String id, String pw, String email, Date mydate
//			MyUsersVo vo = new MyUsersVo("1234", "aaa1", "123@naver.com", null);
//			int n = session.insert("mybatis.MyUsersMapper.insert", vo);
//			session.commit();
			
			//데이터 수정
//			MyUsersVo vo = new MyUsersVo("77", "test", "test@naver.com", null);
//			session.update("mybatis.MyUsersMapper.update", vo);
//			session.commit();
//			session.close();
			
			//데이터 삭제
//			session.delete("mybatis.MyUsersMapper.delete", "77");
//			session.commit();
//			session.close();
			
			//아이디로 조회
//			List<MyUsersVo> list = session.selectList("mybatis.MyUsersMapper.select", "22");
//			
//			for( MyUsersVo vo : list ) {
//				System.out.println("아이디:" + vo.getId());
//				System.out.println("비밀번호:" + vo.getPw());
//				System.out.println("이메일:" + vo.getEmail());
//			}
			
			//전체회원 조회
			List<MyUsersVo> list = session.selectList("mybatis.MyUsersMapper.selectAll");
			for( MyUsersVo vo : list ) {
				System.out.println("아이디:" + vo.getId());
				System.out.println("비밀번호:" + vo.getPw());
				System.out.println("이메일:" + vo.getEmail());
				System.out.println("=============================");
			}
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
	}
}
