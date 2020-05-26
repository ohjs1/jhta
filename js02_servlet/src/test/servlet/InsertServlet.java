package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * [����]
 * -�����ø����̼ǿ��� ����Ǵ� �ڹ�Ŭ����(�����ø����̼ǿ��� ����Ǵ� ���� ���α׷�)
 * -Ŭ���̾�Ʈ�� ��û�� �ް� Ŭ���̾�Ʈ�� �����Ҽ��ִ�.
 * -����� ���
 * 1.HttpServlet ��ӹ޴´�.
 * 2.service�޼ҵ带 �������̵� �Ѵ�. ->��û�� ���信 ���õ� �۾� ����
 * 3.������ ȣ���� ��θ� �����Ѵ�.(������̼� �Ǵ� web.xml���� ����)
 * 4.���ε� ��η� ������ ȣ���Ѵ�.
 */

@WebServlet("/insert.do") //���� ��Ī�ϱ�
public class InsertServlet extends HttpServlet {
	/*
	 * request : ��û�� ���õ� ������ ����� ���� ��ü
	 * response : ���信 ���õ� ������ ����� ���� ��ü
	 * 
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id =request.getParameter("id");
		String pwd =request.getParameter("pwd");
		String email =request.getParameter("email");
		System.out.println("<<����ڰ� ������ ����>>");
		System.out.println("id:" + id);
		System.out.println("pwd:" + pwd);
		System.out.println("email:" + email);
		
		response.setContentType("text/html;charset=utf-8");
		//������ ������ Ÿ�԰� ���ڵ���� ����
		
		PrintWriter pw =response.getWriter();
		pw.print("<html>");
		pw.print("<head></head>");
		pw.print("<body>");
		pw.print("<h1>����ڰ� ������ ����</h1>");
		pw.print("id:" + id + "<br>");
		pw.print("pwd:" + pwd + "<br>");
		pw.print("email:" + email + "<br>");
		pw.print("</body>");
		pw.print("</html>");
		pw.close();
	}
}


