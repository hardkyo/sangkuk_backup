package com.kitri.freeboard.service;

import java.util.HashMap;
import java.util.Map;

import com.kitri.freeboard.dao.CommonDaoImpl;
import com.kitri.util.*;

public class CommonServiceImpl implements CommonService{

	private static CommonService commonService;
	
	static {
		commonService = new CommonServiceImpl ();
	}

	public static final CommonService getCommonService() {
		return commonService;
	}
	
	private CommonServiceImpl () {}
	
	@Override
	public int getNextSeq() {
		int seq = 0;
		seq = CommonDaoImpl.getCommonDao().getNextSeq();
		return seq;
	}

	@Override
	public PageNavigation makePageNavigation(int bcode, int pg, String key, String word) {
		
		PageNavigation pageNavigation = new PageNavigation();
		int newArticleCount = 0;
		newArticleCount = CommonDaoImpl.getCommonDao().newArticleCount(bcode);
		pageNavigation.setNewArticleCount(newArticleCount);
		
		Map<String, String> map = new HashMap<>();
		map.put("bcode", bcode + "");
		map.put("key", key);
		map.put("word", word);
		
		int totalArticleCount = 0;
		totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCount(map);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		
		int totalPageCount = 0;
		totalPageCount = (totalArticleCount -1)/Constant.LIST_SIZE + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		
		boolean isFirst = false;
		isFirst = pg <= Constant.PAGE_SIZE;
		pageNavigation.setNowFirst(isFirst); //이전을 못 누를 때 true
		
		boolean isEnd = false;
//		isEnd = (totalPageCount - 1) / Constant.PAGE_SIZE * Constant.PAGE_SIZE < pg;
		isEnd = (int)((pg-1)/10) == (int)((totalPageCount-1)/10);
		pageNavigation.setNowEnd(isEnd);
		//31-1 30 36 37-1 T
		//30-1 29 36 37-1 F
		//30-1 29 39 40-1 F
		//40-1 39 39 40-1 T
		//(pg-1)/10 = (tp-1)/10 => true >> 마지막 페이지 싸이즈
		
		pageNavigation.setPageNo(pg);
	
		return pageNavigation;
	}

}
