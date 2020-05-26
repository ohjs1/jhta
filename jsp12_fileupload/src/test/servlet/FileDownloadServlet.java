package test.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.FileinfoDao;
import test.vo.FileinfoVo;

@WebServlet("/filedownload")
public class FileDownloadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int filenum =Integer.parseInt(req.getParameter("filenum"));
		FileinfoDao dao =new FileinfoDao();
		//�ٿ�ε��� ���� ���� ������
		FileinfoVo vo =dao.getList(filenum);
		
		//���ϸ��� �ѱ��� ��� �������ʵ��� ���ڵ� ����
		String filename =URLEncoder.encode(vo.getOrgfilename(),"utf-8");
		filename.replaceAll("\\+","%20"); // +�� �������� �ٲ���
		
		//1.�ٿ�ε�â���� �����ϱ�
		resp.setContentType("application/octet-stream");
		resp.setContentLengthLong(vo.getFilesize());
		resp.setHeader("Content-Disposition","attachment;filename=" + filename);
		
		//2.Ŭ���̾�Ʈ�� ���� ������(���Ϻ���)
		String upload =req.getServletContext().getRealPath("/upload");
		
		//���۵� ������ �о���� ���� ���Ͻ�Ʈ�� ��ü
		FileInputStream fis =new FileInputStream(upload + File.separator + vo.getSavafilename());
		
		//Ŭ���̾�Ʈ�� ���ϵ����͸� ����(���) �ϱ����� ��Ʈ�� ��ü
		OutputStream os =resp.getOutputStream();
		BufferedInputStream bis =new BufferedInputStream(fis);
		BufferedOutputStream bos =new BufferedOutputStream(os);
		
		byte[] b =new byte[1024];
		int n =0; 
		while( (n =bis.read(b) ) != -1){
			bos.write(b, 0 , n);
		}
		bos.close();
		bis.close();
	}
}
