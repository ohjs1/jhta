package mybatis;

import mybatis.dao.MyUsersDao;
import mybatis.vo.MyUsersVo;

/*
 * MyUsers���̺�� �����ؼ� ������ �߰�/����/����/��ȸ �غ�����.
 * Mapper�������̽� ����ϱ�
 * 
 */
public class QuizMain {

	public static void main(String[] args) {
		//������ �߰�
//		MyUsersDao dao = new MyUsersDao();
//		MyUsersVo vo = new MyUsersVo("test1", "1234a", "aaa@naver.com", null);
//		int n = dao.insert(vo);
//		System.out.println(n + "���� ȸ�� �߰���!");
		
		//������ ��ȸ
//		MyUsersDao dao = new MyUsersDao();
//		
//		List<MyUsersVo> list = dao.selectAll();
//		for(MyUsersVo vo : list) {
//			System.out.println("��üȸ�� ��ȸ");
//			System.out.println("���̵� : " + vo.getId());
//			System.out.println("��й�ȣ : " + vo.getPw());
//			System.out.println("�̸��� : " + vo.getEmail());
//			System.out.println("������ : " + vo.getMydate());
//			System.out.println("----------------------------");
//		}
		
		//1��ȸ������ ��ȸ
//		MyUsersDao dao = new MyUsersDao();
//		MyUsersVo vo = dao.selectOne("ddd");
//		System.out.println("ȸ�� ��ȸ");
//		System.out.println("���̵� : " + vo.getId());
//		System.out.println("��й�ȣ : " + vo.getPw());
//		System.out.println("�̸��� : " + vo.getEmail());
//		System.out.println("������ : " + vo.getMydate());
//		System.out.println("----------------------------");
		
		//ȸ�� ����
//		MyUsersDao dao = new MyUsersDao();
//		int n = dao.deleteOne("ddd");
//		System.out.println(n + "���� ȸ�� ����");
		
		//ȸ������ ����
		MyUsersDao dao = new MyUsersDao();
		MyUsersVo vo = new MyUsersVo("22", "1234", "123@naver.com", null);
		int n = dao.updateOne(vo);
		
		System.out.println(n + "���� ȸ������ ����");
		
	}
}
