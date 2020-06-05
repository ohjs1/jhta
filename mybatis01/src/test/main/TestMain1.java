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
			SqlSession session = sqlSessionFactory.openSession();//select ������ selectList�޼ҵ�� ȣ��
			List<MembersVo> list = session.selectList("mybatis.MembersMapper.select");
			System.out.println("<��ü ȸ�� ���>");
			for(MembersVo vo : list) {
				System.out.println("ȸ����ȣ:" + vo.getNum());
				System.out.println("�̸�:" + vo.getName());
				System.out.println("����ȣ:" + vo.getPhone());
				System.out.println("�ּ�:" + vo.getAddr());
				System.out.println("������:" + vo.getRegdate());
				System.out.println("==========================");
			}
			
			//��ȸ�� �����Ͱ� 1�� ������ ���� (pk) selectOne �޼ҵ� ���
			MembersVo vo1 = session.selectOne("mybatis.MembersMapper.getinfo", 8);
			
			if(vo1 != null) {
				session.commit();
				
				System.out.println("<��ȸ�� ȸ������>");
				System.out.println("ȸ����ȣ:" + vo1.getNum());
				System.out.println("�̸�:" + vo1.getName());
				System.out.println("����ȣ:" + vo1.getPhone());
				System.out.println("�ּ�:" + vo1.getAddr());
				System.out.println("������:" + vo1.getRegdate());
				System.out.println("==========================");
			} else {
				System.out.println("��ȸ�� ȸ���� �����ϴ�.");
				
			}
			session.close();
		} catch(IOException i) {
			System.out.println(i.getMessage());
		}
	}
}
