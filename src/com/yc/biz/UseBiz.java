package com.yc.biz;

import java.util.List;
import java.util.Map;

public interface UseBiz {

	//管理员登录
	public List<Map<String, Object>> alogin(String name, String pwd);
	
	public int alterImage(String path, int uid);
}
