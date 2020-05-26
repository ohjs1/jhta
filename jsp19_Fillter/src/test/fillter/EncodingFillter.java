package test.fillter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/*
 * [ Filter ]
 * -Ŭ���̾�Ʈ�� ��û�� �߰��� ����ä�� ��û�������� �������� Ư�� �۾��� ������.
 * ������ ��û�������� ������ �ְ� �ٸ� �������� �̵��� �����ϴ�.
 * -����� ���
 * 1) Filter�������̽��� ��ӹ޾� doFilter�޼ҵ忡�� ó���� �۾��� �����Ѵ�.
 * 2)Web.xml�� ���͸����� �����ϰų� ������̼����� �����Ѵ�.
 * 
 */
public class EncodingFillter implements Filter {
	String encoding;
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFillter() �����!");
		if(encoding==null) {
			request.setCharacterEncoding("utf-8");
			
		} else {
			request.setCharacterEncoding(encoding);
		}
		
		//������ ������ ���Ͱ� �����ϸ� ���͸� �����ϰ� ���̻� ������ ���Ͱ� ������ ����ڰ� ��û�� �������� �̵�
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {
//		System.out.println("destroy() ȣ���!");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("init() ȣ���!");
		encoding =filterConfig.getInitParameter("encoding");
	}
	
}
