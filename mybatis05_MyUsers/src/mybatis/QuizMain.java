package mybatis;

import mybatis.dao.MyUsersDao;
import mybatis.vo.MyUsersVo;

/*
 * MyUsers테이블과 연동해서 데이터 추가/수정/삭제/조회 해보세요.
 * Mapper인터페이스 사용하기
 * 
 */
public class QuizMain {

	public static void main(String[] args) {
		//데이터 추가
//		MyUsersDao dao = new MyUsersDao();
//		MyUsersVo vo = new MyUsersVo("test1", "1234a", "aaa@naver.com", null);
//		int n = dao.insert(vo);
//		System.out.println(n + "명의 회원 추가됨!");
		
		//데이터 조회
//		MyUsersDao dao = new MyUsersDao();
//		
//		List<MyUsersVo> list = dao.selectAll();
//		for(MyUsersVo vo : list) {
//			System.out.println("전체회원 조회");
//			System.out.println("아이디 : " + vo.getId());
//			System.out.println("비밀번호 : " + vo.getPw());
//			System.out.println("이메일 : " + vo.getEmail());
//			System.out.println("가입일 : " + vo.getMydate());
//			System.out.println("----------------------------");
//		}
		
		//1명회원정보 조회
//		MyUsersDao dao = new MyUsersDao();
//		MyUsersVo vo = dao.selectOne("ddd");
//		System.out.println("회원 조회");
//		System.out.println("아이디 : " + vo.getId());
//		System.out.println("비밀번호 : " + vo.getPw());
//		System.out.println("이메일 : " + vo.getEmail());
//		System.out.println("가입일 : " + vo.getMydate());
//		System.out.println("----------------------------");
		
		//회원 삭제
//		MyUsersDao dao = new MyUsersDao();
//		int n = dao.deleteOne("ddd");
//		System.out.println(n + "명의 회원 삭제");
		
		//회원정보 수정
		MyUsersDao dao = new MyUsersDao();
		MyUsersVo vo = new MyUsersVo("22", "1234", "123@naver.com", null);
		int n = dao.updateOne(vo);
		
		System.out.println(n + "명의 회원정보 수정");
		
	}
}
