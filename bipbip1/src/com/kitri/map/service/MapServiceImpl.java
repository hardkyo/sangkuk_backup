package com.kitri.map.service;

import java.util.*;

import com.kitri.map.dao.MapDaoImpl;
import com.kitri.map.model.MapDto;
import com.kitri.util.Constant;

public class MapServiceImpl implements MapService {
	
	private static MapService mapService;
	
	public static MapService getMapService() {
		return mapService;
	}

	static {
		mapService = new MapServiceImpl();
	}

	@Override
	public int writeMapArticle(MapDto mapDto) {
		// TODO 경로 등록
		System.out.println("At your service");
		return MapDaoImpl.getMapDao().writeMapArticle(mapDto);
	}

	@Override
	public MapDto getMapArticle(int seq) {
		// TODO 경로 출력
		return MapDaoImpl.getMapDao().getMapArticle(seq);
	}

	@Override
	public List<MapDto> listMapArticle(int bcode, int pg, String key, String word) {
		// TODO 경로 목록
		int end = pg*Constant.LIST_SIZE;
		int start = end-Constant.LIST_SIZE;
		Map<String, String> map = new HashMap<String, String>();
		map.put("bcode", bcode+"");
		map.put("key", key);
		map.put("word", word);
		map.put("start", start+"");
		map.put("end", end+"");
		return MapDaoImpl.getMapDao().listMapArticle(map);
	}

	@Override
	public int modifyArticle(MapDto mapDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
