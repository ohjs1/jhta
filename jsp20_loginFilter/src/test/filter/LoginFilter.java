package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/member/*")
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		
	}  

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean login =false; //로그인했는지 여부를 저장

		//세션에 아이디가 저장되어있으면 login에 true가 저장되도록 해보세요.
		HttpServletRequest req =(HttpServletRequest)request;	
		HttpSession session =req.getSession();
		String id =(String)session.getAttribute("id");
		
		if(session!=null) {
			if(id!=null) {
				login =true;
			}
		}
		
		if(login) {
			chain.doFilter(request, response);
		} else {
			HttpServletResponse resp =(HttpServletResponse)response;
			resp.sendRedirect(req.getContextPath() + "/login/login.jsp");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
}
