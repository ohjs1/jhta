package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyBoardDao;
import vo.MyBoardVo;

@WebServlet("/board/list")
public class ListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyBoardDao dao =new MyBoardDao();
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum=Integer.parseInt(spageNum);
		}
		
		int startRow=(pageNum-1)*5+1;
		int endRow=startRow+4;
		
		int pageCount=(int)Math.ceil(dao.getMaxCount()/5.0);
		int startPageNum=(pageNum/5)*4+1;
		int endPageNum=startPageNum+3;
		if(pageCount<endPageNum) {
			endPageNum=pageCount;
		}
		
		System.out.println("pageCount:"+pageCount);
		System.out.println("startPageNum:"+startPageNum);
		System.out.println("endPageNum:"+endPageNum);
		System.out.println("pageNum:"+pageNum);
		System.out.println("startRow:"+startRow);
		System.out.println("endRow:"+endRow);
		System.out.println("------------------------------------------");
		
		req.setAttribute("pageCount",pageCount);
		req.setAttribute("startPageNum",startPageNum);
		req.setAttribute("endPageNum",endPageNum);
		req.setAttribute("pageNum",pageNum);
		
		ArrayList<MyBoardVo> list =dao.getList(startRow, endRow);
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/board/list.jsp").forward(req, resp);
	}
}
