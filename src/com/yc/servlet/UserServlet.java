package com.yc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.yc.biz.impl.ContentBizImpl;
import com.yc.biz.impl.ManageBizImpl;
import com.yc.biz.impl.UseBizImpl;
import com.yc.dao.DBHelper;
import com.yc.util.LoadProperties;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private DBHelper db = new DBHelper();
	private UseBizImpl ub = new UseBizImpl();
	private ManageBizImpl mb = new ManageBizImpl();
	private ContentBizImpl cb = new ContentBizImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("执行了userServlet的post方法");
		PrintWriter out = resp.getWriter();
		
		String op = null;
		SmartUpload su = null;
		if ( req.getParameter("op") != null ) {
			op = req.getParameter("op");
		} else {
			su = new SmartUpload();
			su.setCharset("utf-8");
			su.initialize(getServletConfig(), req, resp);
			su.setAllowedFilesList("gif,png,jpg");
			su.setMaxFileSize(1024*1024*2);
			su.setTotalMaxFileSize(1024*1024*10);
			try {
				su.upload();	//上传数据
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			op = su.getRequest().getParameter("op");
		}
		
		if ( "login".equals(op) ) {
			login(req, resp, out);
		} else if ( "register".equals(op) ) {
			register(req, resp, out);
		} else if ( "logout".equals(op) ) {
			logout(req, resp, out);
		} else if ( "alogin".equals(op) ) {
			alogin(req, resp, out);
		} else if ( "alogout".equals(op) ) {
			alogout(req, resp, out);
		} else if ( "alterImage".equals(op) ) {
			alterImage(req, resp, out, su);
		}
	}
	
	//修改头像
	private void alterImage(HttpServletRequest req, HttpServletResponse resp, PrintWriter out, SmartUpload su) {
		List<Map<String, Object>> list = (List<Map<String, Object>>) req.getSession().getAttribute("user");
		int uid = (int) list.get(0).get("uid");
		
		Properties pro = LoadProperties.getProperties();
		String path = pro.getProperty("user");
		//目录如果不存在就创建
		java.io.File file = new java.io.File(path);
		if ( !file.exists() ) {
			file.mkdirs();
		}
		File myfile = su.getFiles().getFile(0);
		String filename = uid + "_" + new Date().getTime() + "." + myfile.getFileExt();
		path += filename;
		
		//上传文件
		try {
			myfile.saveAs(path, SmartUpload.SAVE_PHYSICAL);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//修改数据库
		int result = ub.alterImage(filename, uid);
		//修改session，即时显示信息
		list.get(0).put("photo", filename);
		
		out.print(result);
	}

	//管理员注销
	private void alogout(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		req.getSession().removeAttribute("admin");
		req.getSession().removeAttribute("acontents");
		req.getSession().removeAttribute("users");
		req.getSession().removeAttribute("advises");
		
		out.print(1);
	}

	//管理员登录
	private void alogin(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		
		List<Map<String, Object>> list = ub.alogin(name, pwd);
		if ( list.size() > 0 ) {
			//登录成功,把list存到session中
			req.getSession().setAttribute("admin", list);
			out.print(1);
		} else {
			//登录失败
			out.print(0);
		}
	}

	//用户注销
	private void logout(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		req.getSession().removeAttribute("user");
		req.getSession().removeAttribute("great");
		//req.getSession().removeAttribute("pages");
		//req.getSession().removeAttribute("contents");
		
		out.print(1);
	}

	//用户注册
	private void register(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		//检查邮箱和用户名是否已经存在
		List<Map<String, Object>> list = mb.getAllUser();
		for ( Map<String, Object> map : list ) {
			if ( email.equals(map.get("email")) ) {
				out.print("email");
				return;
			}
		}
		for ( Map<String, Object> map : list ) {
			if ( name.equals(map.get("uname")) ) {
				out.print("name");
				return;
			}
		}
		
		String sql = "insert into user values(null, ?, default, ?, ?, ?)";
		int result = db.update(sql, name, email, password, phone);
		
		out.print(result);
	}

	//用户登录
	private void login(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		String sql = "select * from user where email = ? and password = ?";
		List<Map<String, Object>> list = db.finds(sql, email, password);
		
		if ( list.size() > 0 ) {
			//登录成功,把list存到session中
			req.getSession().setAttribute("user", list);
			
			//得到用户对所有博客的点赞信息
			int uid = (int) list.get(0).get("uid");
			list = cb.getGreatByUid(uid);
			req.getSession().setAttribute("greats", list);
			
			out.print(1);
		} else {
			//登录失败
			out.print(0);
		}
	}
}
