package com.kitri.freeboard.dao;

import java.util.Map;

public interface CommonDao {
	
	int getNextSeq();
	void updateHit(int seq);
	
//	����¡ ó��
	int newArticleCount (int bcode);
	int totalArticleCount(Map<String, String> map);
}
