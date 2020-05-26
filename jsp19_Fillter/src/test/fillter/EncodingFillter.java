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
 * -클라이언트의 요청을 중간에 가로채서 요청페이지로 가기전에 특정 작업을 수행함.
 * 수행후 요청페이지로 갈수도 있고 다른 페이지로 이동도 가능하다.
 * -만드는 방법
 * 1) Filter인터페이스를 상속받아 doFilter메소드에서 처리할 작업을 구현한다.
 * 2)Web.xml에 필터매핑을 설정하거나 어노테이션으로 설정한다.
 * 
 */
public class EncodingFillter implements Filter {
	String encoding;
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("doFillter() 실행됨!");
		if(encoding==null) {
			request.setCharacterEncoding("utf-8");
			
		} else {
			request.setCharacterEncoding(encoding);
		}
		
		//다음에 수행할 필터가 존재하면 필터를 수행하고 더이상 수행할 필터가 없으면 사용자가 요청한 페이지로 이동
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {
//		System.out.println("destroy() 호출됨!");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("init() 호출됨!");
		encoding =filterConfig.getInitParameter("encoding");
	}
	
}
