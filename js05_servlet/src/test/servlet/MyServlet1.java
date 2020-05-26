package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet1 extends HttpServlet {
	/*
	 * init�޼ҵ�
	 *  - ���ʷ� �������� �����ɶ� �� �ѹ� ȣ��ȴ�.
	 */
	String user;
	String pwd;
	String url;
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init �޼ҵ� ȣ��...");
		user =config.getInitParameter("user");
		pwd =config.getInitParameter("password");
		//web xml�� ������ �ʱ�ȭ �Ķ���Ͱ� �о����
		
		ServletContext sc =config.getServletContext();
		url =sc.getInitParameter("url");
	}
	
	/*
	 * destory �޼ҵ�
	 *  - �������� ���ŵɶ�(�����ð����� ��û�̾��ų� �������� ����ɶ�)
	 *  ȣ��Ǵ� �޼ҵ�
	 */
	@Override
	public void destroy() {
		System.out.println("destory �޼ҵ� ȣ��...");
	}
	
	/*
	 * service�޼ҵ�
	 *  - Ŭ���̾�Ʈ�� ��û�ɶ����� ȣ��ȴ�.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service �޼ҵ� ȣ��");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw =resp.getWriter();
		pw.write("<h1>MyServlet1�� service�޼ҵ� ȣ��..!</h1>");
		pw.write("user->" + user + "<br>");
		pw.write("pwd->" + pwd + "<br>");
		pw.write("url->" + url + "<br>");
		pw.close();
	}
}