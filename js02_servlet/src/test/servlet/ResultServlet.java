package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/result.do")
public class ResultServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num1 =Integer.parseInt(req.getParameter("num1"));
		int num2 =Integer.parseInt(req.getParameter("num2"));
		
		int sum =num1 + num2;
		
		System.out.println(num1);
		System.out.println(num2);
		resp.setContentType("text/html;charset=utf-8");
		//������ ������ Ÿ�԰� ���ڵ���� ����
		PrintWriter pw =resp.getWriter();
		pw.print("<html>");
		pw.print("<head></head>");
		pw.print("<body>");
		pw.print("<h1>�μ��� ����</h1>");
		pw.print("��:" + sum + "<br>");
		pw.print("</body>");
		pw.print("</html>");
		pw.close();
	}
}