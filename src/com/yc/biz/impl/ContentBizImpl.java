package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import com.yc.biz.ContentBiz;
import com.yc.dao.DBHelper;

public class ContentBizImpl implements ContentBiz {
	private DBHelper db = new DBHelper();

	@Override
	public List<Map<String, Object>> getContentByPage(int page, int count) {
		String sql = "select * from contents c,admin a where c.aid = a.aid limit " + (page - 1)*count + "," + count;
		return db.finds(sql);
	}

	@Override
	public List<Map<String, Object>> getAllContent() {
		String sql = "select * from contents c,admin a where c.aid = a.aid";
		return db.finds(sql);
	}

	@Override
	public List<Map<String, Object>> getContentByCid(String cid) {
		String sql = "select * from contents c,admin a where c.aid = a.aid and cid = ?";
		
		return db.finds(sql, cid);
	}

	@Override
	public int addComment(int uid, int cid, String comment, String date) {
		String sql = "insert into comments values(null, ?, ?, ?, ?)";
		return db.update(sql, uid, cid, comment, date);
	}

	@Override
	public List<Map<String, Object>> getCommentByCid(String cid) {
		String sql = "select * from comments m,user u where m.uid = u.uid and m.cid = ?";
		return db.finds(sql, cid);
	}

	@Override
	public int alterStar(String cid, String option) {
		String sql = null;
		int result = 0;
		if ( "add".equals(option) ) {
			sql = "update contents set star = star + 1 where cid = ?";
			result = db.update(sql, cid);
		} else if ( "subtract".equals(option) ) {
			sql = "update contents set star = star - 1 where cid = ?";
			result = db.update(sql, cid);
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getGreatByUid(int uid) {
		String sql = "select * from great where uid = ?";
		return db.finds(sql, uid);
	}

	@Override
	public List<Map<String, Object>> getContent1() {
		String sql = "select * from contents c,admin a where c.aid = a.aid and a.aid=1";
		return db.finds(sql);

	}

	@Override
	public List<Map<String, Object>> getContent2() {
		String sql = "select * from contents c,admin a where c.aid = a.aid and a.aid=2";
		return db.finds(sql);

	}

	@Override
	public List<Map<String, Object>> getContent3() {
		String sql = "select * from contents c,admin a where c.aid = a.aid and a.aid=3";
		return db.finds(sql);

	}

	@Override
	public List<Map<String, Object>> getContentByPage1(int page, int count) {
		String sql = "select * from contents c,admin a where c.aid = a.aid  and a.aid=1 limit "
				+ (page - 1) * count + "," + count;
		return db.finds(sql);

	}

	@Override
	public List<Map<String, Object>> getContentByPage2(int page, int count) {
		String sql = "select * from contents c,admin a where c.aid = a.aid  and a.aid=2 limit "
				+ (page - 1) * count + "," + count;
		return db.finds(sql);

	}

	@Override
	public List<Map<String, Object>> getContentByPage3(int page, int count) {
		String sql = "select * from contents c,admin a where c.aid = a.aid  and a.aid=3 limit "
				+ (page - 1) * count + "," + count;
		return db.finds(sql);

	}

	@Override
	public int submitAdvise(int uid, String subject, String message, String addtime) {
		String sql = "insert into contact values(null, ?, ?, ?, ?)";
		return db.update(sql, uid, subject, message, addtime);
	}

	
}
