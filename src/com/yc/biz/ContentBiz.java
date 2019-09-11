package com.yc.biz;

import java.util.List;
import java.util.Map;

public interface ContentBiz {

	/**
	 * 获得所有博客
	 * @return
	 */
	public List<Map<String,Object>> getAllContent();
	
	/**
	 * 根据页数来得到博客内容
	 * @param page   当前页数
	 * @param count  每一页的数量
	 * @return
	 */
	public List<Map<String,Object>> getContentByPage(int page, int count);
	
	/**
	 * 根据博客编号获得博客数据，用于阅读更多页面
	 * @param cid   博客编号
	 * @return
	 */
	public List<Map<String,Object>> getContentByCid(String cid);
	
	//添加评论
	public int addComment(int uid, int cid, String comment, String date);
	
	//获取评论
	public List<Map<String,Object>> getCommentByCid(String cid);
	
	//点赞
	public int alterStar(String cid, String option);
	
	//得到用户的点赞信息
	public List<Map<String,Object>> getGreatByUid(int uid);
	
	public List<Map<String, Object>> getContent1();
	public List<Map<String, Object>> getContent2();
	public List<Map<String, Object>> getContent3();

	List<Map<String, Object>> getContentByPage1(int page, int count);

	List<Map<String, Object>> getContentByPage2(int page, int count);

	List<Map<String, Object>> getContentByPage3(int page, int count);
	
	//提交建议
	public int submitAdvise(int uid, String subject, String message, String addtime);
}
