package com.yc.servlet;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.yc.biz.impl.ManageBizImpl;
import com.yc.util.LoadProperties;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {
	private ManageBizImpl mb = new ManageBizImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("执行了adminServlet的post方法");
		
		String op = null;
		SmartUpload su = null;
		if ( req.getParameter("op") != null ) {
			op = req.getParameter("op");
		} else {
			try {
				su = new SmartUpload();
				su.setCharset("utf-8");
				su.initialize(getServletConfig(), req, resp);
				su.setAllowedFilesList("gif,jpg,png");
				su.setMaxFileSize(1024*1024*2);
				su.setTotalMaxFileSize(1024*1024*10);
				su.upload();
				//获得文本数据
				op = su.getRequest().getParameter("op");
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(op);
		PrintWriter out = resp.getWriter();
		if ( "getAllUser".equals(op) ) {
			getAllUser(req, resp, out);
		} else if ( "getAllContent".equals(op) ) {
			getAllContent(req, resp, out);
		} else if ( "deleteblog".equals(op) ) {
			deleteblog(req, resp, out);
		} else if ( "addcontent".equals(op) ) {
			addcontent(req, resp, out, su);
		} else if ( "getAllAdvise".equals(op) ) {
			getAllAdvise(req, resp, out, su);
		}
	}
	
	//得到所有的用户建议
	private void getAllAdvise(HttpServletRequest req, HttpServletResponse resp, PrintWriter out, SmartUpload su) {
		if ( req.getSession().getAttribute("advises") == null ) {
			List<Map<String, Object>> list = mb.getAllAdvise();
			
			req.getSession().setAttribute("advises", list);
			out.print(1);
		} else {
			out.print(1);
		}
	}

	//部门添加博客
	private void addcontent(HttpServletRequest req, HttpServletResponse resp, PrintWriter out, SmartUpload su) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) req.getSession().getAttribute("admin");
		int aid = (int) list.get(0).get("aid");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		
		String title = su.getRequest().getParameter("title");
		String content = su.getRequest().getParameter("content");
		
		File myfile = su.getFiles().getFile(0);
		Properties pro = LoadProperties.getProperties();
		String path = pro.getProperty("blog");
		java.io.File file = new java.io.File(path);
		if ( !file.exists() ) {
			file.mkdirs();
		}
		String filename = aid + "_" + new Date().getTime() + "." + myfile.getFileExt();
		path += filename;
		
		try {
			myfile.saveAs(path, su.SAVE_PHYSICAL);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = mb.insertBlog(title, content, date, aid, filename);
		
		//刷新session
		getAllContent(req, resp, out);
		
		//out.print(result);
		
	}

	//删除博客
	private void deleteblog(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		//先删除评论再删除博客
		int cresult = mb.deleteComment(cid);
		int bresult = mb.deleteBlog(cid);
		if ( bresult > 0 ) {
			//删除成功，把session里面的数据也删除
//			List<Map<String, Object>> list = (List<Map<String, Object>>) req.getSession().getAttribute("acontents");
//			for (int i = 0;i < list.size();i++ ) {
//				if ( (Integer)list.get(i).get("cid") == cid ) {
//					list.remove(i);
//				}
//			}
//			req.getSession().setAttribute("acontents", list);
			//刷新session
			getAllContent(req, resp, out);
			
			//out.print(1);
		} else {
			out.print(0);
		}
	}

	//得到该部门的所有博客
	private void getAllContent(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) req.getSession().getAttribute("admin");
		int aid = (int) list.get(0).get("aid");
		//System.out.println(aid);
		
		list = mb.getAllContentById(aid);
		
		req.getSession().setAttribute("acontents", list);
		out.print(1);
		
	}

	//得到所有用户
	private void getAllUser(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		if ( req.getSession().getAttribute("users") == null ) {
			List<Map<String, Object>> list = mb.getAllUser();
			
			req.getSession().setAttribute("users", list);
			out.print(1);
		} else {
			out.print(1);
		}
	}

}
