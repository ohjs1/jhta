package mybatis;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import test.dao.MovieDao;

public class TestMain {

	public static void main(String[] args) {
		MovieDao dao = MovieDao.getInstance();
		
		List< HashMap<String, Object> > list = dao.list();
		System.out.println("<<´ñ±Û ¿µÈ­ º¸±â>>");
		for(HashMap<String, Object> map : list) {
			BigDecimal mnum = (BigDecimal)map.get("MNUM");
			String title = (String)map.get("TITLE");
			String director = (String)map.get("DIRECTOR");
			BigDecimal num = (BigDecimal)map.get("NUM");
			String id = (String)map.get("ID");
			String comments = (String)map.get("COMMENTS");
			
			System.out.println("¿µÈ­¹øÈ£:" + mnum);
			System.out.println("Á¦¸ñ:" + title);
			System.out.println("°¨µ¶:" + director);
			System.out.println("´ñ±Û¹øÈ£:" + num);
			System.out.println("´ñ±ÛÀÛ¼ºÀÚ:" + id);
			System.out.println("´ñ±Û ³»¿ë:" + comments);
			System.out.println("---------------------------------");
		}
	}
}
