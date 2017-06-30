package com.kitri.freeboard.service;

import com.kitri.util.PageNavigation;

public interface CommonService {
	int getNextSeq();
	PageNavigation makePageNavigation(int bcode, int pg, String key, String word);
}
