package mybatis;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import test.dao.MovieDao;

public class TestMain {

	public static void main(String[] args) {
		MovieDao dao = MovieDao.getInstance();
		
		List< HashMap<String, Object> > list = dao.list();
		System.out.println("<<��� ��ȭ ����>>");
		for(HashMap<String, Object> map : list) {
			BigDecimal mnum = (BigDecimal)map.get("MNUM");
			String title = (String)map.get("TITLE");
			String director = (String)map.get("DIRECTOR");
			BigDecimal num = (BigDecimal)map.get("NUM");
			String id = (String)map.get("ID");
			String comments = (String)map.get("COMMENTS");
			
			System.out.println("��ȭ��ȣ:" + mnum);
			System.out.println("����:" + title);
			System.out.println("����:" + director);
			System.out.println("��۹�ȣ:" + num);
			System.out.println("����ۼ���:" + id);
			System.out.println("��� ����:" + comments);
			System.out.println("---------------------------------");
		}
	}
}
