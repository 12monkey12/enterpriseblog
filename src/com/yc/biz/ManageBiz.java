package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.jspsmart.upload.SmartUpload;

public interface ManageBiz {

	public List<Map<String, Object>> getAllUser();
	
	public List<Map<String, Object>> getAllContentById(int id);
	
	public int deleteBlog(int id);
	
	public int insertBlog(String title, String content, String date, int aid, String path);
	
	public int deleteComment(int id);
	
	public List<Map<String, Object>> getAllAdvise();
}
