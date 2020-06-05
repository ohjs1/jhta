package test.main;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import test.vo.MembersVo;

public class TestMain {
	public static void main(String[] args) {
		String resource = "mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			SqlSession session = sqlSessionFactory.openSession();
			
//			MembersVo vo = new MembersVo(3,"ȫ�浿","010","����",null);
//			if( 0 < session.insert("insert", vo) ) {
//				session.commit();
//				System.out.println("ȸ���߰� ����");
//				session.close();
//			};			
			
//			if( 0 < session.delete("delete", 3) ) {
//				session.commit();
//				System.out.println("1�� ȸ�� ���� ����");
//				session.close();
//			}
			MembersVo vo = new MembersVo(77, null, "12342", "asd2f", null);
			session.update("mybatis.MembersMapper.update", vo);
			session.commit();
			session.close();
			
		} catch(IOException i) {
			System.out.println(i.getMessage());
		}
		
	}
}
