package test.main;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import test.vo.MembersVo;

public class TestMain1 {

	public static void main(String[] args) {
		String resource = "mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();//select 구문은 selectList메소드로 호출
			List<MembersVo> list = session.selectList("mybatis.MembersMapper.select");
			System.out.println("<전체 회원 목록>");
			for(MembersVo vo : list) {
				System.out.println("회원번호:" + vo.getNum());
				System.out.println("이름:" + vo.getName());
				System.out.println("폰번호:" + vo.getPhone());
				System.out.println("주소:" + vo.getAddr());
				System.out.println("가입일:" + vo.getRegdate());
				System.out.println("==========================");
			}
			
			//조회된 데이터가 1개 이하인 경우는 (pk) selectOne 메소드 사용
			MembersVo vo1 = session.selectOne("mybatis.MembersMapper.getinfo", 8);
			
			if(vo1 != null) {
				session.commit();
				
				System.out.println("<조회된 회원정보>");
				System.out.println("회원번호:" + vo1.getNum());
				System.out.println("이름:" + vo1.getName());
				System.out.println("폰번호:" + vo1.getPhone());
				System.out.println("주소:" + vo1.getAddr());
				System.out.println("가입일:" + vo1.getRegdate());
				System.out.println("==========================");
			} else {
				System.out.println("조회된 회원이 없습니다.");
				
			}
			session.close();
		} catch(IOException i) {
			System.out.println(i.getMessage());
		}
	}
}
