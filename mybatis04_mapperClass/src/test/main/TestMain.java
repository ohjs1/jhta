package test.main;

import java.util.List;

import test.dao.MembersDao;
import test.vo.MembersVo;

public class TestMain {
	public static void main(String[] args) {
		MembersDao dao = new MembersDao();
//		MembersVo vo = new MembersVo(2, "asd2f", "000", "서울", null);
//		int n = dao.insert(vo);
//		System.out.println(n + "명의 회원 추가됨!");
		
//		List<MembersVo> list = dao.list();
//		System.out.println("<<전체 회원 리스트>>");
//		for(MembersVo vo1 : list) {
//			System.out.println("회원번호 : " + vo1.getNum());
//			System.out.println("이름 : " + vo1.getName());
//			System.out.println("전화번호 : " + vo1.getPhone());
//			System.out.println("주소 : " + vo1.getAddr());
//			System.out.println("가입일 : " + vo1.getRegdate());
//			System.out.println("-----------------------------------");
//		}
		
		//삭제, 수정, 한명회원정보 조회
		//삭제
//		int r = dao.delete(8);
//		System.out.println(r + "명의 회원 삭제!");
		
		
////		//수정
//		MembersVo vo2 = new MembersVo(1, "test", "04302", "부산", null);
//		int u = dao.update(vo2);
//		System.out.println(u + "명의 회원 정보 수정!");
		
		//한명 회원정보 조회
//		List<MembersVo> list2 = dao.list2(1);
//		System.out.println("<<회원 리스트>>");
//		for(MembersVo vo3 : list2) {
//			System.out.println("회원번호 : " + vo3.getNum());
//			System.out.println("이름 : " + vo3.getName());
//			System.out.println("전화번호 : " + vo3.getPhone());
//			System.out.println("주소 : " + vo3.getAddr());
//			System.out.println("가입일 : " + vo3.getRegdate());
//			System.out.println("-----------------------------------");
//		}
		
		
	}
}
