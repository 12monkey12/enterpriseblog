package com.yc.biz.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.yc.biz.ManageBiz;
import com.yc.dao.DBHelper;

public class ManageBizImpl implements ManageBiz {
	private DBHelper db = new DBHelper();

	@Override
	public List<Map<String, Object>> getAllUser() {
		String sql = "select * from user order by uid";
		return db.finds(sql);
	}

	@Override
	public List<Map<String, Object>> getAllContentById(int id) {
		String sql = "select * from contents where aid = ? order by cid";
		return db.finds(sql, id);
	}

	@Override
	public int deleteBlog(int id) {
		String sql = "delete from contents where cid = ?";
		return db.update(sql, id);
	}

	@Override
	public int insertBlog(String title, String content, String date, int aid, String filename) {
		String sql = "insert into contents values(null, ?, ?, ?, ?, ?, default)";
		int result = db.update(sql, aid, date, title, content, filename);
		
		return result;
	}

	@Override
	public int deleteComment(int id) {
		String sql = "delete from comments where cid = ?";
		return db.update(sql, id);
	}

	@Override
	public List<Map<String, Object>> getAllAdvise() {
		String sql = "select * from contact c,user u where c.uid = u.uid order by id";
		return db.finds(sql);
	}

}
