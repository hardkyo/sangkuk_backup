package com.kitri.freeboard.dao;

import java.util.Map;

public interface CommonDao {
	
	int getNextSeq();
	void updateHit(int seq);
	
//	페이징 처리
	int newArticleCount (int bcode);
	int totalArticleCount(Map<String, String> map);
}
