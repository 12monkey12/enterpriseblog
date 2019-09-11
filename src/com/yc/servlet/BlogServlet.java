package com.yc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.biz.impl.ContentBizImpl;
import com.yc.dao.DBHelper;

@WebServlet("/blogServlet")
public class BlogServlet extends HttpServlet {
	private ContentBizImpl cb = new ContentBizImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("运行了blogservlet的post方法");
		PrintWriter out = resp.getWriter();
		
		String op = req.getParameter("op");
		
		if ( "toBlog".equals(op) ) {
			toBlog(req, resp,out);
		} else if ( "changePage".equals(op) ) {
			changePage(req, resp,out);
		} else if ( "readmore".equals(op) ) {
			readmore(req, resp,out);
		} else if ( "comment".equals(op) ) {
			comment(req, resp,out);
		} else if ( "pick".equals(op) ) {
			pick(req, resp,out);
		} else if("toBlog1".equals(op)){
			toBlog1(req,resp,out);
		} else if("toBlog2".equals(op)){
			toBlog2(req,resp,out);
		} else if("toBlog3".equals(op)){
			toBlog3(req,resp,out);
		} else if ( "changePage1".equals(op) ) {
			changePage1(req, resp,out);
		} else if ( "changePage2".equals(op) ) {
			changePage2(req, resp,out);
		} else if ( "changePage3".equals(op) ) {
			changePage3(req, resp,out);
		} else if ( "contact".equals(op) ) {
			contact(req, resp,out);
		}
	}
	
	//提交建议
	private void contact(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String message = req.getParameter("message");
		String subject = req.getParameter("subject");
		message = message.replaceAll("<", "&lt");
		List<Map<String, Object>> user = (List<Map<String, Object>>) req.getSession().getAttribute("user");
		int uid = (int) user.get(0).get("uid");
		SimpleDateFormat sdf = new SimpleDateFormat();
		String addtime = sdf.format(new Date());
		
		int result = cb.submitAdvise(uid, subject, message, addtime);
		out.print(result);
	}

	private void changePage1(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String page = req.getParameter("page");
		
		//存当前页数
		req.getSession().setAttribute("page", page);
		//存contents
		List<Map<String, Object>> list = cb.getContentByPage1(Integer.parseInt(page), 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}
	private void changePage2(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String page = req.getParameter("page");
		
		//存当前页数
		req.getSession().setAttribute("page", page);
		//存contents
		List<Map<String, Object>> list = cb.getContentByPage2(Integer.parseInt(page), 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}
	private void changePage3(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String page = req.getParameter("page");
		
		//存当前页数
		req.getSession().setAttribute("page", page);
		//存contents
		List<Map<String, Object>> list = cb.getContentByPage3(Integer.parseInt(page), 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}
	
	private void toBlog3(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
       List<Map<String, Object>> list = cb.getContent3();
		
		//存当前页数
		req.getSession().setAttribute("page", 1);
		//存总页数
		int pages = list.size()%3 == 0 ? list.size()/3 : list.size()/3 + 1;
		req.getSession().setAttribute("pages", pages);
		//存contents
		list = cb.getContentByPage3(1, 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
		
	}
	private void toBlog2(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
       List<Map<String, Object>> list = cb.getContent2();
		
		//存当前页数
		req.getSession().setAttribute("page", 1);
		//存总页数
		int pages = list.size()%3 == 0 ? list.size()/3 : list.size()/3 + 1;
		req.getSession().setAttribute("pages", pages);
		//存contents
		list = cb.getContentByPage2(1, 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
		
	}
	private void toBlog1(HttpServletRequest req, HttpServletResponse resp,
			PrintWriter out) {
       List<Map<String, Object>> list = cb.getContent1();
		
		//存当前页数
		req.getSession().setAttribute("page", 1);
		//存总页数
		int pages = list.size()%3 == 0 ? list.size()/3 : list.size()/3 + 1;
		req.getSession().setAttribute("pages", pages);
		//存contents
		list = cb.getContentByPage1(1, 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}
	
	//点赞
	private void pick(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		if ( req.getSession().getAttribute("user") == null ) {
			out.print("login");
			return;
		}
		String option = req.getParameter("option");
		String cid = req.getParameter("cid");
		System.out.println(option);
		System.out.println(cid);
		
		int result = cb.alterStar(cid, option);
		System.out.println(result);
		out.print(result);
	}

	//提交评论
	private void comment(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		List<Map<String, Object>> user = (List<Map<String, Object>>) req.getSession().getAttribute("user");
		int uid = (int) user.get(0).get("uid");
		Map<String, Object> readmore = (Map<String, Object>) req.getSession().getAttribute("readmore");
		int cid = (int) readmore.get("cid");
		String comment = req.getParameter("comment");
		comment = comment.replaceAll("<", "&lt");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		
		int result = cb.addComment(uid, cid, comment, date);
		//获取该篇评论数据存到session中
		String id = String.valueOf(cid);
		List<Map<String, Object>> list = cb.getCommentByCid(id);
		req.getSession().setAttribute("comments", list);
				
		out.print(result);
	}

	//阅读更多
	private void readmore(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String cid = req.getParameter("cid");
		
		//获取博客数据存到session中
		List<Map<String, Object>> list = cb.getContentByCid(cid);
		req.getSession().setAttribute("readmore", list.get(0));
		//获取该篇评论数据存到session中
		List<Map<String, Object>> comment = cb.getCommentByCid(cid);
		req.getSession().setAttribute("comments", comment);
		
		out.print(1);
	}

	//分页
	private void changePage(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String page = req.getParameter("page");
		
		//存当前页数
		req.getSession().setAttribute("page", page);
		//存contents
		List<Map<String, Object>> list = cb.getContentByPage(Integer.parseInt(page), 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}

	//第一次进博客页面时初始化session信息
	private void toBlog(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		
		List<Map<String, Object>> list = cb.getAllContent();
		
		//存当前页数
		req.getSession().setAttribute("page", 1);
		//存总页数
		int pages = list.size()%3 == 0 ? list.size()/3 : list.size()/3 + 1;
		req.getSession().setAttribute("pages", pages);
		//存contents
		list = cb.getContentByPage(1, 3);
		req.getSession().setAttribute("contents", list);
		
		out.print(1);
	}

}
