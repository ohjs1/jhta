package test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import test.dao.CommentsDao;
import test.vo.CommentsVo;

@WebServlet("/comments.do")
public class CommentsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommentsDao dao =CommentsDao.getInstance();
		int mnum =Integer.parseInt(req.getParameter("mnum"));
		ArrayList<CommentsVo> list =dao.listAll(mnum);
		
		JSONArray jarr =new JSONArray();
		
		
		for(CommentsVo vo : list) {
			JSONObject json =new JSONObject();
			json.put("mnum", vo.getNum());
			json.put("id", vo.getId());
			json.put("comments", vo.getComments());
			jarr.put(json);
		}
		
		resp.setContentType("text/plain; charset=utf-8");
		PrintWriter pw =resp.getWriter();
		pw.print(jarr);
	}
}
