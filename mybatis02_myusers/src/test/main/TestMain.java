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
		//myusers���̺�� �����ؼ�
		//�����͸� �߰�, ����, ����, ���̵�� ��ȸ, ��üȸ�� ��ȸ��� �����ϱ�
		try {
			String resource = "mybatis/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			
			//������ �߰�
			//String id, String pw, String email, Date mydate
//			MyUsersVo vo = new MyUsersVo("1234", "aaa1", "123@naver.com", null);
//			int n = session.insert("mybatis.MyUsersMapper.insert", vo);
//			session.commit();
			
			//������ ����
//			MyUsersVo vo = new MyUsersVo("77", "test", "test@naver.com", null);
//			session.update("mybatis.MyUsersMapper.update", vo);
//			session.commit();
//			session.close();
			
			//������ ����
//			session.delete("mybatis.MyUsersMapper.delete", "77");
//			session.commit();
//			session.close();
			
			//���̵�� ��ȸ
//			List<MyUsersVo> list = session.selectList("mybatis.MyUsersMapper.select", "22");
//			
//			for( MyUsersVo vo : list ) {
//				System.out.println("���̵�:" + vo.getId());
//				System.out.println("��й�ȣ:" + vo.getPw());
//				System.out.println("�̸���:" + vo.getEmail());
//			}
			
			//��üȸ�� ��ȸ
			List<MyUsersVo> list = session.selectList("mybatis.MyUsersMapper.selectAll");
			for( MyUsersVo vo : list ) {
				System.out.println("���̵�:" + vo.getId());
				System.out.println("��й�ȣ:" + vo.getPw());
				System.out.println("�̸���:" + vo.getEmail());
				System.out.println("=============================");
			}
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		
	}
}
