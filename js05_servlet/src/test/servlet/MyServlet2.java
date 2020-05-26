package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet2 extends HttpServlet {
	/*
	 * init메소드
	 *  - 최초로 서블릿이 생성될때 딱 한번 호출된다.
	 */
	
	String url;
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메소드 호출...");
		//web xml에 설정된 초기화 파라미터값 읽어오기
		
		ServletContext sc =config.getServletContext();
		url =sc.getInitParameter("url");
	}
	
	/*
	 * destory 메소드
	 *  - 서블릿이 제거될때(일정시간동안 요청이없거나 웹서버가 종료될때)
	 *  호출되는 메소드
	 */
	@Override
	public void destroy() {
		System.out.println("destory 메소드 호출...");
	}
	
	/*
	 * service메소드
	 *  - 클라이언트가 요청될때마다 호출된다.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 메소드 호출");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw =resp.getWriter();
		pw.write("<h1>MyServlet2의 service메소드 호출..!</h1>");
		pw.write("url->" + url + "<br>");
		pw.close();
	}
}
