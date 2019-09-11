package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import com.yc.biz.UseBiz;
import com.yc.dao.DBHelper;

public class UseBizImpl implements UseBiz {
	private DBHelper db = new DBHelper();

	@Override
	public List<Map<String, Object>> alogin(String name, String pwd) {
		String sql = "select * from admin where acount = ? and password = ?";
		return db.finds(sql, name, pwd);
	}

	@Override
	public int alterImage(String path, int uid) {
		String sql = "update user set photo = ? where uid = ?";
		return db.update(sql, path, uid);
	}

}
