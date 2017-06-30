package com.kitri.freeboard.dao;

import java.util.List;
import java.util.Map;

import com.kitri.freeboard.model.BoardDto;
import com.kitri.freeboard.model.FreeBoardDto;

public interface FreeBoardDao {
	int freeBoardWrite (FreeBoardDto dto);

	FreeBoardDto getArticle(int seq);
//	������ �ҷ��� �� pg�� �ƴ� int start, int end�� 
	List<FreeBoardDto> listArticle(Map<String, String> map);
	int replyArticle(FreeBoardDto dto);
	
	int modifyArticle(BoardDto dto);
	int deleteArticle(int seq);
}
